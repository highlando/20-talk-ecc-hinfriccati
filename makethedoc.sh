pandoc concept.md -o concept-slides.html --filter pandoc-citeproc -t revealjs --slide-level=2 -s -H <(echo '\['; cat def.tex; echo '\]')  --mathjax -V revealjs-url=https://revealjs.com -V theme=solarized -V viewDistance=15 -V width=1280 -V height=720
# pandoc concept.md -t beamer -o concept-slides.pdf -H def.tex
THEMEOPS=CSC,layouttwo,english,adjustframetitle
pandoc concept.md --filter pandoc-citeproc -t beamer --slide-level=2 -o concept-slides.pdf -H def.tex -V classoption:aspectratio=43 -V theme=mpi2015 -V themeoptions=$THEMEOPS
pandoc concept.md -o concept-slides.tex --filter pandoc-citeproc --natbib -t beamer --slide-level=2 -H def.tex --table-of-contents -V classoption:aspectratio=43 -V theme=mpi2015 -V themeoptions=$THEMEOPS
sed -i 's/ignorenonframetext,//' concept-slides.tex
sed -i 's/\\frame{\\titlepage}/\\maketitle/' concept-slides.tex
# sed -i 's/slide\slevel2/slide/g' concept-slides.html
