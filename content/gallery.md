# Learning how to adapt existing gallery examples

In this exercise we can try to adapt existing scripts to either **tweak how the
plot looks** or to **modify the input data**.  This is very close to real life:
there are so many options and possibilities and it is almost impossible to
remember everything so this strategy is useful to practice:
- Select an example that is close to what you have in mind
- Being able to adapt it to your needs
- Being able to search for help

::::{exercise} Exercise: Adapting a gallery example
**This is a great exercise which is very close to real life.**

- Browse the [Vega-Altair example gallery](https://altair-viz.github.io/gallery/index.html).
- Select one example that is close to your current/recent visualization project
  or simply interests you.
- First try to reproduce this example, as-is, in the Jupyter Notebook.
- **If you get the error "ModuleNotFoundError: No module named
  'vega_datasets'", then try one of these examples:** (they do not need the "vega_datasets" module)
  - [Slider cutoff](https://altair-viz.github.io/gallery/slider_cutoff.html)
    (**below you can find a walk-through for this example**)
  - [Multi-Line tooltip](https://altair-viz.github.io/gallery/multiline_tooltip_standard.html)
  - [Heatmap](https://altair-viz.github.io/gallery/simple_heatmap.html)
  - [Layered histogram](https://altair-viz.github.io/gallery/layered_histogram.html)
- Then try to print out the data that is used in this example just before the call of the plotting function
  to learn about its structure. Consider writing the data to file before changing it.
- Then try to modify the data a bit.
- If you have time, try to feed it different, simplified data.
  **This will be key for adapting the examples to your projects.**

:::{solution} Example walk-through for the slider cutoff example
In this walk-through I imagine browsing: <https://altair-viz.github.io/gallery/index.html>

Then this example caught my eye: <https://altair-viz.github.io/gallery/slider_cutoff.html>

I then copy-paste the example code into a notebook and try to run it and I get
the same result.

Next, there is a lot of code that I don't (need to) understand yet but my eyes are trying to find
`alt.Chart` which tells me that the data must be the "df" in `alt.Chart(df)`:
```{code-block} python
---
emphasize-lines: 15
---
import altair as alt
import pandas as pd
import numpy as np

rand = np.random.RandomState(42)

df = pd.DataFrame({
    'xval': range(100),
    'yval': rand.randn(100).cumsum()
})

slider = alt.binding_range(min=0, max=100, step=1)
cutoff = alt.param(bind=slider, value=50)

alt.Chart(df).mark_point().encode(
    x='xval',
    y='yval',
    color=alt.condition(
        alt.datum.xval < cutoff,
        alt.value('red'), alt.value('blue')
    )
).add_params(
    cutoff
)
```

My next step will be to print out the data `df` just before the call to `alt.Chart`:
```{code-block} python
---
emphasize-lines: 15
---
import altair as alt
import pandas as pd
import numpy as np

rand = np.random.RandomState(42)

df = pd.DataFrame({
    'xval': range(100),
    'yval': rand.randn(100).cumsum()
})

slider = alt.binding_range(min=0, max=100, step=1)
cutoff = alt.param(bind=slider, value=50)

print(df)

alt.Chart(df).mark_point().encode(
    x='xval',
    y='yval',
    color=alt.condition(
        alt.datum.xval < cutoff,
        alt.value('red'), alt.value('blue')
    )
).add_params(
    cutoff
    )
```

The print reveals that `df` is a dataframe which contains x and y values:
```text
    xval       yval
0      0   0.496714
1      1   0.358450
2      2   1.006138
3      3   2.529168
4      4   2.295015
..   ...        ...
95    95 -10.712354
96    96 -10.416233
97    97 -10.155178
98    98 -10.150065
99    99 -10.384652

[100 rows x 2 columns]
```

The next thing that often helps me is to save the data to a comma-separated
values (CSV) file:
```python
import pandas as pd

df.to_csv("data.csv", index=False)
```

I then open the file in an editor and see that it contains 100 rows:
```text
xval,yval
0,0.4967141530112327
1,0.358449851840048
2,1.0061383899407406
3,2.5291682463487657
4,2.2950148716254297
5,2.060877914676249
6,3.6400907301836405
7,4.407525459336549
8,3.938051073401597
9,4.4806111169875615
...
```

Saving the data to file often helps me to see the structure of the data and now
I am in a position to replace this with my own data. I create a file called
"mydata.csv" and there I use the maximum temperatures for months 1-10 from the
Tromso monthly data which we used further up:
```text
xval,yval
01,7.7
02,6.6
03,4.5
04,9.8
05,17.7
06,25.4
07,26.7
08,25.1
09,19.3
10,9.8
```

In the notebook I then verify that the reading of the data works:
```python
mydata = pd.read_csv("mydata.csv")

mydata
```

Now I can replace the example with my own data (note how I now can comment out
some code that I don't need any longer):
```{code-block} python
---
emphasize-lines: 16
---
import altair as alt
import pandas as pd
# import numpy as np

# rand = np.random.RandomState(42)

# df = pd.DataFrame({
#     'xval': range(100),
#     'yval': rand.randn(100).cumsum()
# })

slider = alt.binding_range(min=0, max=100, step=1)
cutoff = alt.param(bind=slider, value=50)

# print(df)
df = pd.read_csv("mydata.csv")

alt.Chart(df).mark_point().encode(
    x='xval',
    y='yval',
    color=alt.condition(
        alt.datum.xval < cutoff,
        alt.value('red'), alt.value('blue')
    )
).add_params(
    cutoff
    )
```

Seems to work! I then make few more adjustments (I want the slider to work on
the y-axis and have a more reasonable default):
```{code-block} python
---
emphasize-lines: 4,5,13
---
import altair as alt
import pandas as pd

slider = alt.binding_range(min=0, max=30, step=1)
cutoff = alt.param(bind=slider, value=15)

df = pd.read_csv("mydata.csv")

alt.Chart(df).mark_point().encode(
    x='xval',
    y='yval',
    color=alt.condition(
        alt.datum.yval < cutoff,
        alt.value('red'), alt.value('blue')
    )
).add_params(
    cutoff
    )
```

My next steps would then be to change axis titles, display the month names, add
a legend, and refine from here.
:::
::::
