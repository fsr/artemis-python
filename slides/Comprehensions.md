# Comprehensions

![Why sugar?](img/sugar.jpg "https://commons.wikimedia.org/wiki/File:W%C3%BCrfelzucker_--_2018_--_3582.jpg"){ height=75% }

---

## Syntactic sugar

 - makes things easier to read or express

 - does not add more expressive power to the language

 - designed for use by humans

---

## List Comprehensions

 - concise way to create lists

 - syntax is `[EXPRESSION for VARIABLE in ITERABLE]`

 - resulting list contains result of EXPRESSION for every element of ITERABLE

```python
    base = 2
    # [1, 2, 4, 8, 16]
    powers = [base ** i for i in range(5)]
```

---

## Filtering

 - elements can be ignored by a filter

 - FILTER is an expression which evaluates to whether the element should be kept (`True` or `False`)

 - syntax is `[EXPRESSION for VARIABLE in ITERABLE if FILTER]`

```python
    # [0, 2, 4, 6, 8]
    even = [x for x in range(10) if x % 2 == 0]
```

---

## Nesting

 - multiple iterables can be nested

 - equivalent to nested for loops

**Big comprehensions have poor readability!**

```python
combs = [(x, y) for x in [1,2,3] for y in [3,1,4]]
# equivalent
combs = []
for x in [1,2,3]:
    for y in [3,1,4]:
        combs.append((x, y))
```

---

## Dictionary Comprehensions

 - concise way to create dicts

 - syntax is `{KEY: VALUE for VARIABLE in ITERABLE}`

 - KEY and VALUE expressions generate dictionary key and value

```python
    names = ["Alan", "Charles", "Konrad"]
    # {'Alan': 4, 'Charles': 7, 'Konrad': 6}
    lengths = {i: len(i) for i in names}
```

---

## Generator Comprehensions

 - like list comprehensions, but result is an iterable

 - syntax is `(EXPRESSION for VARIABLE in ITERABLE)`

 - can only be iterated once (saves memory)

```python
    even = (x for x in range(10) if x % 2 == 0)
    # [0, 2, 4, 6, 8], exhausts the iterable
    list(even)
    # parenthesis can be omitted in function call
    list(x for x in range(10) if x % 2 == 0)
```
