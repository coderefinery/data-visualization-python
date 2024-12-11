# Software install instructions

[this page is adapted from <https://aaltoscicomp.github.io/python-for-scicomp/installation/>]


## Packages that we will need

In this course we will need **Python 3** and the following Python libraries/packages:
- **jupyterlab**
- **altair**
- pandas (comes with altair)
- vega_datasets (optional)
- numpy (optional)


## How to install Python

We expect you to have a working Python installation with some common libraries.
**We currently recommend Miniforge, which includes the base and packages
through a different, freely usable channel.** You can explore the options in
the tabs below.

**If you are used to installing Python packages**, you can use your preferred
installation method.  However, we recommend to not install the above packages
system-wide and never to install using administrator privileges.
Below we offer several options to install Python and the required packages
from the [environment.yml file](https://github.com/coderefinery/data-visualization-python/blob/main/software/environment.yml).

:::{admonition} Python, conda, anaconda, miniforge, etc?
:class: dropdown

Unfortunately there's a lot of jargon.  We'll go over this in the
course but here is a crash course:

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

::::{tabs}
  :::{group-tab} Miniforge
  This is our recommended method - it can be used for any purpose
  and makes a strong base for the future.

  Follow the [instructions on the miniforge web page](https://github.com/conda-forge/miniforge).  This installs
  the base, and from here other packages can be installed.

  Miniforge uses the command line - this gives you the most power
  but can feel unfamiliar.
  :::

  :::{group-tab} Anaconda
  Anaconda is easier to get started with, but may be more limiting
  in the future.  The Anaconda Navigator provides a graphical
  interface to most of what you would need.

  The [Anaconda Python distribution](https://docs.continuum.io/anaconda/install/) conveniently packages
  most popular libraries, but its license has does not allow large organizations to
  use it for free (and has actually been enforced against
  universities).

  Note the license of Anaconda - there were recently issues with
  it being used by large universities for free, and this is not
  yet fully resolved.
  :::
::::


## Starting Python

You need to start Python in a way that activates conda/mamba.

::::::{tabs}
  :::::{group-tab} Miniforge
    ::::{tabs}
      :::{group-tab} Windows
      Windows: Use the "Miniforge Prompt" to start Miniforge.  This
      will set up everything so that ``conda`` and ``mamba`` are
      available.
      :::
      :::{group-tab} Linux / MacOS
      Each time you start a new command line terminal,
      you can activate Miniforge by running:
      ```
      $ source ~/miniforge3/bin/activate
      ```

      This is needed so that
      Miniforge is usable wherever you need, but doesn't affect any
      other software on your computer (this is not needed if you
      choose "Do you wish to update your shell profile to
      automatically initialize conda?", but then it will always be
      active).
      :::
    ::::
  :::::

  :::::{group-tab} Anaconda
  The [Anaconda Navigator](https://docs.anaconda.com/navigator/) provides a convenient
  way to access the software. It can be installed from that page.
  :::::
::::::


## Installing and activating the software environment

Once Python and conda/mamba are installed, you can use it to install
an environment.  An **environment** is a self-contained set of extra
libraries - different projects can use different environments to not
interfere with each other.  This environment will have all of the
software needed for this particular course.

::::::{tabs}
  :::::{group-tab} Miniforge
    This [environment.yml file](https://raw.githubusercontent.com/coderefinery/data-visualization-python/main/software/environment.yml)
    contains all packages needed for the course, and can be
    installed with.  The following command will install an
    environment named `data-viz`:
    ::::{tabs}
      :::{group-tab} Windows
	  ```
	  $ mamba env create -n data-viz -f https://raw.githubusercontent.com/coderefinery/data-visualization-python/main/software/environment.yml
	  ```
      :::
      :::{group-tab} Linux / MacOS
	  ```
	  $ mamba env create -n data-viz -f https://raw.githubusercontent.com/coderefinery/data-visualization-python/main/software/environment.yml
	  ```
      :::
    ::::{tabs}

    Each time you start a new command line, you need to activate
    miniforge and this environment:
    ::::{tabs}
      :::{group-tab} Windows
      Start the Miniforge Prompt. Then run:
      ```
      $ conda activate data-viz
      $ jupyter-lab
      ```
      :::
      :::{group-tab} Linux / MacOS
      ```
      $ source ~/miniforge3/bin/activate
      $ conda activate data-viz
      ```
      :::
    ::::
  :::::

  :::::{group-tab} Anaconda
  Use the navigator to create a new environment from [this environment.yml
  file](https://raw.githubusercontent.com/coderefinery/data-visualization-python/main/software/environment.yml).
  You'll have to download it and then [import
  it](https://docs.anaconda.com/navigator/tutorials/manage-environments/#importing-an-environment).

  When running this course's exercise, make sure the `data-viz` environment is
  activated before starting JupyterLab or any code.  You need to start
  terminals or JupyterLab from the Anaconda Navigator for the `data-viz`
  environment to be used.
  :::::
::::::


## Starting JupyterLab

We do most of the lessons from JupyterLab (and JupyterLab provides
most of the other tools we need).

::::::{tabs}
  :::::{group-tab} Miniforge
    ::::{tabs}
      :::{group-tab} Windows
      Start the Miniforge Prompt. Then run:
      ```
      $ conda activate data-viz
      $ jupyter-lab
      ```
      :::
      :::{group-tab} Linux / MacOS
      ```
      $ source ~/miniforge3/bin/activate
      $ conda activate data-viz
      $ jupyter-lab
      ```
      :::
    ::::
  :::::

  :::::{group-tab} Anaconda
  If you install the full Anaconda distribution, this will be
  available and can be started either through Anaconda Navigator
  or command line.

  Make sure the `data-viz` environment is selected and
  you can start JupyterLab.
  :::::
::::::


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
