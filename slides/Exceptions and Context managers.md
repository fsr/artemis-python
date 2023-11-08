# Exceptions and Context managers

![Oh no!](img/error.png "https://commons.wikimedia.org/wiki/File:Generic_error_message.png"){ height=75% }

---

## Error handling

 - errors are a common occurrence

 - robust programs have to handle errors gracefully:

   - fatal errors should cause a controlled appplication shutdown

   - not all have to be fatal (a network timeout can be retried)

---

## Return values

 - old method primarily used by languages like C

 - depends on failed functions returning special values like `None` on error

 - does not protect against the returned values being ignored

```py
values = {}
if values.get(42) is None:
    print("Value 42 does not exist!")
```

---

## Exceptions

 - alternative method which makes it impossible to ignore errors

 - uses instances of the [`Exception`](https://docs.python.org/3/library/exceptions.html#Exception) class to represent errors

   - custom exceptions can be created by subclassing existing ones

   - multiple exceptions are already [defined](https://docs.python.org/3/library/exceptions.html)

---

### Raising exceptions

 - to signal that an error occured use the `raise` statement

 - raising an exception exits the current function (like `return`)

 - when a function raises an exception it raises it in its caller when returning

```py
def test():
    raise Exception("something went wrong!")
    print("Wont be executed")

test1()
print("Wont be executed")
```

---

### Handling exceptions

 - to catch a raised exception use the `try` statement with `except`

 - `except` prevents exceptions inheriting from a certain class from exiting the current function

 - multiple `except` are allowed and they can be empty to catch all exceptions (not recommended!)

```py
try:
    raise Exception("something went wrong!")
    print("Wont be executed")
except Exception as error:
    print(f"An error occured: {error}")
print("Will be executed")
```

---

#### Prevent exceptions from being handled accidentally

 - `except` handles all exceptions being raised in the `try` statement

 - some exceptions can be raised by multiple functions, which should not be in the `try` statement

 - `else` executes only when no exceptions where raised

```py
try:
	value = parse_value(string)
except Exception:
	print("Parsing failed")
else:
	process(value)
```

---

### Performing cleanup

 - sometimes code like closing files should be executed no matter what happens

 - the `try` statement supports this using `finally`

 - after executing `finally` the program continues undisturbed

```py
try:
    raise Exception("something went wrong!")
    print("Wont be executed")
finally:
    print("Will be executed")
print("Wont be executed")
```

---

### Nesting exceptions

 - when handling an exception other exceptions can be raised

 - when they are not handled they are propagated with the original exception in `__context__`

   - when the new exception was raised intentionally using `raise ... from ...` it is stored in `__cause__`

```py
try:
    try:
        raise ValueError("something went wrong!")
        print("Wont be executed")
    except ValueError:
        raise Exception("oops")
    finally:
        print("Will be executed")
except ValueError:
    print("Wont be executed")
```

---

## Context Managers

 - objects support the `with` statement by having `__enter__` and `__exit__` methods

 - `__enter__` returns the value produced by the `with` statement

 - `__exit__` receives the exception class, its instance and traceback (information where it was raised) which may be `None`

   - is always executed when exiting the `with` stement like `finally`

   - can handle the exception by returning `True`

```py
class Example:

    def __enter__(self):
        print("We enter the statement")
        return self

    def __exit__(self, type, value, traceback):
        print("We exit the statement")

with Example() as example:
    print("We are inside the stement")
```
