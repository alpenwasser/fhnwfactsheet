default:
	@latex fhnwfactsheet.ins
	@pdflatex fhnwfactsheet.dtx
	@makeindex -s gind.ist -o fhnwfactsheet.ind fhnwfactsheet.idx
	@mv fhnwfactsheet.pdf fhnwfactsheet-en.pdf
	@pdflatex fhnwfactsheet-de.tex
	@makeindex -s gind.ist -o fhnwfactsheet-de.ind fhnwfactsheet-de.idx
	@cp fhnwfactsheet.cls ../
	@cp fhnwfactsheet.cls ../examples
	@cp fhnwfactsheet.cls ../examples/batcapture
	@cp fhnwfactsheet.cls ../examples/batrec
	@cp fhnwfactsheet.cls ../examples/plain
	@cp fhnwfactsheet.cls ../examples/sonart
	@cp fhnwfactsheet.cls ../examples/upone
	@cp fhnwfactsheet.cls ../examples/wbox
	@cp fhnwfactsheet-en.pdf ../
	@cp fhnwfactsheet-de.pdf ../

# Preserve PDF documents, template and class file.
# This is what we might want to hand to an end user.
tidy:
	@rm -f fhnwfactsheet.aux
	@rm -f fhnwfactsheet.glo
	@rm -f fhnwfactsheet.idx
	@rm -f fhnwfactsheet.log
	@rm -f fhnwfactsheet.dvi
	@rm -f fhnwfactsheet.tex
	@rm -f fhnwfactsheet.out
	@rm -f fhnwfactsheet.toc
	@rm -f fhnwfactsheet.ilg
	@rm -f fhnwfactsheet.ind
	@cp fhnwfactsheet-de.pdf bak.fhnwfactsheet-de.pdf
	@rm -f fhnwfactsheet-de.*
	@mv bak.fhnwfactsheet-de.pdf fhnwfactsheet-de.pdf
	@rm -rf _minted-fhnwfactsheet
	@rm -rf _minted-fhnwfactsheet-de

# Remove everything but .dtx and .ins:
clean: tidy
	@rm -f fhnwfactsheet-en.pdf
	@rm -f fhnwfactsheet-de.pdf
	@rm -f fhnwfactsheet.cls
	@rm -f template.*
