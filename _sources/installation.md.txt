# Software install instructions


## Packages that we will need

In this course we will need **Python 3** and the following Python libraries/packages:
- **jupyterlab**
- **altair**
- pandas (comes with altair)
- vega_datasets (optional)
- numpy (optional)
- matplotlib (optional)


## How to install Python and the packages

**If you are used to installing Python packages**, you can use your preferred
installation method.  However, we recommend to not install these system-wide
and never to install using administrator privileges.

**If you are unsure or the first time installing Python and Python packages**
we recommend to install
[Anaconda](https://www.anaconda.com/products/individual) which will give you a
**Python 3** environment and almost all the above required packages.  Once you
have installed Anaconda, create a new environment and install
[altair](https://altair-viz.github.io/) into it.

Finally, please verify the installation (below).


## How to verify your installation

1. Open the [Anaconda Navigator](https://docs.anaconda.com/anaconda/navigator/).

2. Find the **JupyterLab** tile and "launch" it.

If you are on Linux or macOS, you can open JupyterLab from the terminal by typing `jupyter-lab`.

It will hopefully open up your browser and look like this:

```{figure} img/installation/testing-jupyter1.png
:alt: JupyterLab opened in the browser
:width: 100%

JupyterLab opened in the browser. Click on the Python 3 tile.
```

Once you clicked the Python 3 tile it should look like this:

```{figure} img/installation/testing-jupyter2.png
:alt: Python 3 notebook started
:width: 100%

Python 3 notebook started.
```

Into that blue "cell" please type the following:

```python
import altair
import pandas

print("all good - ready for the course")
```

```{figure} img/installation/testing-jupyter3.png
:alt: Screenshot where we test to import required libraries.
:width: 100%

Please copy these lines and click on the "play"/"run" icon.
```

This is how it should look:

```{figure} img/installation/testing-jupyter4.png
:alt: Screenshot after successful import.
:width: 100%

Screenshot after successful import.
```

If this worked, you are all set and can close JupyterLab (no need to save these
changes).

This is how it **should not** look:

```{figure} img/installation/testing-jupyter5.png
:alt: Required packages could not be found.
:width: 100%

Error: required packages could not be found.
```
