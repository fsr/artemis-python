slides :=	slides/Bytes\ and\ Strings.pdf \
			slides/Exceptions\ and\ Context\ managers.pdf \
			slides/Functions,\ Objects\ and\ Classes.pdf \
			slides/int\ and\ float.pdf \
			slides/The\ Language.pdf \
			slides/Modules\ and\ Packages.pdf \
			slides/Collections\ and\ Iterators.pdf \
			slides/Decorators\ and\ advanced\ Functions.pdf \
			slides/Comprehensions.pdf

all: $(slides)

clean:
	rm $(slides)

%.pdf: %.md
	pandoc -t beamer "$<" -o "$@"