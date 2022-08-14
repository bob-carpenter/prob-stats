# *Probability and Statistics: a simulation-based approach*


This is the source repo for the following open-access book. 

* Bob Carpenter and Brian Ward.  2022 Draft.  *Probability and Statistics: a simulation-based approach*.  Publisher TBD.

The code is released under the BSD-3 license and the text under the CC BY-ND 4.0 license.


## Building the book

From the shell in the directory containing this repo.

```
> cd prob-stats
> quarto preview quarto-book/
```

The following tools are required.

* [Quarto](https://quarto.org): compile markdown to HTML, pdf
* [Python 3](https://www.python.org/): scripting and integration

The following Python packages are also required.

* cmdstanpy: interface to Stan
* numpy: matrices, arrays, and special functions
* pandas: data frames
* plotnine: plotting

<br />
<hr />


## Original draft

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
prob-stats/_book/index.html
```

##### Building original HTML from unix
From the shell, first change to the directory for the repo, then run the build shell script.
```
$ cd prob-stats
$ ./build.sh
```

##### Building original HTML from R
Load the bookdown library, set the working directory to the directory for the repo, then render the book.
```
$ library(bookdown)
$ setwd('prob-stats')
$ bookdown::render_book('index.Rmd')
```
Rendering with just `index.Rmd` as an argument defers the style to the `index.Rmd` yaml header.

#### Building the original PDF
*Pre-requisite:* Building the pdf requires `pdflatex` to be installed
  on the operating system and available on the `PATH`.

From either the shell script or R commands, PDF output will be
generated in
```
prob-stats/_main.pdf
```

##### Building original PDF from unix
From the shell, first change to the directory for the repo, then run the build shell script.
```
$ cd prob-stats
$ ./build-pdf.sh
```

##### Building original PDF from R
Load the bookdown library, set the working directory to the directory for the repo, then render the book.
```
$ library(bookdown)
$ setwd('prob-stats')
$ bookdown::render_book('index.Rmd', 'tufte_book2')
```
In this case, we specified the `tufte_book2` format in the call to
`render`, which will override the default specification in
`index.Rmd`.  The PDF file will be in file `_book/_main.pdf`.

#### Note on building original book from RStudio
If you try to build using the `knit` button in RStudio from the `index.Rmd` file, you will get the default HTML output because that is what is specified in the `YAML` header at the top of `index.Rmd`.
