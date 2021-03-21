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

This is a 3 day workshop where the majority of the learning will take place
over the first two half-days.  After that we will **work on our own projects** and
meet up again on April for a mentoring session where we will together improve
data processing and visualization pipelines for our actual research projects.


.. csv-table::
   :widths: auto
   :delim: ;

   35 min ; :doc:`jupyter`
   35 min ; :doc:`python-basics`
   30 min ; :doc:`pandas`
   25 min ; :doc:`first-plot`
   25 min ; :doc:`tidy-data`
   50 min ; :doc:`trends`
   30 min ; :doc:`customizing-plots`
   30 min ; :doc:`organizing-projects`
   30 min ; :doc:`binder`


.. toctree::
   :maxdepth: 1
   :caption: Episodes

   jupyter.md
   python-basics.md
   pandas.md
   first-plot.md
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

When preparing this lesson, I have used these resources as inspiration for outline and examples:

- https://aaltoscicomp.github.io/python-for-scicomp/
- https://datacarpentry.org/python-ecology-lesson/
- https://swcarpentry.github.io/python-novice-inflammation/
