all: dir html latex-source pdflatex-from-tex

# Build a number of formats into the `out/` directory. These will get published via Github pages.
dir:
	mkdir -p out

pdf:
	pandoc --smart --filter pandoc-citeproc --variable documentclass=templates/sig-alternate-2 --csl=templates/acm-sig-proceedings.csl --highlight-style=haddock -f markdown+implicit_figures+grid_tables+fenced_code_blocks+fenced_code_attributes+raw_tex --wrap=none -t latex -o out/paper.pdf paper.md
html:
	pandoc --smart --filter pandoc-citeproc --standalone --css=pandoc.css --toc --highlight-style=haddock -f markdown -t html -o out/index.html paper.md
	cp templates/pandoc.css out/pandoc.css

latex-source:
	pandoc --variable documentclass=templates/sig-alternate-2 -f markdown -t latex --standalone --wrap=none -o paper.tex paper.md
	
pdflatex-from-tex:
	pdflatex paper.tex -o out/paper-from-pdflatex.pdf
	
clean:
	rm *.log *.aux *.out
