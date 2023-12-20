# Modules and Packages

![Python Package Index](img/pypi.png "https://pypi.org"){ height=75% }

---

## Modularization

Programs often contain large amounts of functions and classes

 - they can be grouped into cohesive sets

 - some of these can be reused in other programs

*Python provides built-in modularization*

---

## Modules

 - represent loaded scripts

 - have the same name as the script (without `.py`)

 - have the variables of the script as attributes

 - are reused after being loaded once

---

### Why the boilerplate?

 - when loading a script it is executed from top to bottom

 - when not loading as a module the variable `__name__` is `"__main__"`

 - checking this variable prevents unwanted code execution

---

## Importing Modules

 - `import module` loads a module and stores it in the variable `module`

 - the module search path is searched for a matching file with a `.py` extension

 - `from module import value` stores `module.value` in the variable `value`

```py
# print the python implementation
import sys
print(sys.implementation.name)

# alternative which does the same
from sys import implementation
print(implementation.name)
```

---

### Module search path

 - controls where modules are searched

 - stored in [`sys.path`](https://docs.python.org/3/library/sys.html#sys.path)

 - contains by default the directory of the started script

---

## Packages

 - are directories containing a `__init__.py`

 - can be imported like modules (which loads `__init__.py`)

 - modules in them have the name `package.module`

 - contained modules can import from their enclosing package with `from . import module`

**Prevent cyclic imports!**

---

## Built-in Modules

 - Python already provides many modules (batteries included)

 - they are listed in the [documentation](https://docs.python.org/3/library)

Some examples:

| Module   | Content                            |
|----------|------------------------------------|
| sys      | Interfaces to the Python Runtime   |
| os       | Interfaces to the Operating system |
| re       | Regular expressions                |
| math     | mathematical functions             |
| datetime | Date and Time functions            |
| random   | Random number generator            |

---

## Installing modules

 - user contributed modules can be installed using [`pip`](https://packaging.python.org/en/latest/tutorials/installing-packages/#use-pip-for-installing)

 - `pip` can be installed by executing [this](https://bootstrap.pypa.io/get-pip.py) Python script

 - the [Python Package Index](https://pypi.org) lists available modules

 - per default they are installed in the global packages for the current user

**Be careful when installing code from other people!**

```sh
# install a module
python3 -m pip install "module"

# list installed modules
python3 -m pip list

# uninstall a module
python3 -m pip uninstall "module"
```

---

## Virtual environments

 - some enviroments disallow pip to install packages globally

 - multiple projects might require different version of the same package

 - the [`venv`](https://docs.python.org/3/library/venv.html) module allows to create independent environments

```sh
# create environment in directory
python3 -m venv directory

# activate environment (bash)
source directory/bin/activate

# deactive environment
deactivate
```