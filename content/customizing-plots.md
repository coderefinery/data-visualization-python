# Customizing plots

```{objectives}
- Know where to look to find out how to tweak plots
- Be able to prepare a plot for publication
- Know how to tweak example plots from a gallery for your own purpose
```

[this lesson is adapted from <https://aaltoscicomp.github.io/python-for-scicomp/data-visualization/>]


## Styling and customizing plots

- Before you customize plots "manually using a graphical program, please
  consider how this affects reproducibility.
- **Try to minimize manual post-processing**. This might bite you when you
  need to regenerate 50
  figures one day before submission deadline or regenerate a set of figures
  after the person who created them left the group.
- All the plotting libraries in Python allow to customize almost every aspect
  of a plot.


## Exercises

Here are few exercises where we try to adapt existing scripts to either
**tweak how the plot looks** or to **modify the input data**.

This is very close to real life: there are so many options and possibilities
and it is almost impossible to remember everything so this strategy is useful
to practice:
- Select an example that is close to what you have in mind
- Being able to adapt it to your needs
- Being able to search for help
- Being able to understand help request answers (not easy)


````{challenge} Exercise Customization-1: adapting a gallery example
**This is a great exercise which is very close to real life.**

- Your task is to select one visualization library (some need to be installed first - in
  doubt choose Matplotlib or Seaborn since they are part of Anaconda installation):
  - [Matplotlib](https://matplotlib.org/stable/gallery/index.html):
    probably the most standard and most widely used
  - [Seaborn](https://seaborn.pydata.org/examples/index.html):
    high-level interface to Matplotlib, statistical functions built in
  - [Altair](https://altair-viz.github.io/gallery/index.html):
    declarative visualization (R users will be more at home), statistics built in
  - [Plotly](https://plotly.com/python/):
    interactive graphs
  - [Bokeh](https://demo.bokeh.org/):
    also here good for interactivity
  - [plotnine](https://plotnine.readthedocs.io/):
    implementation of a grammar of graphics in Python, it is based on [ggplot2](https://ggplot2.tidyverse.org/)
  - [ggplot](https://yhat.github.io/ggpy/):
    R users will be more at home
  - [PyNGL](https://www.pyngl.ucar.edu/Examples/gallery.shtml):
    used in the weather forecast community
  - [K3D](https://k3d-jupyter.org/gallery/index.html):
    Jupyter Notebook extension for 3D visualization

- Browse the various example galleries (links above).
- Select one example that is close to your recent visualization project or simply interests you.
- First try to reproduce this example in the Jupyter Notebook.
- Then try to print out the data that is used in this example just before the call of the plotting function
  to learn about its structure. Is it a pandas dataframe? Is it a NumPy array? Is it a dictionary? A list?
  a list of lists?
- Then try to modify the data a bit.
- If you have time, try to feed it different, simplified data.
  This will be key for adapting the examples to your projects.

Example "solution" for such an exploration below.
````

````{solution} An example exploration
- Let us imagine we were browsing <https://seaborn.pydata.org/examples/index.html>
- And this example plot caught our eye: <https://seaborn.pydata.org/examples/simple_violinplots.html>
- Try to run it in the notebook.
- The `d` seems to be the data. Right before the call to `sns.violinplot`, add a `print(d)`:
  ```{code-block} python
  ---
  emphasize-lines: 12
  ---
  import numpy as np
  import seaborn as sns

  sns.set_theme()

  # Create a random dataset across several variables
  rs = np.random.default_rng(0)
  n, p = 40, 8
  d = rs.normal(0, 2, (n, p))
  d += np.log(np.arange(1, p + 1)) * -5 + 10

  print(d)

  # Show each distribution with both violins and points
  sns.violinplot(data=d, palette="light:g", inner="points", orient="h")
  ```
- The print reveals that `d` is a NumPy array and looks like a two-dimensional list:
  ```text
  [[10.25146044  6.27005437  5.78778386  3.27832843  0.88147169  1.76439276  2.87844934  1.49695422]
   [ 8.59252953  4.00342116  3.26038963  3.15118015 -2.69725111  0.60361933 -2.22137264 -1.86174242]
   ... many more lines ...
   [12.45950762  4.32352988  6.56724895  3.42215312  0.34419915  0.46123886 -1.56953795  0.95292133]]
  ```
- Now let's try with a much simplified two-dimensional list:
  ```{code-block} python
  ---
  emphasize-lines: 12, 13
  ---
  # import numpy as np
  import seaborn as sns

  sns.set_theme()

  # # Create a random dataset across several variables
  # rs = np.random.default_rng(0)
  # n, p = 40, 8
  # d = rs.normal(0, 2, (n, p))
  # d += np.log(np.arange(1, p + 1)) * -5 + 10

  d = [[1.0, 2.0, 2.0, 3.0, 3.0, 3.0],
       [1.0, 1.0, 1.0, 2.0, 2.0, 3.0]]

  # Show each distribution with both violins and points
  sns.violinplot(data=d, palette="light:g", inner="points", orient="h")
  ```
- Seems to work! And finally we arrive at a working example with our own data with all
  the "clutter" removed:
  ```python
  import seaborn as sns

  # l1 and l2 are note great names but they will do for a quick test
  l1 = [1.0, 2.0, 2.0, 3.0, 3.0, 3.0]
  l2 = [1.0, 1.0, 1.0, 2.0, 2.0, 3.0]

  sns.violinplot(data=[l1, l2], palette="light:g", inner="points", orient="h")
  ```
- And now we can focus the rest of our work to read our real data.
- Finally we can customize the plot.
````

---

```{discussion}
After the exercises, the group can discuss their findings and it is important to
clarify questions at this point before moving on.
```
