#!/bin/sh

Rscript -e "bookdown::render_book('index.Rmd')"

# Rscript -e "bookdown::render_book('index.Rmd', 'tufte_book2')"
