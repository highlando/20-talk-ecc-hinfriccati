# pandoc -o concept.pdf concept.md
# pandoc -t revealjs -s -o concept.html concept.md -V revealjs-url=~/software/other/reveal.js 
# pandoc -t revealjs -s -o myslides.html concept.md --mathml -V revealjs-url=/home/heiland/software/other/reveal.js 
pandoc concept.md -o myslides.html -t revealjs -s -H <(echo '\['; cat def.tex; echo '\]')  --mathjax -V revealjs-url=/home/heiland/software/other/reveal.js 
