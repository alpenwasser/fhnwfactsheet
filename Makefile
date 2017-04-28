DOCUMENT := 'Main'
TIMESTAMP := $(shell date '+%Y-%m-%d--%H-%M-%S')
PARTDOC := partial

default:
	@pdflatex $(DOCUMENT)

lua:
	@lualatex $(DOCUMENT)

xetex:
	@xelatex $(DOCUMENT)

clean:
	@rm -f $(DOCUMENT).aux
	@rm -f $(DOCUMENT).log
	@rm -f $(DOCUMENT).toc
	@rm -f $(DOCUMENT).pdf
	@rm -f $(DOCUMENT).out
	@rm -f $(PARTDOC).aux
	@rm -f $(PARTDOC).log
	@rm -f $(PARTDOC).pdf
	@rm -f $(PARTDOC).out

partial:
	@pdflatex $(PARTDOC)

snapshot:
	@cp $(DOCUMENT).pdf snapshots/$(DOCUMENT)--$(TIMESTAMP).pdf
