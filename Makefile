all: paper4pg

paper4pg: paper4pg.tex
	pdflatex paper4pg.tex
	bibtex paper4pg
	pdflatex paper4pg.tex
	pdflatex paper4pg.tex

CoverLetter: CoverLetter.tex
	pdflatex CoverLetter.tex
	pdflatex CoverLetter.tex

Response: Response.tex
	pdflatex Response.tex
	pdflatex Response.tex

submit: paper4pg
	awk '{ if($$1=="\\bibliography{references}") print "\\input{paper4pg.bbl}"; else print; }' paper4pg.tex > temp.tex
	./latexpand temp.tex > submit/submit.tex
	rm temp.tex
clean:
	rm -f *~ *.aux *.bbl *.blg *.brf *.bmt *.dvi *.log *.toc *.spl *.bak *.out