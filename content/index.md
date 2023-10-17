# Data visualization using Python

In this introductory-level workshop, we will learn to produce **reproducible
data visualization pipelines using the Python programming language**.

We will work in [Jupyter Notebooks](https://jupyter.org/) and start with
**Python basics**, to be able to read data from Excel sheets and
comma-separated values (CSV) files. We will introduce the
[pandas](https://pandas.pydata.org/) library for "data wrangling" (reading,
writing, sorting, and filtering of data).  We will learn how to produce and
share **reproducible plots** using
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
- Anaconda installation ({doc}`installation`)
- Installing the package `altair`
- Bring one of your recent plotting tasks or challenges
```


## What is not taught?

- Version control. Although super useful it is outside of this workshop.
- Python outside a Jupyter Notebook.
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
35 min ; {doc}`first-plot`
45 min ; {doc}`pandas`
25 min ; {doc}`tidy-data`
50 min ; {doc}`customizing-plots`
20 min ; {doc}`regression`
20 min ; {doc}`organizing-projects`
20 min ; {doc}`binder`
```

```{toctree}
:maxdepth: 1
:caption: Episodes
:hidden:

jupyter.md
python-basics.md
first-plot.md
pandas.md
tidy-data.md
customizing-plots.md
regression.md
organizing-projects.md
binder.md
```

```{toctree}
:maxdepth: 1
:caption: Optional

matplotlib.md
```

```{toctree}
:maxdepth: 1
:caption: Reference

installation.md
guide.md
```


## Credit

When preparing this lesson, we have reused these resources:

- <https://aaltoscicomp.github.io/python-for-scicomp/>
- <https://datacarpentry.org/python-ecology-lesson/>
- <https://swcarpentry.github.io/python-novice-inflammation/>
- <https://coderefinery.github.io/jupyter/>
