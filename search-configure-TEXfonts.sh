#!/bin/bash

find  /usr/lib/sdk/texlive/texmf-dist/fonts -type f -regex ".*\.\(ttf\|otf\)$" >TEXfonts.txt
mkdir -p /app/share/fonts

while IFS= read -r linea; do
  n_ruta="${linea/\/usr\/lib\/sdk\/texlive/\/app\/texlive}"
  ln --target-directory=/app/share/fonts -s "$n_ruta"
done < TEXfonts.txt
