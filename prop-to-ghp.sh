git checkout master

pandoc concept.md -o index.html \
    --filter pandoc-citeproc -t revealjs --slide-level=2 -s \
    --mathjax='https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js' \
    -V revealjs-url=https://revealjs.com \
    -V theme=solarized \
    -V viewDistance=15 -V width=1280 -V height=720 -V margin=0.05

git add index.html
git commit -m 'updated the index.html'
LSTCHSH=$(git rev-parse HEAD)  # get the hash of the last commit

git checkout gh-pages
git cherry-pick $LSTCHSH  # merge only the last commit
