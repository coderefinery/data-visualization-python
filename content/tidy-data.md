# Tidy data and dealing with messy data

```{objectives}
- Knowing about different storage formats
- Knowing about the tidy data format
- Be able to reformat tabular data into the tidy data format
```

````{discussion} Instructor notes
- 25 min motivation/discussion/demo
````


## Importing data from spreadsheets

We will create a spreadsheet with the following content (content does not matter,
can be adapted):
```
weekday    number of coffees
monday     3
tuesday    2
wednesday  3
thursday   4
friday     2
saturday   2
sunday     3
```

Copy this also to the second sheet and for demonstration purpose
add some side-notes to the second sheet and also color
one or two cells (some people like to give some meaning to cells using color).

Save the spreadsheet as `experiment.xls`.

Now read and inspect both sheets:
```python
import pandas as pd

data = pd.read_excel('experiment.xls', sheet_name="Sheet1")
data

data = pd.read_excel('experiment.xls', sheet_name="Sheet2")
data
```

````{discussion}
- We can import data from spreadsheets!
  (see [documentation](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.read_excel.html))
- "Side notes" in spreadsheets can be annoying in this context
- Also encoding data in cell colors is a problem now
````


## Tidy data

[Hadley Wickham: Tidy Data](http://vita.had.co.nz/papers/tidy-data.pdf)

Explain what it is and motivate why it can be a useful format.

As a motivation we will try to expand the plotting from previous episode. It
will require adapting the scripts. Then we will discuss how convenient it would
be to extend plotting without modifying scripts a lot.
