# Software install instructions


## Packages that we will need

In this course we will need **Python 3** and the following Python libraries/packages:
- jupyter
- jupyterlab
- numpy
- scipy
- pandas
- matplotlib
- seaborn

This one is optional (it will be demonstrated and you can install
it if you want to try it out):
- altair


## How to install Python and the packages

**If you are used to installing Python packages**, you can use your preferred installation method.
However, we recommend to not install these system-wide and never to install using administrator privileges.

**If you are unsure or the first time installing Python and Python packages** we
recommend to install [Anaconda](https://www.anaconda.com/products/individual)
which will give you a **Python 3** environment and all the above required packages.

After you have installed Anaconda, please verify the installation (below).

Once you have installed Anaconda, if you are interested in trying out
[Altair](https://altair-viz.github.io/) you need to install it separately into
your Conda environment (type this in your Anaconda prompt):

```
$ conda install -c conda-forge altair vega_datasets
```


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
import numpy
import scipy
import pandas
import matplotlib
import seaborn

print("all good")
```

```{figure} img/installation/testing-jupyter3.png
:alt: Screenshot where we test to import numpy, scipy, pandas, matplotlib, and seaborn
:width: 100%

Please type these five lines and click on the "play"/"run" icon.
```

This is how it should look:

```{figure} img/installation/testing-jupyter4.png
:alt: Screenshot after successful import
:width: 100%

Screenshot after successful import.
```

If this worked, you are all set and can close JupyterLab (no need to save these changes).

This is how it **should not** look:

```{figure} img/installation/testing-jupyter5.png
:alt: Required packages could not be found
:width: 100%

Error: required packages could not be found.
```
