SLIDES :=	output/Bytes\ and\ Strings.pdf \
			output/Exceptions\ and\ Context\ managers.pdf \
			output/Functions,\ Objects\ and\ Classes.pdf \
			output/int\ and\ float.pdf \
			output/The\ Language.pdf \
			output/Modules\ and\ Packages.pdf \
			output/Collections\ and\ Iterators.pdf \
			output/Decorators\ and\ advanced\ Functions.pdf \
			output/Comprehensions.pdf

PANDOC_COMMAND := pandoc

PANDOC_OPTIONS := -t beamer

.PHONY: clean all

all: $(SLIDES)

clean:
	rm -rf output

output:
	mkdir output

output/%.pdf: slides/%.md img $(wildcard img/*) | output
	$(PANDOC_COMMAND) $(PANDOC_OPTIONS) -o "$@" "$<"