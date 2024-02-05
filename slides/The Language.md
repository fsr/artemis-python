# The Language

![Python Logo](img/python.png "https://commons.wikimedia.org/wiki/File:Python_logo_01.svg"){ height=75% }

---

## Basics

*Python is an object oriented scripting language*

 - everything is an object

 - source code is executed directly

   (from top to bottom)

 - source code has the extension `.py`

---

## Comments

*Code Tells You How, Comments Tell You Why*

 - allow to add additional information

 - `#` marks a whole line as a comment

```python
# this is a comment!
print("Hello World!")   # this one too!
```

---

## Function calls

 - functions are code you can execute

 - they may take variables (arguments)

 - arguments can be passed as keywords

 - arguments are passed between '(' and ')'

```python
print("Hello World!")
print("Your name is", input("Name: "), sep=": ")
```

---

## Variables

 - store objects as references

 - can be changed (not immutable)

 - dont have a type

 - only available after assignment

```python
a = "Hello World!"
print(a)
a = "Bye World!"
print(a)
```

---

## Logic

 - conditions can be `True` or `False`

 - evaluate to instances of [`bool`](https://docs.python.org/3/library/stdtypes.html#boolean-type-bool)

| Operator | Operation    |
|----------|--------------|
| not      | Negation     |
| and      | Conjunction  |
| or       | Disjunction  |
| ^        | Exclusive or |

```python
    True and False  # False

    True or False   # True

    True ^ True     # False
```

---

## Control Structures

 - control the order in which code is executed

 - blocks of code are indented by whitespace

 - whitespace indent of a block must be the same

---

### Conditional Statement

 - executes code whether a condition is `True` or `False`

```python
    if True or False:   # condition is True
        print("Executed")
    else:
        print("not Executed")
```

---

### While Loop

 - executes code while a condition is `True`

 - can be terminated with a `break`

 - can be resumed with a `continue`

```python
    while True or False:    # condition is True
        print("Executed")
        break
        print("not Executed")
    print("Executed")
```

---

### For Loop

 - iterates through an [`Iterator`](https://docs.python.org/3/glossary.html#term-iterator)

 - iterators are an abstract sequence of values

 - in every iteration the current value is available as a variable

```python
    for i in range(10):
        print(i)
```
