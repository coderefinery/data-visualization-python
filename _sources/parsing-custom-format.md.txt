# Reading data in custom format

From earlier episodes we know that storing data in standard formats can be
convenient and we know about the tidy data format but **sometimes we don't have
control over this**: we may get a text file from another program or an
instrument and now we are expected to deal with it.

As an example, we got two text files from two different instruments. We wish to
extract all frequencies and all intensities into two lists.

This is one, `example1.txt`:
```text
result from instrument: R2-D2
------------------------------------------

  measurement   frequency   intensity

*     1           0.01       0.01
*     2           0.02       0.02
*     3           0.03       0.01
*     4           0.04       0.10
*     5           0.05       0.20
*     6           0.06       0.12
*     7           0.07       0.07
*     8           0.08       0.02
*     9           0.09       0.01
*    10           0.10       0.01

==========================================

timestamp: Sat Mar 27 03:30:34 PM CET 2021
```

And here is the other one, `example2.txt`:
```text
result from instrument: C-3PO
=============================

  numbers we want: 10
      0.01   0.01
      0.02   0.02
      0.03   0.01
      0.04   0.10
      0.05   0.20
      0.06   0.12
      0.07   0.07
      0.08   0.02
      0.09   0.01
      0.10   0.01

  unrelated numbers:
      1.23   4.56
      7.89   0.12
```

At the end we want the code to produce these two lists:
```python
frequencies = [0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.1]
intensities = [0.01, 0.02, 0.01, 0.1, 0.2, 0.12, 0.07, 0.02, 0.01, 0.01]
```

```{discussion}
Before we discuss possible solutions, it can be a good exercise
to **describe in words** what the code should do to extract the numbers.
```

Below you find possible solutions for these two examples. These are designed to
be somehow understandable (which does not mean that the code is trivial) and are not as
short and as elegant as they could be. One way to make them more elegant would
be to use [regular expressions](https://docs.python.org/3/howto/regex.html).

One solution for `example1.txt`:
```python
def read_data(file_name):
    # we start with empty lists
    frequencies = []
    intensities = []

    # open the file with read permissions
    with open(file_name, "r") as f:
        # iterate over all lines in the file object "f"
        for line in f:
            # we are only interested in lines that start with "*"
            if line.startswith("*"):
                # we split the line on "whitespace"
                # the "_" means we are not interested in the first two entries
                _, _, frequency, intensity = line.split()

                # add the new numbers to the lists
                # we convert from string to float
                frequencies.append(float(frequency))
                intensities.append(float(intensity))

    # function returns the result
    return frequencies, intensities


# here we are outside the function
frequencies, intensities = read_data("example1.txt")

print(frequencies)
print(intensities)
```

One solution for `example2.txt`.
```python
def read_data(file_name):
    # we start with empty lists
    frequencies = []
    intensities = []

    # open the file with read permissions
    with open(file_name, "r") as f:
        # iterate over all lines in the file object "f"
        for line in f:
            # we are only interested in lines that start with "*"
            if "numbers we want" in line:
                # we split the line on "whitespace"
                words = line.split()
                # we are only interested in the last element
                # -1 means last element in that list
                last_element = words[-1]
                # convert from string to int
                num_measurements = int(last_element)

                # now we know the next 10 lines are the interesting ones
                # range(10) produces a list with 10 elements: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
                # we use it to iterate exactly 10 times
                for _ in range(num_measurements):
                    # this advances f by one and we get one line at a time
                    next_line = next(f)
                    words = next_line.split()
                    frequency = float(words[0])
                    intensity = float(words[1])
                    # add the new numbers to the lists
                    frequencies.append(frequency)
                    intensities.append(intensity)

    # function returns the result
    return frequencies, intensities


# here we are outside the function
frequencies, intensities = read_data("example2.txt")

print(frequencies)
print(intensities)
```
