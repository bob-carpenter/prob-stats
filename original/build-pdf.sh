#!/bin/sh

Rscript -e "bookdown::render_book('index.Rmd', output_format='tufte::tufte_book')"
