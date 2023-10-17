(customizing-plots)=

# Customizing plots

```{objectives}
- Know where to look to find out how to tweak plots
- Be able to prepare a plot for publication
- Know how to tweak example plots from a gallery for your own purpose
- Start with a relatively simple example and build up more and more features
```

[this lesson is adapted from <https://aaltoscicomp.github.io/python-for-scicomp/data-visualization/>]


## Styling and customizing plots

- Before you customize plots "manually" using a graphical program, please
  consider how this affects reproducibility.
- **Try to minimize manual post-processing**. This might bite you when you
  need to regenerate 50 figures one day before submission deadline or
  regenerate a set of figures after the person who created them left the group.
- All the plotting libraries in Python allow to customize almost every aspect
  of a plot.


## Starting point

This is where we left off at the end of {ref}`first-plot`:

```python
# import necessary libraries
import altair as alt
import pandas as pd

# read the data
url_prefix = "https://raw.githubusercontent.com/plotly/datasets/master/"
data = pd.read_csv(url_prefix + "gapminder_with_codes.csv")

# generate an interactive plot
alt.Chart(data).mark_point().encode(
    x=alt.X("gdpPercap").scale(type="log").title("GDP per capita (PPP dollars)"),
    y=alt.Y("lifeExp").title("Life expectancy (years)"),
    color="continent",
).transform_filter(alt.datum.year == 2007).interactive()
```

```{figure} img/first-plot/axis-titles.svg
:alt: Our example plot at the end of "Generating our first plot" episode.

Our example plot at the end of {ref}`first-plot`.
```


## Title and axis values

In the next step we modify a number of things:
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

```{figure} img/customizing/with-title.svg
:alt: Plot after adding a figure title.

The plot is starting to look better!
```


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

```{figure} img/customizing/dark2.svg
:alt: The plot after adjusting circles and colors.

The plot after adjusting circles and colors.
```

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

```{figure} img/customizing/okabe-ito.svg
:alt: Adjusting colors to those recommended by Okabe and Ito.

Adjusting colors to those recommended by Okabe and Ito.
```

```{discussion} Why these colors?
This qualitative color palette is opimized for all color-vision
deficiencies, see <https://clauswilke.com/dataviz/color-pitfalls.html> and
[Okabe, M., and K. Ito. 2008. "Color Universal Design (CUD):
How to Make Figures and Presentations That Are Friendly to Colorblind People."](http://jfly.iam.u-tokyo.ac.jp/color/).
```


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

```{figure} img/customizing/with-subtitle.svg
:alt: More tweaking towards a publication-ready figure.
```


## Interactive charts

With not too many changes we can make the chart interactive and add a slider
for the year (please try this in the notebook):
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

```{figure} img/customizing/with-annotation.svg
:alt: Chart with extra annotation.
```


## Saving the chart as web page

You can save the chart as a web site and try to open it in a separate browser
tab and put it on your home page or research group website:
```python
chart.save("chart.html")
```


## Themes

In [Vega-Altair](https://altair-viz.github.io/) you can change the theme and
select from a long [list of themes](https://github.com/vega/vega-themes).  On
top of your notebook try to add:
```python
alt.themes.enable('dark')
```
Then re-run all cells. Later you can try some other themes such as:
- `fivethirtyeight`
- `latimes`
- `urbaninstitute`

You can even define your own themes!

---

## Exercise

In this exercise we can try to adapt existing scripts to either **tweak how the
plot looks** or to **modify the input data**.  This is very close to real life:
there are so many options and possibilities and it is almost impossible to
remember everything so this strategy is useful to practice:
- Select an example that is close to what you have in mind
- Being able to adapt it to your needs
- Being able to search for help
- Being able to understand help request answers (not easy)

```{challenge} Exercise Customization-1: Adapting a gallery example
**This is a great exercise which is very close to real life.**

- Browse the [Vega-Altair example gallery](https://altair-viz.github.io/gallery/index.html).
- Select one example that is close to your current/recent visualization project
  or simply interests you.
- First try to reproduce this example, as-is, in the Jupyter Notebook.
- Then try to print out the data that is used in this example just before the call of the plotting function
  to learn about its structure.
- Then try to modify the data a bit.
- If you have time, try to feed it different, simplified data.
  This will be key for adapting the examples to your projects.
```

```{discussion}
After the exercises, the group can discuss their findings and it is important to
clarify questions at this point before moving on.
```

```{keypoints}
- Think about color-vision deficiencies when choosing colors. Use existing
  solutions for this problem.
```
