# Python basics

```{objectives}
- Knowing what types exist
- Knowing the most common data structures: lists, tuples, dictionaries, and sets
- Creating and using functions
- Knowing what a library is
- Knowing what `import` does
- Being able to "read" an error
```

[20 min talking/type-along; there will be more text and screenshots]

## Motivation for Python

free, ecosystem, also mention R and Matlab and Julia


## Basic types

int, float, string, bool


## Data structures for collections: lists, tuples, dictionaries, and sets


## Looping over collections


## Functions

- Together we write a function which sums all elements in a list
- We reuse this function to write a function which computes the mean


## Reading error messages

Here we introduce a mistake and we together try to make sense of the traceback.


## Exercises

````{challenge} Exercise: create a function that computes the standard deviation (15 min)
- This is an adaptation of the "function which computes the mean".
- Arithmetic mean: $\bar{x} = \frac{1}{N} \sum_{i=1}^N x_i$
- Standard deviation: $\sqrt{ \frac{1}{N} \sum_{i=1}^N (x_i - \bar{x})^2 }$
- In other words the computation is similar but we need to sum over squares of differences and at the end take a square root.
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

Example: numpy.std.


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
