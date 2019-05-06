# pandoc concept.md -o concept-slides.html -t revealjs -s -H <(echo '\['; cat def.tex; echo '\]')  --mathjax -V revealjs-url=https://revealjs.com -V theme=solarized -V viewDistance=15
# pandoc concept.md -t beamer -o concept-slides.pdf -H def.tex
THEMEOPS=CSC,layouttwo,english,adjustframetitle
pandoc concept.md --filter pandoc-citeproc -t beamer --slide-level=2 -o concept-slides.pdf -H def.tex -V theme=mpi2015 -V themeoptions=$THEMEOPS
pandoc concept.md --filter pandoc-citeproc -t beamer --slide-level=2 -o concept-slides.tex -H def.tex --table-of-contents -V theme=mpi2015 -V themeoptions=$THEMEOPS
sed -i 's/ignorenonframetext,//' concept-slides.tex
sed -i 's/\\frame{\\titlepage}/\\maketitle/' concept-slides.tex
