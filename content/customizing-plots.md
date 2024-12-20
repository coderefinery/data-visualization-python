# Customizing plots

:::{objectives}
- Know where to look to find out how to tweak plots
- Start with a relatively simple example and build up more and more features
- See the process of going from a raw plot towards a publication-ready plot
- We will build up
  [this notebook](https://nbviewer.org/github/coderefinery/data-visualization-python/blob/main/notebooks/customizing.ipynb)
  (spoiler alert!)
:::


## Loading and plotting a dataset

In this lesson will work with one of the
[Gapminder](https://www.gapminder.org/tools/) datasets.

Let us together read and plot the data and then we explain what is happening
and we will improve the figure together.  First we read and inspect the data:
```python
# import necessary libraries
import altair as alt
import pandas as pd

# read the data
url_prefix = "https://raw.githubusercontent.com/plotly/datasets/master/"
data = pd.read_csv(url_prefix + "gapminder_with_codes.csv")

# print overview of the dataset
data
```

With very few lines we can get the first raw plot:
```python
alt.Chart(data).mark_point().encode(
    x="gdpPercap",
    y="lifeExp",
)
```

:::{figure} img/gapminder/all-data.svg
:alt: First raw plot with all countries and all years.

First raw plot with all countries and all years.
:::

Observe how we connect (encode) **visual channels** to data columns:
- x-coordinate with "gdpPercap"
- y-coordinate with "lifeExp"

The following code would have the same effect but the above version might be
easier to read:
```python
alt.Chart(data).mark_point().encode(x="gdpPercap", y="lifeExp")
```

:::{discussion} Let us pause and explain the code
- `alt` is a short-hand for `altair` which we imported on top of the notebook
- `Chart()` is a function defined inside `altair` which takes the data as argument
- `mark_point()` is a function that produces scatter plots
- `encode()` is a function which encodes data columns to visual channels
:::


## Filtering data

In [Vega-Altair](https://altair-viz.github.io) we can chain functions.  Let us
add two more functions: The first will apply a filter, the second will make the
plot interactive:
```{code-block} python
---
emphasize-lines: 4
---
alt.Chart(data).mark_point().encode(
    x="gdpPercap",
    y="lifeExp",
).transform_filter(alt.datum.year == 2007).interactive()
```

:::{figure} img/gapminder/only-2007.svg
:alt: Now we only keep the year 2007.

Now we only keep the year 2007.
:::

Alternatively, we could have filtered the data before plotting using pandas.


## Using color as additional channel

A very neat feature of [Vega-Altair](https://altair-viz.github.io) is that it
is easy to add and modify visual channels. Let us try to add one more so that
we do something with the "continent" data column:
```{code-block} python
---
emphasize-lines: 4
---
alt.Chart(data).mark_point().encode(
    x="gdpPercap",
    y="lifeExp",
    color="continent",
).transform_filter(alt.datum.year == 2007).interactive()
```

:::{figure} img/gapminder/color.svg
:alt: Using different colors for different continents.

Using different colors for different continents.
:::


## Changing to log scale

For this data set we will get a better insight when switching the x-axis from
linear to log scale:
```{code-block} python
---
emphasize-lines: 2-3
---
alt.Chart(data).mark_point().encode(
    x=alt.X("gdpPercap").scale(type="log"),
    y=alt.Y("lifeExp"),
    color="continent",
).transform_filter(alt.datum.year == 2007).interactive()
```

:::{figure} img/gapminder/log-scale.svg
:alt: Changing the x axis to log scale.

Changing the x axis to log scale.
:::


## Improving axis titles

```{code-block} python
---
emphasize-lines: 2-3
---
alt.Chart(data).mark_point().encode(
    x=alt.X("gdpPercap").scale(type="log").title("GDP per capita (PPP dollars)"),
    y=alt.Y("lifeExp").title("Life expectancy (years)"),
    color="continent",
).transform_filter(alt.datum.year == 2007).interactive()
```

:::{figure} img/gapminder/axis-titles.svg
:alt: Improving the axis titles.

Improving the axis titles.
:::


## Faceted charts

To see what faceted charts are and how easy it is to do this, add the following
line:
```{code-block} python
---
emphasize-lines: 5
---
alt.Chart(data).mark_point().encode(
    x=alt.X("gdpPercap").scale(type="log").title("GDP per capita (PPP dollars)"),
    y=alt.Y("lifeExp").title("Life expectancy (years)"),
    color="continent",
    row="continent",
).transform_filter(alt.datum.year == 2007).interactive()
```

Guess what happens when you change `row="continent"` to `column="continent"`?


## Changing from points to circles

Let us add one more visual channel, mapping size of the circle to the
population size of a country:
```{code-block} python
---
emphasize-lines: 1,5
---
alt.Chart(data).mark_circle().encode(
    x=alt.X("gdpPercap").scale(type="log").title("GDP per capita (PPP dollars)"),
    y=alt.Y("lifeExp").title("Life expectancy (years)"),
    color="continent",
    size="pop",
).transform_filter(alt.datum.year == 2007).interactive()
```

:::{figure} img/gapminder/population-size.svg
:alt: Circle sizes are proportional to population sizes.

Circle sizes are proportional to population sizes.
:::


## Title and axis values

In the next step we modify a number of things:
- We go back to the version where all circles have the same size
- Add figure title
- Modify axis domains to "zoom into" the interesting part of the plot
- Set axis values
- Change from `mark_point()` to `mark_circle()`
- Invoke `interactive()` in a separate step

```python
chart = (
    alt.Chart(
        data,
        title=alt.Title("Life expectancy as function of the gross domestic product"),
    )
    .mark_circle()
    .encode(
        x=alt.X("gdpPercap", axis=alt.Axis(values=[100, 1000, 10000, 100000]))
        .scale(type="log", domain=(200, 100000))
        .title("GDP per capita (PPP dollars)"),
        y=alt.Y("lifeExp", axis=alt.Axis(values=[20, 30, 40, 50, 60, 70, 80]))
        .title("Life expectancy (years)")
        .scale(domain=(20, 85)),
        color="continent",
    )
    .transform_filter(alt.datum.year == 2007)
)

chart.interactive()
```

:::{figure} img/customizing/with-title.svg
:alt: Plot after adding a figure title.

The plot is starting to look better!
:::


## Colors

In the next step we change the color scheme ([list of all
schemes](https://vega.github.io/vega/docs/schemes/)), make the circles larger
and slightly transparent:
```{code-block} python
---
emphasize-lines: 6, 14
---
chart = (
    alt.Chart(
        data,
        title=alt.Title("Life expectancy as function of the gross domestic product"),
    )
    .mark_circle(opacity=0.8, size=100.0)
    .encode(
        x=alt.X("gdpPercap", axis=alt.Axis(values=[100, 1000, 10000, 100000]))
        .scale(type="log", domain=(200, 100000))
        .title("GDP per capita (PPP dollars)"),
        y=alt.Y("lifeExp", axis=alt.Axis(values=[20, 30, 40, 50, 60, 70, 80]))
        .title("Life expectancy (years)")
        .scale(domain=(20, 85)),
        color=alt.Color("continent").scale(scheme="dark2"),
    )
    .transform_filter(alt.datum.year == 2007)
)

chart.interactive()
```

:::{figure} img/customizing/dark2.svg
:alt: The plot after adjusting circles and colors.

The plot after adjusting circles and colors.
:::

We can also define own colors:
```{code-block} python
---
emphasize-lines: 1-10, 25
---
okabe_ito = [
    "#0072b2",
    "#e69f00",
    "#cc79a7",
    "#009e73",
    "#f0e442",
    "#000000",
    "#d55e00",
    "#56b4e9",
]

chart = (
    alt.Chart(
        data,
        title=alt.Title("Life expectancy as function of the gross domestic product"),
    )
    .mark_circle(opacity=0.8, size=100.0)
    .encode(
        x=alt.X("gdpPercap", axis=alt.Axis(values=[100, 1000, 10000, 100000]))
        .scale(type="log", domain=(200, 100000))
        .title("GDP per capita (PPP dollars)"),
        y=alt.Y("lifeExp", axis=alt.Axis(values=[20, 30, 40, 50, 60, 70, 80]))
        .title("Life expectancy (years)")
        .scale(domain=(20, 85)),
        color=alt.Color("continent").scale(range=okabe_ito),
    )
    .transform_filter(alt.datum.year == 2007)
)

chart.interactive()
```

:::{figure} img/customizing/okabe-ito.svg
:alt: Adjusting colors to those recommended by Okabe and Ito.

Adjusting colors to those recommended by Okabe and Ito.
:::

:::{discussion} Why these colors?
This qualitative color palette is optimized for all color-vision
deficiencies, see <https://clauswilke.com/dataviz/color-pitfalls.html> and
[Okabe, M., and K. Ito. 2008. "Color Universal Design (CUD):
How to Make Figures and Presentations That Are Friendly to Colorblind People."](http://jfly.iam.u-tokyo.ac.jp/color/).
:::


## More tweaking towards a publication-ready figure

Let us add a subtitle and adjust sizing and positioning:
```{code-block} python
---
emphasize-lines: 6-11, 27-44
---
chart = (
    alt.Chart(
        data,
        title=alt.Title(
            "Life expectancy as function of the gross domestic product",
            subtitle=[
                "Gross domestic product (GDP) per capita measures the value of everything",
                "produced in a country during a year, divided by the number of people.",
                "The unit is in purchasing power parities (PPP dollars), fixed to 2017 prices.",
                "Data is adjusted for inflation and differences in the cost of living between countries.",
            ],
        ),
    )
    .mark_circle(opacity=0.8, size=100.0)
    .encode(
        x=alt.X("gdpPercap", axis=alt.Axis(values=[100, 1000, 10000, 100000]))
        .scale(type="log", domain=(200, 100000))
        .title("GDP per capita (PPP dollars)"),
        y=alt.Y("lifeExp", axis=alt.Axis(values=[20, 30, 40, 50, 60, 70, 80]))
        .title("Life expectancy (years)")
        .scale(domain=(20, 85)),
        color=alt.Color("continent").scale(range=okabe_ito),
    )
    .transform_filter(alt.datum.year == 2007)
)

chart = chart.configure_axis(labelFontSize=20, titleFontSize=20)

chart = chart.properties(width=600, height=500)

chart = chart.configure_title(
    fontSize=20,
    subtitleFontSize=20,
    anchor="start",
    orient="bottom",
    offset=20,
    subtitleColor="gray",
)

chart = chart.configure_legend(
    titleFontSize=20,
    labelFontSize=20,
    padding=10,
)

chart.interactive()
```

:::{figure} img/customizing/with-subtitle.svg
:alt: More tweaking towards a publication-ready figure.
:::


## Interactive charts

With not too many changes we can make the chart interactive and add a slider
for the year (please try this in [this
notebook](https://nbviewer.org/github/coderefinery/data-visualization-python/blob/main/notebooks/customizing.ipynb)):
```{code-block} python
---
emphasize-lines: 1-2, 27-28
---
year_slider = alt.binding_range(min=1952, max=2007, step=5, name="Year")
slider_selection = alt.selection_point(bind=year_slider, fields=["year"], value=2007)

chart = (
    alt.Chart(
        data,
        title=alt.Title(
            "How life expectancy and gross domestic product evolved over time",
            subtitle=[
                "Gross domestic product (GDP) per capita measures the value of everything",
                "produced in a country during a year, divided by the number of people.",
                "The unit is in purchasing power parities (PPP dollars), fixed to 2017 prices.",
                "Data is adjusted for inflation and differences in the cost of living between countries.",
            ],
        ),
    )
    .mark_circle(opacity=0.8, size=100.0)
    .encode(
        x=alt.X("gdpPercap", axis=alt.Axis(values=[100, 1000, 10000, 100000]))
        .scale(type="log", domain=(200, 100000))
        .title("GDP per capita (PPP dollars)"),
        y=alt.Y("lifeExp", axis=alt.Axis(values=[20, 30, 40, 50, 60, 70, 80]))
        .title("Life expectancy (years)")
        .scale(domain=(20, 85)),
        color=alt.Color("continent").scale(range=okabe_ito),
    )
    .add_params(slider_selection)
    .transform_filter(slider_selection)
)

chart = chart.configure_axis(labelFontSize=20, titleFontSize=20)

chart = chart.properties(width=600, height=500)

chart = chart.configure_title(
    fontSize=20,
    subtitleFontSize=20,
    anchor="start",
    orient="bottom",
    offset=20,
    subtitleColor="gray",
)

chart = chart.configure_legend(
    titleFontSize=20,
    labelFontSize=20,
    padding=10,
)

chart.interactive()
```


## Adding more annotation

With few more lines we can add extra annotation that can help to highlight
certain aspects of the plot and to tell a story:
```{code-block} python
---
emphasize-lines: 31-46
---
year_slider = alt.binding_range(min=1952, max=2007, step=5, name="Year")
slider_selection = alt.selection_point(bind=year_slider, fields=["year"], value=2007)

chart = (
    alt.Chart(
        data,
        title=alt.Title(
            "How life expectancy and gross domestic product evolved over time",
            subtitle=[
                "Gross domestic product (GDP) per capita measures the value of everything",
                "produced in a country during a year, divided by the number of people.",
                "The unit is in purchasing power parities (PPP dollars), fixed to 2017 prices.",
                "Data is adjusted for inflation and differences in the cost of living between countries.",
            ],
        ),
    )
    .mark_circle(opacity=0.8, size=100.0)
    .encode(
        x=alt.X("gdpPercap", axis=alt.Axis(values=[100, 1000, 10000, 100000]))
        .scale(type="log", domain=(200, 100000))
        .title("GDP per capita (PPP dollars)"),
        y=alt.Y("lifeExp", axis=alt.Axis(values=[20, 30, 40, 50, 60, 70, 80]))
        .title("Life expectancy (years)")
        .scale(domain=(20, 85)),
        color=alt.Color("continent").scale(range=okabe_ito),
    )
    .add_params(slider_selection)
    .transform_filter(slider_selection)
)

annotation = (
    alt.Chart(data)
    .encode(
        x="gdpPercap",
        y="lifeExp",
        text="country",
        color=alt.value("black"),
    )
    .transform_filter((slider_selection) & (alt.datum.country == "Norway"))
)

chart = (
    chart
    + annotation.mark_point(size=100.0)
    + annotation.mark_text(size=15, xOffset=10, align="left", baseline="middle")
)

chart = chart.configure_axis(labelFontSize=20, titleFontSize=20)

chart = chart.properties(width=600, height=500)

chart = chart.configure_title(
    fontSize=20,
    subtitleFontSize=20,
    anchor="start",
    orient="bottom",
    offset=20,
    subtitleColor="gray",
)

chart = chart.configure_legend(
    titleFontSize=20,
    labelFontSize=20,
    padding=10,
)

chart.interactive()
```

:::{figure} img/customizing/with-annotation.svg
:alt: Chart with extra annotation.
:::


## Saving the chart as web page

You can save the chart as a web site and try to open it in a separate browser
tab and put it on your home page or research group website:
```python
chart.save("chart.html")
```
