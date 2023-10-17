# Organizing projects

```{objectives}
- How to move common reusable functions to modules and import them
- Know about good practices for notebooks to make them reusable
```

```{instructor-note}
- 20 min presentation and discussion
```

[this lesson is adapted from <https://coderefinery.github.io/jupyter/06-sharing/>]

**It all started with a short and simple notebook** but how to organize as projects and
notebooks grow?


## Avoiding repetitive code

Let's imagine we wrote this function `fancy_plot` for a hexagonal 2D histogram plot
(please try it in your notebook):
```{code-block} python
---
emphasize-lines: 7-12
---
import seaborn as sns

# to get some random numbers
from numpy.random import default_rng


# this one is simple but let us imagine something very lengthy
def fancy_plot(x_values, y_values, color):
    """
    Fancy function creating fancy plots.
    """
    sns.jointplot(x=x_values, y=y_values, kind="hex", color=color)


rng = default_rng()

x_values = rng.standard_normal(500)
y_values = rng.standard_normal(500)

# call our function
fancy_plot(x_values, y_values, "#4cb391")


other_x_values = rng.standard_normal(500)
other_y_values = rng.standard_normal(500)

# call our function again, this time with other data
fancy_plot(other_x_values, other_y_values, "#fc9272")
```

Now we would like to use this function in 5 other notebooks without duplicating
it over all of the notebooks (imagine the function is very lengthy).

It can be useful to create a Python file `myplotfunctions.py` in the same
folder as the notebooks (you can change the name)
and place this code into `myplotfunctions.py`:
```{code-block} python
import seaborn as sns


# this one is simple but let us imagine something very lengthy
def fancy_plot(x_values, y_values, color):
    """
    Fancy function creating fancy plots.
    """
    sns.jointplot(x=x_values, y=y_values, kind="hex", color=color)
```

Now we can simplify our notebook:
```{code-block} python
---
emphasize-lines: 4, 13, 20
---
# to get some random numbers
from numpy.random import default_rng

from myplotfunctions import fancy_plot


rng = default_rng()

x_values = rng.standard_normal(500)
y_values = rng.standard_normal(500)

# call our function
fancy_plot(x_values, y_values, "#4cb391")


other_x_values = rng.standard_normal(500)
other_y_values = rng.standard_normal(500)

# call our function again, this time with other data
fancy_plot(other_x_values, other_y_values, "#fc9272")
```


## Sharing notebooks

We need to learn how to share notebooks. At the minimum we need
to share them with our future selves (backup and reproducibility).

- You can enter a URL, GitHub repo or username, or GIST ID in [`nbviewer`](https://nbviewer.jupyter.org/) and view a rendered Jupyter Notebook
- Read the Docs can render Jupyter Notebooks via the [nbsphinx package](https://nbsphinx.readthedocs.io/)
- [Binder](https://mybinder.org/) creates live notebooks based on a GitHub repository
  (more about this later)
- [EGI Notebooks](https://notebooks.egi.eu) (see also [https://egi-notebooks.readthedocs.io](https://egi-notebooks.readthedocs.io))
- [JupyterLab](https://github.com/jupyterlab/jupyterlab) supports sharing and collaborative editing of notebooks via Google Drive
- [Notedown](https://github.com/aaren/notedown), [Jupinx](https://github.com/QuantEcon/sphinxcontrib-jupyter) and [DocOnce](https://github.com/hplgit/doconce) can take Markdown or Sphinx files and generate Jupyter Notebooks
- [Voilà](https://voila.readthedocs.io/en/stable/) allows you to convert a Jupyter Notebook into an interactive dashboard
- The `jupyter nbconvert` tool can convert a (`.ipynb`) notebook file to:
    - python code (`.py` file)
    - an HTML file
    - a LaTeX file
    - a PDF file
    - a slide-show in the browser


### Commercial offers with free plans

These platforms can be used free of charge but have paid subscriptions for
faster access to cloud resources:

- [CoCalc](https://cocalc.com/) (formerly SageMathCloud) allows collaborative editing of notebooks in the cloud
- Google's [colaboratory](https://colab.research.google.com/) lets you work on notebooks in the cloud, and you can [read and write to notebook files on Drive](https://colab.research.google.com/notebooks/io.ipynb)
- [Microsoft Azure Notebooks](https://notebooks.azure.com/) also offers free notebooks in the cloud
- [Deepnote](https://deepnote.com/) allows real-time collaboration


## Document dependencies

If you import libraries into your notebook, note down their versions.

It is customary to do this either in a `requirements.txt` file (example):
```text
pandas==1.2.3
seaborn==0.11.1
```

... or in an `environment.yml` file (example):
```yaml
name: example-environment
channels:
  - conda-forge
dependencies:
  - pandas==1.2.3
  - seaborn==0.11.1
```

Place either `requirements.txt` or `environment.yml` in the same folder as the notebook(s).

This is not only useful for people who will try to rerun this in future, it is also
understood by some tools (e.g. [Binder](https://mybinder.org/)) which we will see later.


## Recommendations for longer notebooks

### Create a table of contents on top

You can do that using Markdown. This produces a nice overview for longer notebooks.
Example: [https://stackoverflow.com/a/39817243](https://stackoverflow.com/a/39817243)


### How to make it possible to toggle showing code

It is possible to hide all the code and only show the output. This can be nice
for notebook readers who don't need/want to see the code:

```
from IPython.display import HTML

HTML('''<script>
code_show=true;
function code_toggle() {
 if (code_show){
 $('div.input').hide();
 } else {
 $('div.input').show();
 }
 code_show = !code_show
}
$( document ).ready(code_toggle);
</script>
<form action="javascript:code_toggle()"><input type="submit" value="Click here to toggle on/off the raw code."></form>''')
```
