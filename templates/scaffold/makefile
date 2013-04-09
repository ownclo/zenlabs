
# Define your own root tex file
# if $(PROJECT_NAME) is undefined.
pdf : $(PROJECT_NAME)
	latexmk -pdf $<

clean:
	latexmk -c

wipe:
	latexmk -C
