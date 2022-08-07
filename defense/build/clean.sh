#!/bin/sh

exts="aux bbl blg brf idx ilg ind lof log lol lot out toc synctex.gz glstex bcf glg run.xml tdo loa"

for ext in $exts; do
     rm -f *.$ext
done
