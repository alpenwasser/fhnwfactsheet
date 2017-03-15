DOCUMENT := 'Main'

default:
	@pdflatex $(DOCUMENT)

lua:
	@lualatex $(DOCUMENT)

xetex:
	@xelatex $(DOCUMENT)

clean:
	@rm -f $(DOCUMENT).aux
	@rm -f $(DOCUMENT).log
	@rm -f $(DOCUMENT).pdf
