# *Probability and Statistics: a simulation-based introduction*

<b>This draft has been superseded.  Here is the [latest version](../README.md).

<hr />

The original form of the book is available in pdf form.

* Bob Carpenter. 2020 draft.  [*Probability and Statistics: a simulation-based introduction*](prob-stats-2020-draft.pdf)

This is also released under BSD-3 and CC BY-ND 4.0.

### Building the original draft

* *System Prerequisites*:  `pandoc` and `pandoc-citeproc` must be installed on
  the operating system and available to be executed on the system `PATH`.
* *R Prerequisitea*: All of the packages found in
  [`before-chapter.R`](before-chapter.R) must be installed: As of now,
  this includes `ggplot2`, `grid`, `gridExtra`, `knitr`, `MASS`,
  `reshape`, `rstan`, `tufte`, and `bookdown`.

#### Building the HTML
From either the shell script or R commands, HTML output will be generated in directory `_book`, with top-level page
```
prob-stats/original/_book/index.html
```

##### Building original HTML from unix
From the shell, first change to the directory for the repo, then run the build shell script.
```
$ cd prob-stats/original
$ ./build.sh
```

##### Building original HTML from R
Load the bookdown library, set the working directory to the directory for the repo, then render the book.
```
$ library(bookdown)
$ setwd('prob-stats/original')
$ bookdown::render_book('index.Rmd')
```
Rendering with just `index.Rmd` as an argument defers the style to the `index.Rmd` yaml header.

#### Building the original PDF
*Pre-requisite:* Building the pdf requires `pdflatex` to be installed
  on the operating system and available on the `PATH`.

From either the shell script or R commands, PDF output will be
generated in
```
prob-stats/original/_main.pdf
```

##### Building original PDF from unix
From the shell, first change to the directory for the repo, then run the build shell script.
```
$ cd prob-stats/original
$ ./build-pdf.sh
```

##### Building original PDF from R
Load the bookdown library, set the working directory to the directory for the repo, then render the book.
```
$ library(bookdown)
$ setwd('prob-stats/original')
$ bookdown::render_book('index.Rmd', 'tufte_book2')
```
In this case, we specified the `tufte_book2` format in the call to
`render`, which will override the default specification in
`index.Rmd`.  The PDF file will be in file `_book/_main.pdf`.

#### Note on building original book from RStudio
If you try to build using the `knit` button in RStudio from the `index.Rmd` file, you will get the default HTML output because that is what is specified in the `YAML` header at the top of `index.Rmd`.
