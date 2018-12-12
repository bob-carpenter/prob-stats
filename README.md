# *Probability and Statistics: a simulation-based introduction*  
A reproducible, open-access book (BSD-3 code, CC-BY ND 4.0 text).

## Building the HTML

From either the shell script or R commands, the output will be generated in directory `_book`, with top-level page

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
