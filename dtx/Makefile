default:
	@latex fhnwfactsheet.ins
	@pdflatex -shell-escape fhnwfactsheet.dtx
	@mv fhnwfactsheet.pdf fhnwfactsheet-en.pdf
	@pdflatex -shell-escape fhnwfactsheet-de.tex
	#@cp fhnwfactsheet.cls ../

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
