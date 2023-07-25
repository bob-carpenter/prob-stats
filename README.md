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

<hr />

#### The original book

This current draft supersedes the
[original draft](original/README.md), which includes a pre-built pdf.
