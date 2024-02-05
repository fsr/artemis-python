# Collections and Iterators

![Linked List](img/list.png "https://commons.wikimedia.org/wiki/File:Singly-linked-list.svg"){ height=75% }

---

## Collections

 - are classes whose main purpose is to store other objects

 - inherit from a class in the [`collections.abc`](https://docs.python.org/3/library/collections.abc.html) module

 - have different strengths and weaknesses

---

### Accessing specific Elements

 - collections may provide access to their elements via the index operator

 - it is written by enclosing an index value with square brackets

 - elements can be removed with the `del` operator

```python
    words = "Hello World from Python".split()

    print(words[0])     # prints Hello
    print(words[1])     # prints World

    words[1] = "Test"
    words   # ['Hello', 'Test', 'from', 'Python']
    del words[1]
    words   # ['Hello', 'from', 'Python']
```

---

### Slicing

 - some collections allow to access multiple elements at once

 - they support an extension of the index operator

 - same syntax as substrings (since strings are collections too)

```python
    words = "Hello World from Python".split()

    # returns ['Hello', 'World']
    words[0:2]
    words[:2]

    # returns ['from', 'Python']
    words[2:]
```

---

### Checking for Elements

 - all collections support checking whether they contain an element

 - checking is done via the `in` operator

 - can be negated by writing `not in`

```python
    words = "Hello World from Python".split()

    "World" in words    # True
    42 in words         # False
    42 not in words     # True
```

---

### Accessing all Elements

 - the number of elements can be accessed by calling [`len(collection)`](https://docs.python.org/3/library/functions.html#len)

 - a `for` loop iterates through all elements of a collection

```python
    words = "Hello World".split()

    # prints Hello and then World
    for word in words:
        print(word)
```

---

## Builtin Collections

 - Python already defines many collections

 - they are available per default

 - more specialised collections are available in the [`collections`](https://docs.python.org/3/library/collections.html) module

---

### list

 - Sequence which contains objects in a certain order

 - can be created by calling [`list()`](https://docs.python.org/3/library/functions.html#func-list) or enclosing elements in square brackets

 - provides fast access to elements by integer index (starting from 0)

 - support efficient addition and removal of the last element

```python
    l = [1, 9, "Hello", []]

    l[0]    # 1
    l[1]    # 9
    len(l)  # 4

    l.append(42)    # [2, 9, "Hello", [], 42]
    l.pop()         # 42
```

---

### tuple

 - immutable (and hashable) Sequence

 - can be created by calling [`tuple()`](https://docs.python.org/3/library/functions.html#func-tuple) or enclosing elements in parenthesis

 -  sometimes the parenthesis can be omitted

```python
    t = (1, 9, "Hello", [])

    t[0]    # 1
    t[1]    # 9
    len(t)  # 4
```

---

### dict

 - Mapping which contains objects associated to other hashable objects (keys)

 - provides fast access to the value of a key and checks whether a key exists

 - has no ordering ([not anymore](https://mail.python.org/pipermail/python-dev/2017-December/151283.html) since Python 3.7)

 - can be created by calling [`dict()`](https://docs.python.org/3/library/functions.html#func-dict) or enclosing key-value pairs in curly brackets

```python
    d = {"Hello": 42, "World": 24}

    d["Hello"]      # 42
    "Hello" in d    # True
    42 in d         # False, checks for keys
    42 in d.values()            # True
    ("Hello", 42) in d.items()  # True
```

---

### set

 - unordered collection of hashable objects

 - contains every element exactly once

 - provides efficient checks whether an object is present

 - can be created by calling [`set()`](https://docs.python.org/3/library/functions.html#func-set) or enclosing elements in curly brackets

```python
    s = {42, 24}

    42 in s     # True
    43 in s     # False

    s.add(43)
    s.remove(42)
    42 in s     # False
    43 in s     # True
```

---

### frozenset

 - immutable (and hashable) set

 - can be created by calling [`frozenset(set)`](https://docs.python.org/3/library/functions.html#func-frozenset)

 - can be used as dict keys or elements in other sets

---

## Iterators

 - are an abstract sequence of values

 - provide a `__next__()` method which returns the next element of the sequence

 - the [`next(iterator)`](https://docs.python.org/3/library/functions.html#next) function gets the next element

 - `__next__()` raises [`StopIteration`](https://docs.python.org/3/library/exceptions.html#StopIteration) when there are no more elements

**Sharing Iterators is dangerous since they contain state!**

---

### Iterables

 - are objects which can provide an Iterator

 - provide a `__iter__()` method which returns an Iterator

 - Iterator can be created by calling [`iter(iterable)`](https://docs.python.org/3/library/functions.html#iter)

 - used by the `for` loop

**Some Iterables can not be modified while an Iterator exists!**

---

### Adapters

 - [`range(start, stop, step=1)`](https://docs.python.org/3/library/functions.html#func-range) creates a sequence of integers

 - [`zip(*iterables)`](https://docs.python.org/3/library/functions.html#zip) combines multiple Iterables into a single one

 - [`all(iterable)`](https://docs.python.org/3/library/functions.html#all) and [`any(iterable)`](https://docs.python.org/3/library/functions.html#any)
   check whether all (or any) elements of an Iterable are `True`

 - the [`itertools`](https://docs.python.org/3/library/itertools.html) module provides more tools for Iterators

**Collections are Iterables too!**

---

### Examples

```python
    for i in [1, 2, 3]:
        if i > 9:
            break
    else:   # executed when no break was executed
        print("no element bigger than 9")

    iterator = iter(range(0, 2))
    next(iterator)  # 0
    next(iterator)  # 1
    next(iterator)  # raises StopIteration

    all([True, False, True])  # False
    any([True, False, True])  # True
```

---

### Unpacking

 - Iterables can be unpacked into multiple variables

 - the last variable can be a list of all remaining elements

 - can be used in `for` loops and variable assignment

```python
    t = (1, 2, 3)

    x, y, z = t         # x=1 y=2 z=3
    first, *rest = t    # first=1 rest=[2, 3]

    for key, value in {"Hello": 42, "World": 24}.items():
        print(key, value)
```
