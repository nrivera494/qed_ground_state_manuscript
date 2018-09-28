all: paper

paper: paper.tex
	pdflatex paper.tex
	bibtex paper
	pdflatex paper.tex
	pdflatex paper.tex

CoverLetter: CoverLetter.tex
	pdflatex CoverLetter.tex
	pdflatex CoverLetter.tex

Response: Response.tex
	pdflatex Response.tex
	pdflatex Response.tex

submit: paper
	awk '{ if($$1=="\\bibliography{references}") print "\\input{paper.bbl}"; else print; }' paper.tex > temp.tex
	./latexpand temp.tex > submit/submit.tex
	rm temp.tex
clean:
	rm -f *~ *.aux *.bbl *.blg *.brf *.bmt *.dvi *.log *.toc *.spl *.bak *.out