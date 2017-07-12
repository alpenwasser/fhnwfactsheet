.DEFAULT: all

all:
	@pdflatex batcapture
	@pdflatex batrec
	@pdflatex Main
	@pdflatex sonart
	@pdflatex upone
	@pdflatex wbox
	@pdflatex plain

tidy:
	@rm -f *.aux
	@rm -f *.toc
	@rm -f *.out
	@rm -f *.log

clean: tidy
	@mv logo-top.pdf logo-top.pdf.bak
	@rm -f *.pdf
	@mv logo-top.pdf.bak logo-top.pdf
