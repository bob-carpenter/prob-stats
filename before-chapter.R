# LIBRARY CONFIGURATION

library(ggplot2)
library(knitr)
knitr::opts_chunk$set(
  cache = TRUE,
  collapse = TRUE,
  comment = "#",
  dev = "png",
  dpi = 300,
  echo = FALSE,
  fig.align = "center",
  fig.width = 6,
  fig.asp = 0.618,  # 1 / phi
  fig.show = "hold",
  include = TRUE,
  message = FALSE,
  out.width = "70%",
  tidy = FALSE,
  warning = FALSE
)
library(rstan)
rstan_options(auto_write = FALSE)
options(mc.cores = 1)



# UTILITY FUNCTIONS

printf <- function(pattern, ...) {
  cat(sprintf(pattern, ...))
#  cat(sprintf(paste("#", pattern), ...))
}

print_file <- function(file) {
  cat(paste(readLines(file), "\n", sep=""), sep="")
}

extract_one_draw <- function(stanfit, chain = 1, iter = 1) {
  x <- get_inits(stanfit, iter = iter)
  x[[chain]]
}

# GENERAL R CONFIGURATION

options(digits = 2)
options(htmltools.dir.version = FALSE)


set.seed(1123)
