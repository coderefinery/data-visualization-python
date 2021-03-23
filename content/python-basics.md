# Python basics

```{objectives}
- Knowing what types exist
- Knowing the most common data structures: lists, tuples, dictionaries, and sets
- Creating and using functions
- Knowing what a library is
- Knowing what `import` does
- Being able to "read" an error
```

````{discussion} Instructor notes
- 20 min talking/type-along
- 15 min exercise
- there are optional exercises for later/ homework
````


## Motivation for Python

- **Free**
- Huge **ecosystem of examples, libraries, and tools**
- Relatively easy to read and understand
- Similar in scope and use cases to R, Julia, and Matlab


## Basic types

```python
# int
num_measurements = 13

# float
some_fraction = 0.25

# string
name = "Bruce Wayne"

# bool
value_is_missing = False
skip_verification = True

# we can print values
print(name)

# and we can do arithmetics with ints and floats
print(5 * num_measurements)
print(1.0 - some_fraction)
```

- Python is **dynamically typed**:
  We do not have to define that an integer is an `int`, we can use it this way
  and Python will infer it
- However, one can use type annotations in function definitions
- Now you also know that we can add `# comments` to our code


## Data structures for collections: lists, dictionaries, sets, and tuples

```python
# lists are good when order is important
scores = [13, 5, 2, 3, 4, 3]

# first element
print(scores[0])

# we can add items to lists
scores.append(4)

# lists can be sorted
scores.sort()
print(scores)

# dictionaries are useful if you want to look up
# elements in a collection by something else than position
experiment = {"location": "Svalbard", "date": "2021-03-23", "num_measurements": 23}

print(experiment["date"])

# we can add items to dictionaries
experiment["instrument"] = "a particular brand"
print(experiment)
```

- **Sets** are useful for unordered collections where you want to make sure that there are no repetitions.
- There are also **tuples** that are similar to lists but their items cannot be modified.

You can put:
- dictionaries inside lists
- lists inside dictionaries
- dictionaries inside dictionaries
- lists inside lists
- tuples inside ...
- ...


## Iterating over collections

Often we wish to iterate over collections.

Iterating over a list:
```python
scores = [13, 5, 2, 3, 4, 3]

for score in scores:
    print(score)

# example with f-strings
for score in scores:
    print(f"the score is {score}")
```

Iterating over a dictionary:
```python
experiment = {"location": "Svalbard", "date": "2021-03-23", "num_measurements": 23}

for key in experiment:
    print(experiment[key])

# another way to iterate
for (key, value) in experiment.items():
    print(key, value)
```

## Functions

Functions are like **reusable recipes**. They receive ingredients (input arguments),
then inside the function we do/compute something with these arguments,
and they return a result.

```python
def add(a, b):
    result = a + b
    return result
```

- Together we write a function which sums all elements in a list:

```python
def add_all_elements(sequence):
    s = 0.0
    for element in sequence:
        s += element
    return s


measurements = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

print(add_all_elements(measurements))
```

- We reuse this function to write a function which computes the mean

```python
def arithmetic_mean(sequence):
    # we are reusing add_all_elements written above
    s = add_all_elements(sequence)
    n = len(sequence)
    return s / n


measurements = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

mean = arithmetic_mean(measurements)

print(mean)
```

- Functions can call other functions. Functions can also get other functions as
  input arguments.

**Why functions?** Less repetition but also simplify reading and understanding code.


## Reading error messages

Here we introduce a mistake and we together try to make sense of the traceback:

```{figure} img/python/error.png
:alt: Example error traceback
:width: 100%

Example error traceback. Can you explain the error?
```


## Exercises

````{challenge} Exercise: create a function that computes the standard deviation (15 min)
- Arithmetic mean: $\bar{x} = \frac{1}{N} \sum_{i=1}^N x_i$
- Standard deviation: $\sqrt{ \frac{1}{N} \sum_{i=1}^N (x_i - \bar{x})^2 }$
- In other words the computation is similar but we need to sum over squares of differences and at the end take a square root.
- Take this as a starting point:
  ```python
  # we have written this one together previously
  def arithmetic_mean(sequence):
      s = 0.0
      for element in sequence:
          s += element
      n = len(sequence)
      return s / n


  def standard_deviation(sequence):
      # here we need to do some work:
      # mean = ?
      # s = ?
      n = len(sequence)
      return (s / n) ** 0.5
  ```
- If this is the input list:
  ```python
  measurements = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  ```
  Then the result would be: 2.872...
````

````{solution} Solution 1 (longer but hopefully easier to understand)
```python
# we have written this one together previously
def arithmetic_mean(sequence):
    s = 0.0
    for element in sequence:
        s += element
    n = len(sequence)
    return s / n


# notice how this function reuses the other
def standard_deviation(sequence):
    mean = arithmetic_mean(sequence)
    s = 0.0
    for element in sequence:
        s += (element - mean) ** 2
    n = len(sequence)
    return (s / n) ** 0.5
```
````

````{solution} Solution 2 (more compact)
```python
def arithmetic_mean(sequence):
    return sum(sequence) / len(sequence)


def standard_deviation(sequence):
    mean = arithmetic_mean(sequence)
    s = sum([(x - mean) ** 2 for x in sequence])
    n = len(sequence)
    return (s / n) ** 0.5
```
````


## Libraries

We can look at libraries as collections of functions. We can import the libraries/modules
and then reuse the functions defined inside these libraries.

Try this:
```python
import numpy

measurements = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

result = numpy.std(measurements)

print(result)
```

This means `numpy` contains a function called `std` which apparently computes the standard deviation
(check also its [documentation](https://numpy.org/doc/stable/reference/generated/numpy.std.html)).

Often you see this in tutorials (the module is imported and renamed to a shortcut):
```python
import numpy as np

result = np.std([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
```

We will later learn how to create own modules to collect own functions for reuse.


## Optional exercises


````{challenge} Optional exercise/ homework: removing duplicates
- This list contains duplicates:
  ```python
  measurements = [2, 2, 1, 17, 3, 3, 2, 1, 13, 14, 17, 14, 4]
  ```
- Write a function which removes duplicates from the list and sorts the list.
  In this case it would produce:
  ```python
  [1, 2, 3, 4, 13, 14, 17]
  ```
````

````{solution} Solution 1 (longer but hopefully easier to understand)
```python
def remove_duplicates_and_sort(sequence):
    new_sequence = []
    for element in sequence:
        if element not in new_sequence:
            new_sequence.append(element)
    return sorted(new_sequence)
```
````

````{solution} Solution 2 (more compact)
Converting to set removes duplicates.
Then we convert back to list:

```python
def remove_duplicates_and_sort(sequence):
    new_sequence = list(set(sequence))
    return sorted(new_sequence)
```
````

````{challenge} Optional exercise/ homework: counting how often an item appears
- Back to our list with duplicates:
  ```python
  measurements = [2, 2, 1, 17, 3, 3, 2, 1, 13, 14, 17, 14, 4]
  ```
- Your goal is to write a function which will return a dictionary mapping each
  number to how often it appears.
  In this case it would produce:
  ```python
  {2: 3, 1: 2, 17: 2, 3: 2, 13: 1, 14: 2, 4: 1}
  ```
````

````{solution} Solution 1 (longer but hopefully easier to understand)
```python
def how_often(sequence):
    counts = {}
    for element in sequence:
        if element in counts:
            counts[element] += 1
        else:
            counts[element] = 1
    return counts
```
````

````{solution} Solution 2 (more compact)
The point of this solution is to show that
for such common operations, ready-made functions and objects
already exist and is is worth to check out the documentation
about the [collections module](https://docs.python.org/3/library/collections.html).

```python
from collections import Counter, defaultdict


def how_often_alternative1(sequence):
    return dict(Counter(sequence))


def how_often_alternative2(sequence):
    counts = defaultdict(int)
    for element in sequence:
        counts[element] += 1
    return dict(counts)
```
````
