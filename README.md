# *Probability and Statistics: a simulation-based introduction*  
A reproducible, open-access book (BSD-3 code, CC-BY ND 4.0 text).

This README explains how to build the HTML and pdf outputs for the
book.

* *Prerequisite*:  `pandoc` and `pandoc-citeproc` must be installed on
  the operating system and available on the `PATH`.

## Building the HTML


From either the shell script or R commands, HTML output will be generated in directory `_book`, with top-level page

```
prob-stats/_book/index.html
```

#### Building HTML from unix

From the shell, first change to the directory for the repo, then run the build shell script.
```
$ cd prob-stats
$ ./build.sh
```

#### Building HTML from R

Load the bookdown library, set the working directory to the directory for the repo, then render the book.

```
$ library(bookdown)
$ setwd('prob-stats')
$ bookdown::render('index.Rmd')
```

Rendering with just `index.Rmd` as an argument defers the style to the `index.Rmd` yaml header.


## Building the PDF

*Pre-requisite:* Building the pdf requires `pdflatex` to be installed
  on the operating system and available on the `PATH`.

From either the shell script or R commands, PDF output will be
generated in

```
prob-stats/_main.pdf
```

#### Building PDF from unix

From the shell, first change to the directory for the repo, then run the build shell script.
```
$ cd prob-stats
$ ./build-pdf.sh
```


#### Building PDF from R

#### Building HTML from R

Load the bookdown library, set the working directory to the directory for the repo, then render the book.

```
$ library(bookdown)
$ setwd('prob-stats')
$ bookdown::render('index.Rmd', 'tufte_book')
```

In this case, we specified the `tufte-book` format in the call to
`render`, which will override the default specification in `index.Rmd`.


