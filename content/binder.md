# Sharing reproducible data science pipelines using Binder

```{objectives}
- Have a recipe to share a dynamic and reproducible visualization pipeline
```

```{instructor-note}
- 20 min presentation and discussion
```

[this lesson is adapted from <https://coderefinery.github.io/jupyter/06-sharing/>]


## Sharing dynamic notebooks using [Binder](https://mybinder.org/)

In an earlier episode we have created this notebook:
```python
import pandas as pd
import seaborn as sns

# read dataset 1
url = "https://raw.githubusercontent.com/coderefinery/data-visualization-python/main/data/tromso.csv"
data_tromso = pd.read_csv(url, delimiter=";", decimal=",")

# read dataset 2
url = "https://raw.githubusercontent.com/coderefinery/data-visualization-python/main/data/oslo.csv"
data_oslo = pd.read_csv(url, delimiter=";", decimal=",")

# combine data
data = pd.concat([data_tromso, data_oslo], axis=0)

# replace dd.mm.yyyy to date format
data["date"] = pd.to_datetime(data["date"], format="%d.%m.%Y")

# replace "-" by 0
data['snow depth'] = pd.to_numeric(data['snow depth'], errors='coerce')

# finally the plot
plot = sns.relplot(x="date",
                   y="snow depth",
                   hue="name",
                   col="name",
                   kind="scatter",
                   data=data)
```

We will now first share it via [GitHub](https://github.com/) "statically",
then using [Binder](https://mybinder.org/).

````{challenge} Exercise/demo: Making your notebooks reproducible by anyone (15 min)
Instructor:
- Creates a GitHub repository
- Uploads the notebook file
- Then we look at the statically rendered version of the notebook on GitHub
- Create a `requirements.txt` file which contains:
  ```text
  pandas==1.2.3
  seaborn==0.11.1
  ```
- Commit and push also this file to your notebook repository.
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

- You can get a DOI for any GitHub "release" using [Zenodo](https://zenodo.org/).
- [Binder](https://mybinder.org/) can also run notebooks from Zenodo.
- It can be a very good idea to place your visualization pipeline on GitHub+Zenodo+Binder
  and in the supporting information of your paper to refer to its DOI.
