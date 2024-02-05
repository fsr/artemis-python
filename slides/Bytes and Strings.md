# Bytes and Strings

![Unicode Logo](img/unicode.png "https://commons.wikimedia.org/wiki/File:New_Unicode_logo.svg"){ height=75% }

---

## Strings

 - represent sequences of characters (Unicode code points)

 - are immutable, which requires that operations on them create new strings

 - implemented using the Type [`str`](https://docs.python.org/3/library/stdtypes.html#text-sequence-type-str)

 - can be created by enclosing text in `'single'` or `"double"` quotes (literals)

 - the length can be determined by [`len(string)`](https://docs.python.org/3/library/functions.html#len)

---

### Escape Sequences

 - strings can contain characters which are difficult to type

 - escape sequences allow to represent them using ASCII characters

 - always start with a backslash and can be disabled by writing `r"string"`

| Escape sequence     | Result                           |
|---------------------|----------------------------------|
| \\n                 | ASCII Linefeed                   |
| \\t                 | ASCII Horizontal Tab             |
| \\\\\\\\            | \\\\                             |
| \\"                 | " (works with single quotes too) |

---

### Operators

 - strings can be concatenated by adding them using `+`

 - doing so with [`str.join(strings)`](https://docs.python.org/3/library/stdtypes.html#str.join)
   is more efficient when concatenating many strings

 - using `*` with a string and an integer repeats the string

 - `==` checks whether two strings are equal 

   (`!=` checks the opposite)

 - do not use the `is` operator to perform value comparisions!


```python
    # both are equal to "Hello World!"
    "Hello" + " " + "World!"

    " ".join(["Hello", "World"])
```

---

### Substrings

 - substrings can be accessed using `string[start:end]` with end defaulting to `start + 1`

 - writing `:` without specifying a value defaults to the start and end of the string

```python
    # returns "Hello"
    "Hello World!"[0:5]
    "Hello World!"[:5]

    # returns " "
    "Hello World!"[5]
```

---

### Splitting

 - [`str.partition(seperator)`](https://docs.python.org/3/library/stdtypes.html#str.partition)
   splits the string into the part before the first seperator, the seperator and the part after the seperator

 - [`str.split(seperator)`](https://docs.python.org/3/library/stdtypes.html#str.split)
   splits the string into a list of substrings at the seperator (opposite to `str.join`)
  
```python
    # returns ("Hello", " ", "World!")
    before, seperator, after = \
      "Hello World!".partition(" ")

    # returns ("Hello World!", "", "")
    "Hello World!".partition("not found")

    # returns ["Hell", " W", "rld!"]
    "Hello World!".split("o")
```
---

### Formatting

 - strings can be filled with values by using [`str.format(*args, **kwargs)`](https://docs.python.org/3/library/stdtypes.html#str.format)

 - values to be filled in are represented using curly brackets ({})
   containing the index or name of the value to be filled in

 - literals perfixed with `f` can contain variables

```python
    # both are equal to "Hello World!"
    "{greeting} {0}!".format("World", greeting="Hello")

    greeted = "World"
    f"Hello {greeted}!"
```

---

## Bytes

 - similar to strings, but dont have to contain valid text

 - implemented using the Type [`bytes`](https://docs.python.org/3/library/stdtypes.html#bytes-objects)

 - literals are prefixed with `b`

 - can be transformed into strings using [`bytes.decode(encoding)`](https://docs.python.org/3/library/stdtypes.html#bytes.decode)

 - can be created from strings using [`str.encode(encoding)`](https://docs.python.org/3/library/stdtypes.html#str.encode)

```python
b"Hello W\xc3\xb6rld!".decode("utf8") == "Hello Wörld!"
b"Hello W\xc3\xb6rld!" == "Hello Wörld!".encode("utf8")
```