# int and float

![Number sets](img/numbers.png "https://commons.wikimedia.org/wiki/File:NumberSetinC.svg"){ height=75% }

---

## The numeric tower

 - Python supports multiple numeric datatypes

 - they have different use cases and strengths

 - inherit from a class in the [`numbers`](https://docs.python.org/3/library/numbers.html) module

---

### Integers

 - represent natural numbers which can be negative

 - can contain arbitrary large numbers unlike most other languages

 - can be created by calling [`int(value)`](https://docs.python.org/3/library/functions.html#int)
   or using literals like `42` or `-9`

---

### Floats

 - represent real numbers

 - have limited accuracy making them not suitable for things like money (`0.1 + 0.1 + 0.1 != 0.3`)

 - can be created by calling [`float(value)`](https://docs.python.org/3/library/functions.html#float)
   or using literals like `42.6` or `426e-1`

---

### Complex numbers

 - have a real and imaginary part

 - are mostly used for scientific calculations

 - can be created by calling [`complex(real, imag)`](https://docs.python.org/3/library/functions.html#complex)
   or using literals like `3+2j` for `complex(3, 2)`

---

### Special types

 - [`fractions.Fraction`](https://docs.python.org/3/library/fractions.html#fractions.Fraction)
   can accurately represent rational numbers (fractions of two integers)

 - [`decimal.Decimal`](https://docs.python.org/3/library/decimal.html#decimal.Decimal)
   can accurately represent floats with a specified accuracy

 - are often slower than the normal datatype

---

## Operators

| Operator | Operation          |
|----------|--------------------|
| +        | Addition           |
| -        | Subtraction        |
| *        | Multiplication     |
| **       | Exponentiation     |
| /        | Division           |
| //       | Integer division   |
| %        | Modulo (remainder) |

---

### Comparisons

| Operator | Operation        |
|----------|------------------|
| ==       | Equality         |
| !=       | Inequality       |
| >        | greater          |
| >=       | greater or equal |
| <        | less             |
| <=       | less or equal    |

 - do not use the `is` operator to perform value comparisions!

---

## Rounding

 - [`round(value, digits=None)`](https://docs.python.org/3/library/functions.html#round)
   converts a number to an integer or another number rounded to `digits`
   precision after the decimal point if provided

 - [`math.ceil(value)`](https://docs.python.org/3/library/math.html#math.ceil)
   converts a number to an integer by rounding up

 - [`math.floor(value)`](https://docs.python.org/3/library/math.html#math.floor)
   converts a number to an integer by rounding down

 - [`math.trunc(value)`](https://docs.python.org/3/library/math.html#math.trunc) 
   converts a number to an integer by rounding towards zero