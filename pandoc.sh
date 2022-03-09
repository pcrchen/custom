#!/usr/bin/env bash

# reference: https://learnbyexample.github.io/customizing-pandoc/#syntax-highlighting
pandoc \
    --include-in-header pandoc.tex \
    --highlight-style pandoc.theme \
    -V linkcolor:blue \
    -V geometry:a4paper \
    -V geometry:margin=2cm \
    -V mainfont="Iosevka Etoile" \
    -V monofont="Iosevka Term Medium" \
    -o "$2" "$1"

# to run this script
# bash pandoc.sh input.org output.pdf
