# Data visualization using Python and Vega-Altair

In this introductory-level workshop, we will learn to produce **reproducible
data visualization pipelines using the Python programming language** and the
[Vega-Altair](https://altair-viz.github.io/) declarative visualization library.

We will work in [Jupyter Notebooks](https://jupyter.org/) and start with
**Python basics**.  We will introduce the [pandas](https://pandas.pydata.org/)
library for "data wrangling" (reading, writing, sorting, and filtering of
data).  With pandas, we will be able to read data from Excel sheets and
comma-separated values (CSV) files.

Finally, will learn how to produce
and share **reproducible plots** using
[Vega-Altair](https://altair-viz.github.io/).


## Who is the course for?

- Somebody starting with Python or curious about Python.
- Somebody who needs
  to read, process, and plot data for their work or studies and would like to
  try it out with Python.
- Persons who already use Python for this but want to learn about libraries
  to simplify common tasks and about how to share their workflow in a reproducible way.

```{prereq} Preparations
- No programming langauge experience needed, we will start from zero and learn the basics together
- Computer with network access
- {doc}`installation`
- Bring one of your recent plotting tasks or challenges
```


## What is not taught?

- Version control. Although super useful it is outside of this workshop.
- Python outside a Jupyter Notebook.
- **Running the examples in VS Code or Spyder might not be possible**. Please use Jupyter Notebooks for this course.
- Python sets and tuples are only mentioned.
- File input/output is only used via libraries and doing "own" file-I/O is only part
  of optional material.
- How to choose the right visualization format for the data at hand.
- Python object oriented design.
- Python packaging.
- NumPy arrays.
- Managing environments and installing Python packages.


## Episodes

```{csv-table}
:widths: auto
:delim: ;

35 min ; {doc}`jupyter`
35 min ; {doc}`python-basics`
35 min ; {doc}`plotting`
25 min ; {doc}`tidy-data`
50 min ; {doc}`customizing-plots`
20 min ; {doc}`sharing`
```

```{toctree}
:maxdepth: 1
:caption: Episodes
:hidden:

jupyter.md
python-basics.md
plotting.md
tidy-data.md
gapminder.md
customizing-plots.md
gallery.md
sharing.md
```

```{toctree}
:maxdepth: 1
:caption: Reference

installation.md
colab.md
```

```{toctree}
:maxdepth: 1
:caption: Optional/extra

parsing-custom-format.md
```


## Example notebooks

Generating our first plot

[![nbviewer badge](https://img.shields.io/badge/view%20on-nbviewer-brightgreen.svg)](https://nbviewer.org/github/coderefinery/data-visualization-python/blob/main/notebooks/first-plot.ipynb)
[![colab badge](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/coderefinery/data-visualization-python/blob/main/notebooks/first-plot.ipynb)
[![binder badge](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/coderefinery/data-visualization-python/HEAD?labpath=notebooks%2Ffirst-plot.ipynb)


Reading and slicing data with pandas

[![nbviewer badge](https://img.shields.io/badge/view%20on-nbviewer-brightgreen.svg)](https://nbviewer.org/github/coderefinery/data-visualization-python/blob/main/notebooks/pandas.ipynb)
[![colab badge](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/coderefinery/data-visualization-python/blob/main/notebooks/pandas.ipynb)
[![binder badge](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/coderefinery/data-visualization-python/HEAD?labpath=notebooks%2Fpandas.ipynb)


Customizing plots

[![nbviewer badge](https://img.shields.io/badge/view%20on-nbviewer-brightgreen.svg)](https://nbviewer.org/github/coderefinery/data-visualization-python/blob/main/notebooks/customizing.ipynb)
[![colab badge](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/coderefinery/data-visualization-python/blob/main/notebooks/customizing.ipynb)
[![binder badge](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/coderefinery/data-visualization-python/HEAD?labpath=notebooks%2Fcustomizing.ipynb)


## Credit

When preparing this lesson, we have reused these resources:

- <https://aaltoscicomp.github.io/python-for-scicomp/>
- <https://datacarpentry.org/python-ecology-lesson/>
- <https://swcarpentry.github.io/python-novice-inflammation/>
- <https://coderefinery.github.io/jupyter/>
