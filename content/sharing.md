# Sharing plots and notebooks

:::{objectives}
- Know about good practices for notebooks to make them reusable
- Have a recipe to share a dynamic and reproducible visualization pipeline
:::

[this lesson is adapted after <https://coderefinery.github.io/jupyter/sharing/>]


## Document dependencies

If you import libraries into your notebook, note down their versions.

In Python, it is customary to do this either in a `requirements.txt` file (example):
```text
jupyterlab
altair == 5.5.0
vega_datasets
pandas == 2.2.3
numpy == 2.1.2
```

... or in an `environment.yml` file (example):
```yaml
name: data-viz
channels:
  - conda-forge
dependencies:
  - python <= 3.12
  - jupyterlab
  - altair-all = 5.5.0
  - vega_datasets
  - pandas = 2.2.3
  - numpy = 2.1.2
```

By the way, this is almost the same `environment.yml` file that we used to install the local software
environment in the {ref}`installation` (the latter did not pin versions).

Place either `requirements.txt` or `environment.yml` in the same folder as the notebook(s).

This is not only useful for people who will try to rerun this in future, it is also
understood by some tools (e.g. [Binder](https://mybinder.org/)) which we will see later.


## Different ways to share a Vega-Altair plot

- Save it in SVG format (vector graphics, "maximum resolution")
- Save it in PNG format (raster graphics)
- Share it as notebook (more about it below)
- Save it a web page with `chart.save("chart.html")` and share the HTML file
- You can also get a shareable URL to a chart ([example](https://altair-viz.github.io/user_guide/saving_charts.html#sharable-url))
- With **sensitive data**, you need to be careful with sharing (see next section)


## Vega-Altair and notebooks containing sensitive data

If you plot **sensitive data** in a notebook with Vega-Altair,
you need to be careful.

The author of Vega-Altair provided a good summary in this [GitHub comment](https://github.com/vega/altair/issues/1250#issuecomment-444269060):

> "Standard Altair rendering requires the entire dataset to be accessible to
> the viewer's browser: this is a fundamental design decision in
> Vega/Vega-Lite, in which a chart is equivalent to a dataset plus a
> specification of how to render it. In general, you should assume that the
> entire contents of any dataframe you pass to the alt.Chart() object will be
> saved in the notebook and be inspectable by the viewer."

> "One way to get around this would be to render the chart server-side, export
> a PNG, and display this png instead of the live chart. Incidentally, in the
> Jupyter notebook you can do this by running:"

> `alt.renderers.enable('png')`

> "This sets up Altair such that charts will be
> rendered to PNG within the kernel, and only that PNG rendering will be
> embedded in the notebook. Note this requires some extra dependencies,
> described [here](https://altair-viz.github.io/user_guide/saving_charts.html#png-and-svg-format)."

> "But even here, I wouldn't call your data "private" (for example, if you
> save a scatter plot to PNG, a user can straightforwardly read the data
> values off the chart!) So this makes me think you're actually doing some
> sort of aggregation of your data before plotting (e.g. showing a
> histogram). If this is the case, I would suggest doing those aggregations
> outside of Altair using e.g. pandas, and then passing the aggregated
> dataset to the chart. Then you get the normal interactive display of the
> Altair chart, and your data is just as private as it would have been in the
> equivalent static rendering – the user can only see the aggregated values
> you supplied to the chart."


## Different ways to share a notebook

We need to learn how to share notebooks. At the minimum we need
to share them with our future selves (backup and reproducibility).

- You can enter a URL, GitHub repo or username, or GIST ID in [nbviewer](https://nbviewer.jupyter.org/) and view a rendered Jupyter notebook
- Read the Docs can render Jupyter Notebooks via the [nbsphinx package](https://nbsphinx.readthedocs.io/)
- [Binder](https://mybinder.org/) creates live notebooks based on a GitHub repository
- [EGI Notebooks](https://notebooks.egi.eu) (see also <https://egi-notebooks.readthedocs.io>)
- [JupyterLab](https://github.com/jupyterlab/jupyterlab) supports sharing and collaborative editing of notebooks via Google Drive. Recently
  it also added support for [Shared editing with collaborative notebook model](https://github.com/jupyterlab/jupyterlab/pull/10118).
- [JupyterLite](https://jupyterlite.readthedocs.io/en/latest/) creates a Jupyterlab environment in the browser and can be hosted as a GitHub page.
- [Notedown](https://github.com/aaren/notedown), [Jupinx](https://github.com/QuantEcon/sphinxcontrib-jupyter) and [DocOnce](https://github.com/hplgit/doconce) can take Markdown or Sphinx files and generate Jupyter Notebooks
- [Voilà](https://voila.readthedocs.io/en/stable/) allows you to convert a Jupyter Notebook into an interactive dashboard
- The `jupyter nbconvert` tool can convert a (`.ipynb`) notebook file to:
    - python code (`.py` file)
    - an HTML file
    - a LaTeX file
    - a PDF file
    - a slide-show in the browser


The following platforms can be used free of charge but have **paid subscriptions** for
faster access to cloud resources:
- [CoCalc](https://cocalc.com/) (formerly SageMathCloud) allows collaborative editing of notebooks in the cloud
- [Google Colab](https://colab.research.google.com/) lets you work on notebooks in the cloud, and you can [read and write to notebook files on Drive](https://colab.research.google.com/notebooks/io.ipynb)
- [Microsoft Azure Notebooks](https://notebooks.azure.com/) also offers free notebooks in the cloud
- [Deepnote](https://deepnote.com/) allows real-time collaboration


## Sharing dynamic notebooks using [Binder](https://mybinder.org/)

::::{challenge} Exercise/demo: Making your notebooks reproducible by anyone (15 min)
Instructor demonstrates this:
- Instructor creates a [GitHub](https://github.com/) repository.
- Uploads a notebook file that we created in earlier episodes.
- Then we look at the statically rendered version of the notebook on GitHub and
  also [nbviewer](https://nbviewer.jupyter.org/).
- Add a file `requirements.txt` which contains:
  ```text
  altair == 5.5.0
  vega_datasets
  pandas == 2.2.3
  numpy == 2.1.2
  ```
- Visit [https://mybinder.org](https://mybinder.org):
  ```{figure} img/binder/binder.jpg
  :alt: Screenshot from mybinder.org user interface
  ```
- Check that your notebook repository now has a "launch binder"
  badge in your `README.md` file on GitHub.
- Try clicking the button and see how your repository is launched
  on Binder (can take a minute or two). Your notebooks can now be
  explored and executed in the cloud.
- Enjoy being fully reproducible!
::::

Also please see how we share the notebooks from this lesson
in the {ref}`episode-overview`.


## How to get a digital object identifier (DOI)

- [Zenodo](https://zenodo.org/) is a great service to get a
  [DOI](https://en.wikipedia.org/wiki/Digital_object_identifier) for a notebook
  (but **first practice** with the [Zenodo sandbox](https://sandbox.zenodo.org/)).
- [Binder](https://mybinder.org/) can also run notebooks from Zenodo.
- In the supporting information of your paper you can refer to its DOI.
