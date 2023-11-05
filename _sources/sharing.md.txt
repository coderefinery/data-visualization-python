# Sharing notebooks

```{objectives}
- Know about good practices for notebooks to make them reusable
- Have a recipe to share a dynamic and reproducible visualization pipeline
```

```{instructor-note}
- 20 min presentation and discussion
```

[this lesson is adapted from <https://coderefinery.github.io/jupyter/sharing/>]


## Document dependencies

If you import libraries into your notebook, note down their versions.

It is customary to do this either in a `requirements.txt` file (example):
```text
pandas==2.1.1
altair==5.1.2
```

... or in an `environment.yml` file (example):
```yaml
name: example-environment
channels:
  - conda-forge
dependencies:
  - pandas=2.1.1
  - altair=5.1.2
```

Place either `requirements.txt` or `environment.yml` in the same folder as the notebook(s).

This is not only useful for people who will try to rerun this in future, it is also
understood by some tools (e.g. [Binder](https://mybinder.org/)) which we will see later.


## Different ways to share a notebook

We need to learn how to share notebooks. At the minimum we need
to share them with our future selves (backup and reproducibility).

- You can enter a URL, GitHub repo or username, or GIST ID in [nbviewer](https://nbviewer.jupyter.org/) and view a rendered Jupyter notebook
- Read the Docs can render Jupyter Notebooks via the [nbsphinx package](https://nbsphinx.readthedocs.io/)
- [Binder](https://mybinder.org/) creates live notebooks based on a GitHub repository
- [EGI Notebooks](https://notebooks.egi.eu) (see also https://egi-notebooks.readthedocs.io)
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


These platforms can be used free of charge but have **paid subscriptions** for
faster access to cloud resources:
- [CoCalc](https://cocalc.com/) (formerly SageMathCloud) allows collaborative editing of notebooks in the cloud
- Google's [Colaboratory](https://colab.research.google.com/) lets you work on notebooks in the cloud, and you can [read and write to notebook files on Drive](https://colab.research.google.com/notebooks/io.ipynb)
- [Microsoft Azure Notebooks](https://notebooks.azure.com/) also offers free notebooks in the cloud
- [Deepnote](https://deepnote.com/) allows real-time collaboration


## Sharing dynamic notebooks using [Binder](https://mybinder.org/)

````{challenge} Exercise/demo: Making your notebooks reproducible by anyone (15 min)
Instructor demonstrates this:
- Instructor creates a [GitHub](https://github.com/) repository.
- Uploads a notebook file that we created in earlier episodes.
- Then we look at the statically rendered version of the notebook on GitHub and
  also [nbviewer](https://nbviewer.jupyter.org/).
- Add a file `requirements.txt` which contains:
  ```text
  pandas==2.1.1
  altair==5.1.2
  ```
- Visit [https://mybinder.org](https://mybinder.org):
  ```{figure} img/binder/binder.jpg
  :alt: Screenshot from mybinder.org user interface
  ```
- Check that your notebook repository now has a "launch binder"
  badge in your `README.md` file on GitHub.
- Try clicking the button and see how your repository is launched
  on Binder (can take a minute or two). Your notebooks can now be expored and executed in the cloud.
- Enjoy being fully reproducible!
````


## How to get a digital object identifier (DOI)

- [Zenodo](https://zenodo.org/) is a great service to get a
  [DOI](https://en.wikipedia.org/wiki/Digital_object_identifier) for a notebook
  (but **first practice** with the [Zenodo sandbox](https://sandbox.zenodo.org/)).
- [Binder](https://mybinder.org/) can also run notebooks from Zenodo.
- In the supporting information of your paper you can refer to its DOI.
