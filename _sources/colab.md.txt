# Going through the course using Google Colab

It is possible to go through the workshop examples using [Google Colab](https://colab.google/).

However you may need the following cell on top of your notebook:
```python
import altair as alt

# this is here for google colab to update altair
if not alt.__version__.startswith("5"):
    %pip install altair==5.5.0
```

And then you may need to click on "Runtime" -> "Restart session and run all".
