# Reading and writing data with pandas

```{objectives}
- Knowing that pandas is a popular library for handling tabular data
- Learning some basic usage of pandas dataframes
- Reading data with pandas from disk or a web resource
- Get a feeling for when pandas is useful and know where to find more information
```

```{instructor-note}
- 15 min talking/demo
- 15 min exercise
```

[this lesson is adapted from <https://aaltoscicomp.github.io/python-for-scicomp/pandas/>]

## Use case

Pandas dataframes are a great data structure for **tabular data**. The pandas
library provides dataframes, and functions for reading data into dataframes and
for analyzing, filtering, and manipulating data in very compact form.

The name is derived from the term "panel data".


## Reading data into a dataframe

Pandas can read from and write to a large set of formats
([overview of input/output functions and formats](https://pandas.pydata.org/pandas-docs/stable/reference/io.html)).

We will experiment with some example weather data
obtained from
[Norsk KlimaServiceSenter](https://seklima.met.no/observations/),
Meteorologisk institutt (MET)
(CC BY 4.0).

We will load a CSV file directly from the web. Instead of using a web URL
we could use a local file name instead.

Try this:
```python
import pandas as pd

url = "https://raw.githubusercontent.com/coderefinery/data-visualization-python/main/data/tromso.csv"
data_tromso = pd.read_csv(url)

data_tromso
```
```{discussion}
Does not look quite right. Can you spot two problems?
```

We can solve the problem with delimiters and avoid a problem later
down the road by specifying that the decimal is a comma:
```python
import pandas as pd

url = "https://raw.githubusercontent.com/coderefinery/data-visualization-python/main/data/tromso.csv"
data_tromso = pd.read_csv(url, delimiter=";", decimal=",")
```


## What is in a dataframe?

```{figure} img/pandas/dataframe.svg
:alt: A pandas dataframe object is composed of rows and columns

A pandas dataframe object is composed of rows and columns.
```

Let us explore these together in the notebook:
```python
# print an overview of the dataset
data_tromso

# print the first 5 rows
data_tromso.head()

# print the last 5 rows
data_tromso.tail()

# print all column titles - no parentheses here
data_tromso.columns

# print table dimensions - no parentheses here
data_tromso.shape

# print one column
data_tromso["max temperature"]

# get some statistics
data_tromso["max temperature"].describe()
data_tromso["max temperature"].max()
data_tromso["max temperature"].median()

# print all rows where max temperature was above 20
data_tromso[data_tromso["max temperature"] > 20.0]
```


## Combining dataframes

Using pandas we can **merge, join, concatenate, and compare**
dataframes, see <https://pandas.pydata.org/pandas-docs/stable/user_guide/merging.html>.

Let us try to concatenate two dataframes: one for Tromsø weather data (which we
already loaded into `data_tromso`) and one for Oslo:
```python
import pandas as pd

url = "https://raw.githubusercontent.com/coderefinery/data-visualization-python/main/data/oslo.csv"
data_oslo = pd.read_csv(url, delimiter=";", decimal=",")
```

Now we can concatenate them:
```python
data = pd.concat([data_tromso, data_oslo], axis=0)

# let us print the result
data
```

Once combined, we can do interesting queries like this one:
```python
data.groupby("name").describe()
```


## Data cleaning

Before plotting the data, there are two more problems which we may not see yet:
- Dates are not in a standard date format
- Snow depth sometimes contains "-" which Python may have difficulties interpreting as a number

We can clean up both these problems

```python
# replace dd.mm.yyyy to date format
data["date"] = pd.to_datetime(data["date"], format="%d.%m.%Y")

# replace "-" by 0
data['snow depth'] = pd.to_numeric(data['snow depth'], errors='coerce')
```


## Plotting the data

```{danger}
TODO: add some meta-text
```

```python
import seaborn as sns

# https://seaborn.pydata.org/generated/seaborn.set_style.html
sns.set_style("whitegrid")

plot = sns.lineplot(x="date", y="max temperature", hue="name", data=data)

# uncomment next line to save the figure
# plot.figure.savefig("temperatures.png")
```

```{figure} img/pandas/temperatures.png
:alt: Max daily temperatures in Tromsø and Oslo over a year

Max daily temperatures in Tromsø and Oslo over a year.
```

```python
plot = sns.relplot(x="date",
                   y="max temperature",
                   hue="name",
                   col="name",  # try commenting this out or changing to "row"
                   kind="line",
                   data=data)

# uncomment next line to save the figure
# plot.savefig("temperatures-side-by-side.png")
```

```{figure} img/pandas/temperatures-side-by-side.png
:alt: Max daily temperatures in Tromsø and Oslo over a year side by side

The same data as above, this time side by side.
```

```{code-block} python
---
emphasize-lines: 2, 5
---
plot = sns.relplot(x="date",
                   y="snow depth",
                   hue="name",
                   col="name",  # try commenting this out or changing to "row"
                   kind="scatter",
                   data=data)

# uncomment next line to save the figure
# plot.savefig("snow-depth.png")
```

```{figure} img/pandas/snow-depth.png
:alt: Snow depth side by side

Snow depth side by side.
```


## Where to find more information and help

Pandas is extremely powerful and there is a lot that can be done and there are great
resources to explore more:
- [Getting started guide](https://pandas.pydata.org/getting_started.html)
  (including tutorials and a 10 minute flash intro)
- [10 minutes to pandas tutorial](https://pandas.pydata.org/docs/user_guide/10min.html)
- [Pandas documentation](https://pandas.pydata.org/docs/)
- [Cheatsheet](https://pandas.pydata.org/Pandas_Cheat_Sheet.pdf)
- [Cookbook](https://pandas.pydata.org/docs/user_guide/cookbook.html#cookbook)
- [Data Carpentry lesson](https://datacarpentry.org/python-ecology-lesson/) "Data Analysis and Visualization in Python for Ecologists"
  (useful not only for ecologists)


## Exercises

```{danger}
TODO: exercise description to be added
```

```{challenge} Exercise: read a csv file from disk
- Create and save a csv file
- Read it using pandas
- Plot the data using Seaborn
```

```{keypoints}
- Pandas dataframes are a good data structure for tabular data
- Dataframes allow both simple and advanced analysis in very compact form
- Some visualization libraries interface very nicely with pandas dataframes
```
