# make -f Makefile_latex

R = paper
STY = *.cls
FIG = 
pdf: $(R).pdf

$(R).bbl: $(R).bib
	pdflatex $(R)
	bibtex $(R)
	pdflatex $(R)

$(R).pdf: *.tex $(STY) $(FIG) $(R).bbl
	pdflatex $(R)

clean:
	rm -f $(R).log $(R).aux $(R).bbl $(R).blg $(R).dvi $(R).ps $(R).out

# $(R).ps: *.tex $(STY) $(FIG) $(R).bbl
#     latex $(R)
#     dvips -Ppdf -G0 -t letter $(R)
# $(R).pdf: $(R).ps
#     ps2pdf -dPDFSETTINGS=/prepress \
#     -dCompatibilityLevel=1.4 \
#     -dAutoFilterColorImages=false \
#     -dAutoFilterGrayImages=false \
#     -dColorImageFilter=/FlateEncode \
#     -dGrayImageFilter=/FlateEncode \
#     -dMonoImageFilter=/FlateEncode \
#     -dDownsampleColorImages=false \
#     -dDownsampleGrayImages=false $(R).ps $(R).pdf

