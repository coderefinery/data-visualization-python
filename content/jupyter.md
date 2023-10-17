# Jupyter Notebooks

```{objectives}
- Know what it is
- Create a new notebook and save it
- Open existing notebooks from the web
- Be able to create text/markdown cells, code cells, images, and equations
- Know when to use a Jupyter Notebook for a Python project and when perhaps not to
```

```{instructor-note}
- 15 min discussion/demo
- 15 min exercise
- 5 min summary
```

[this lesson is adapted from <https://coderefinery.github.io/jupyter/motivation/>]


## Motivation for Jupyter Notebooks

```{figure} img/jupyter/medicean-stars.png
:alt: Galileo's drawings of Jupiter and its Medicean Stars from Sidereus Nuncius
:width: 50%

**One of the first notebooks: Galileo's drawings of Jupiter and its Medicean
Stars** from Sidereus Nuncius. Image courtesy of the History of Science
Collections, University of Oklahoma Libraries (CC-BY).
```

- **Code, text, equations, figures, plots**, etc. are interleaved, creating a *computational narrative*.
- [*"an environment in which users execute code, see what happens, modify and
  repeat in a kind of iterative conversation between researcher and
  data"*](https://www.nature.com/articles/d41586-018-07196-1)
- The name "Jupyter" derives from Julia+Python+R, but today Jupyter kernels
  exist for [dozens of programming languages](https://github.com/jupyter/jupyter/wiki/Jupyter-kernels).
- [Gallery of interesting Jupyter Notebooks](https://github.com/jupyter/jupyter/wiki).


## Our first notebook

````{challenge} Exercise Jupyter-1: Create a notebook (15 min)
- Open a new notebook (on Windows: open Anaconda Navigator, then launch JupyterLab; on macOS/Linux: you can open JupyterLab from the terminal by typing `jupyter-lab`)
- Rename the notebook
- Create a **markdown cell** with a section title, a short text, an image, and an equation
  ```markdown
  # Title of my notebook

  Some text.

  ![Photo of Galilei's manuscript](https://upload.wikimedia.org/wikipedia/commons/b/b3/Galileo_Galilei_%281564_-_1642%29_-_Serenissimo_Principe_-_manuscript_with_observations_of_Jupiter_and_four_of_its_moons%2C_1610.png)

  $E = mc^2$
  ```
- Most important shortcut: **Shift + Enter**, to run current cell and create a new one below.
- Create a **code cell** where you define the `arithmetic_mean` function:
  ```python
  def arithmetic_mean(sequence):
      s = 0.0
      for element in sequence:
          s += element
      n = len(sequence)
      return s / n
  ```
- In a different cell, call the function:
  ```python
  arithmetic_mean([1, 2, 3, 4, 5])
  ```
- Run all cells.
- Save the notebook.
````


## Use cases for notebooks

- Really good for **linear workflows** (e.g. read data, filter data, do some statistics, plot the results)
- Experimenting with new ideas, testing new libraries/databases
- As an *interactive* development environment for code, data analysis, and visualization
- Keeping track of interactive sessions, like a **digital lab notebook**
- **Supplementary information with published articles**


## Good practices

Run all cells before sharing/saving to verify that the results you see on your
computer were not due to cells being run out of order.
