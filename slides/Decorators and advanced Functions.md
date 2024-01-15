# Decorators and advanced Functions

![Greek letter lambda](img/lambda.png "https://commons.wikimedia.org/wiki/File:Greek_lc_lamda_thin.svg"){ height=75% }

---

## Functions are values

 - everything in Python is an object

 - Functions are no exception

 - allows for passing functions as parameters

```python
    def call_if(condition, callback):
        if condition:
            callback()

    def say_hello():
        print("Hello World!")

    call_if(True, say_hello)    # Hello World!
```

---

## Anonymous Functions

 - functions can exist without being assigned a name

 - defined using `lambda arg1, ...: expression`

 - only supports expressions (excludes most control flow)

```python
    def call_if(condition, callback):
        if condition:
            callback()

    call_if(True, lambda: print("Hello World!"))
```

---

## Closures

 - functions keep read-only references to the scope in which they are defined

 - allows functions to access values not passed via parameters

```python
    def make_greeter(phrase):
        def greeter(name):
            print(f"{phrase} {name}!")
        return greeter

    greeter = make_greeter("Hello")
    greeter("World")    # Hello World!
```

---

## Default parameters

 - function parameters can be assigned a default value

 - when the parameter is omitted the default value is used

 - default parameters can not be followed by parameters without defaults

**Dont use mutable values as defaults!**

```python
    def make_greeter(phrase="Hello"):
        def greeter(name):
            print(f"{phrase} {name}!")
        return greeter

    greeter = make_greeter()
    greeter("World")    # Hello World!
```

---

## Keyword arguments

 - function parameters are identified by position

 - the name of the parameter can be passed explicitly

 - named arguments can not be followed by positional arguments

```python
    def say_hello(phrase, name):
        print(f"{phrase} {name}!")

    # all output Hello World!
    say_hello("Hello", "World")
    say_hello(name="World", phrase="Hello")
    say_hello("Hello", name="World")
```

---

## Arbitrary Argument Lists

 - functions can accept arbitrary arguments

 - positional arguments which can not be assigned parameters are collected as `tuple` in argument prefixed by `*`

 - keyword arguments of the same type are collected as `dict` in argument prefixed by `**`

 - `*` parameter has to come before `**` parameter (and both can only exist once)

```python
    def test(*args, **kwargs):
        print(args, kwargs)

    test()          # () {}         
    test(1, 2, 3)   # (1, 2, 3) {}
    test(a=1, b=2)  # () {'a': 1, 'b': 2}
```

---

## Unpacking Argument Lists

 - inverse to arbitrary argument lists

 - iterables can be unpacked using the `*` operator

 - dictionaries can be unpacked using the `**` operator

```python
    def greet_all(*names):
        for name in names:
            print(f"Hello {name}!")

    # prints Hello World! and Hello Python!
    greet_all(*["World", "Python"])
```

---

## Decorators

 - functions can be passed to other functions before being assigned a name

 - receiving function is marked behind `@` symbol

 - returned value is assigned the name

```python
    def print_start_end(function):
        def wrapper(*args, **kwargs):
            print("Start")
            function(*args, **kwargs)
            print("End")
        return wrapper

    @print_start_end
    def say_hello():
        print("Hello World!")

    # prints Start, Hello World! an End
    say_hello()
```

---

## Generators

 - functions can produce Iterators using the `yield` statement

 - `yield` returns one value to the caller without exiting the function

 - when the next value is required the function continues

```python
    # already available per default
    def map(function, iterable):
        for value in iterable:
            yield function(value)

    names = ["World", "Python"]
    greetings = map(lambda name: f"Hello {name}!", names)
    # prints Hello World! and Hello Python!
    for greeting in greetings:
        print(greeting)
```
