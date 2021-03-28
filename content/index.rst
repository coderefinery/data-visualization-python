Data visualization using Python
===============================

In this introductory-level workshop, we will learn to produce
**reproducible data visualization pipelines using the Python programming language**.


Who is the course for?
----------------------

This course is about reading data from a file, processing the data, plotting
the result, and all of this in a reproducible way. This is something that many
of us need to do in our research.  The content of this course is general and
should be relevant for anyone working in the field of science.

**Typical audience**:

- Somebody starting with Python or curious about Python.
- Somebody who needs
  to read, process, and plot data for their work or studies and would like to
  try it out with Python.
- Persons who already use Python for this but want to learn about libraries
  to simplify common tasks and about how to share their workflow in a reproducible way.


.. prereq::

  Preparations for you:

  - No programming langauge experience needed, we will start from zero and learn the basics together
  - As preparation, read and work through https://datacarpentry.org/python-ecology-lesson/ or
    https://swcarpentry.github.io/python-novice-inflammation/ in self-study (2 hours investment)

  Preparations for your computer:

  - Computer with network access
  - Anaconda installation (:doc:`installation`)
  - Optional: `GitHub account <https://github.com/join>`__
    with `SSH keys <https://docs.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account>`__
    set up
  - Zoom video conferencing software
  - Bring one of your recent plotting tasks or challenges


About the course
----------------

We will work in `Jupyter notebooks <https://jupyter.org/>`__ and start with **Python
basics**, to be able to read data from Excel sheets and comma-separated values
(CSV) files. We will introduce the `pandas <https://pandas.pydata.org/>`__ library
for "data wrangling" (reading, writing, sorting, and filtering of data).

We will learn how to **process data** and compute simple statistics, error bars,
and regression approximations with Python and the help of its libraries.

And finally we will learn how to produce **reproducible plots** using the libraries
`Matplotlib <https://matplotlib.org/>`__, `Seaborn <https://seaborn.pydata.org/>`__,
and `Altair <https://altair-viz.github.io/>`__ (you can then choose your favorite
one).  We will practice how to share these visualization pipelines using
`Binder <https://mybinder.org/>`__ via `GitHub <https://github.com>`__.


What is not taught?
-------------------

- Version control. Although super useful it is outside of this workshop.
- Python outside a Jupyter notebook.
- Python sets and tuples are only mentioned.
- File input/output is only used via libraries and doing "own" file-I/O is only part
  of optional material.
- How to choose the right visualization format for the data at hand.
- Python object oriented design.
- Python packaging.
- NumPy arrays.
- Managing environments and installing Python packages.


Progression
-----------

- Getting used to the Jupyter environment
- Getting started with Python
- Producing a first plot
- Reading data from file and web
- Dealing with "messy" data
- Improving the plots
- Organizing projects as they grow
- Sharing reproducible plots


Timing
------

.. csv-table::
   :widths: auto
   :delim: ;

   35 min ; :doc:`jupyter`
   35 min ; :doc:`python-basics`
   35 min ; :doc:`first-plot`
   35 min ; :doc:`pandas`
   25 min ; :doc:`tidy-data`
   35 min ; :doc:`trends`
   30 min ; :doc:`customizing-plots`
   30 min ; :doc:`organizing-projects`
   30 min ; :doc:`binder`


.. toctree::
   :maxdepth: 1
   :caption: Episodes

   jupyter.md
   python-basics.md
   first-plot.md
   pandas.md
   tidy-data.md
   trends.md
   customizing-plots.md
   organizing-projects.md
   binder.md


.. toctree::
   :maxdepth: 1
   :caption: Reference

   installation.md
   guide.md


Credit
------

When preparing this lesson, I have reused these resources:

- https://aaltoscicomp.github.io/python-for-scicomp/
- https://datacarpentry.org/python-ecology-lesson/
- https://swcarpentry.github.io/python-novice-inflammation/
- https://coderefinery.github.io/jupyter/
