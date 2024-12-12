(installation)=

# Software install instructions

[this page is adapted from <https://aaltoscicomp.github.io/python-for-scicomp/installation/>]


## Choosing an installation method

For this course we will install an isolated environment
with following dependencies:
```yaml
name: data-viz
channels:
  - conda-forge
dependencies:
  - python <= 3.12
  - jupyterlab
  - altair-all
  - vega_datasets
  - pandas
  - numpy
```

If you are used to installing packages in Python and know what to do with the
above `environment.yml` file, please follow your own preferred installation
method.

**If you are new to Python or unsure** how to create isolated environments in
Python from files like the `environment.yml` above, please follow the
instructions below.

:::{discussion} There are many choices and we try to suggest a good compromise
There are very many ways to install Python and packages with pros and cons and
in addition there are several operating systems with their own quirks. This
can be a huge challenge for beginners to navigate. It can also difficult for
instructors to give recommendations for something which will work everywhere
and which everybody will like.

Below we will recommend **Miniforge** since it is free, open source, general,
available on all operating systems, and provides a good basis for reproducible
environments. However, it does not provide a graphical user interface during
installation. This means that every time we want to start a JupyterLab session,
we will have to go through the command line.
:::

:::{admonition} Python, conda, anaconda, miniforge, etc?
:class: dropdown

Unfortunately there are many options and a lot of jargon.
Here is a crash course:

* **Python** is a programming language very commonly used in
  science, it's the topic of this course.
* **Conda** is a package manager: it allows distributing and
  installing packages, and is designed for complex scientific
  code.
* **Mamba** is a re-implementation of Conda to be much faster with
  resolving dependencies and installing things.
* An **Environment** is a self-contained collections of packages
  which can be installed separately from others.  They are used so
  each project can install what it needs without affecting others.
* **Anaconda** is a commercial distribution of Python+Conda+many
  packages that all work together.  It used to be freely usable for
  research, but since ~2023-2024 it's more limited.  Thus, we don't
  recommend it (even though it has a nice graphical user interface).
* **conda-forge** is another channel of distributing packages that
  is maintained by the community, and thus can be used by anyone.
  (Anaconda's parent company also hosts conda-forge packages)
* **miniforge** is a distribution of conda pre-configured for
  conda-forge.  It operates via the command line.
* **miniconda** is a distribution of conda pre-configured to use
  the Anaconda channels.
:::


## Installing Python via Miniforge

Follow the [instructions on the miniforge web page](https://github.com/conda-forge/miniforge).  This installs
the base, and from here other packages can be installed.


## Installing and activating the software environment

First we will start Python in a way that activates conda/mamba.  Then we will
install the software environment from [this environment.yml
file](https://raw.githubusercontent.com/coderefinery/data-visualization-python/main/software/environment.yml).

An **environment** is a self-contained set of extra libraries - different
projects can use different environments to not interfere with each other.  This
environment will have all of the software needed for this particular course.

We will call the environment `data-viz`.

::::{tabs}
  :::{group-tab} Windows
  Use the "Miniforge Prompt" to start Miniforge.  This
  will set up everything so that ``conda`` and ``mamba`` are
  available.
  Then type
  (without the `$`):
  ```console
  $ mamba env create -n data-viz -f https://raw.githubusercontent.com/coderefinery/data-visualization-python/main/software/environment.yml
  ```
  :::

  :::{group-tab} Linux / MacOS
  Each time you start a new command line terminal,
  you can activate Miniforge by running
  (without the `$`):
  ```console
  $ source ~/miniforge3/bin/activate
  ```

  This is needed so that
  Miniforge is usable wherever you need, but doesn't affect any
  other software on your computer (this is not needed if you
  choose "Do you wish to update your shell profile to
  automatically initialize conda?", but then it will always be
  active).

  In the second step, we will install the software environment:
  ```console
  $ mamba env create -n data-viz -f https://raw.githubusercontent.com/coderefinery/data-visualization-python/main/software/environment.yml
  ```
  :::
::::


## Starting JupyterLab

Every time we want to start a JupyterLab session,
we will have to go through the command line and first
activate the `data-viz` environment.

::::{tabs}
  :::{group-tab} Windows
  Start the Miniforge Prompt. Then type
  (without the `$`):
  ```console
  $ conda activate data-viz
  $ jupyter-lab
  ```
  :::

  :::{group-tab} Linux / MacOS
  Start the terminal and in the terminal, type
  (without the `$`):
  ```console
  $ source ~/miniforge3/bin/activate
  $ conda activate data-viz
  $ jupyter-lab
  ```
  :::
::::


## Removing the software environment

::::{tabs}
  :::{group-tab} Windows
  In the Miniforge Prompt, type
  (without the `$`):
  ```console
  $ conda env list
  $ conda env remove --name data-viz
  $ conda env list
  ```
  :::

  :::{group-tab} Linux / MacOS
  In the terminal, type
  (without the `$`):
  ```console
  $ source ~/miniforge3/bin/activate
  $ conda env list
  $ conda env remove --name data-viz
  $ conda env list
  ```
  :::
::::


## How to verify your installation

**Start JupyterLab** (as described above).  It will hopefully open up your browser
and look like this:

:::{figure} img/installation/testing-jupyter1.png
:alt: JupyterLab opened in the browser
:width: 100%

JupyterLab opened in the browser. Click on the Python 3 tile.
:::

Once you clicked the Python 3 tile it should look like this:
:::{figure} img/installation/testing-jupyter2.png
:alt: Python 3 notebook started
:width: 100%

Python 3 notebook started.
:::

Into that blue "cell" please type the following:
```python
import altair
import pandas

print("all good - ready for the course")
```

:::{figure} img/installation/testing-jupyter3.png
:alt: Screenshot where we test to import required libraries.
:width: 100%

Please copy these lines and click on the "play"/"run" icon.
:::

This is how it should look:
:::{figure} img/installation/testing-jupyter4.png
:alt: Screenshot after successful import.
:width: 100%

Screenshot after successful import.
:::

If this worked, you are all set and can close JupyterLab (no need to save these
changes).

This is how it **should not** look:
:::{figure} img/installation/testing-jupyter5.png
:alt: Required packages could not be found.
:width: 100%

Error: required packages could not be found.
:::
