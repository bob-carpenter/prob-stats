# LIBRARY CONFIGURATION

library(ggplot2)
library(grid)
library(gridExtra)
library(knitr)
knitr::opts_chunk$set(
  include = TRUE,
  cache = TRUE,
  collapse = TRUE,
  echo = FALSE,
  message = FALSE,
  tidy = FALSE,
  warning = FALSE,
  comment = "  ",
  dev = "png",
  dev.args = list(bg = '#FFFFF8'),
  dpi = 300,
  fig.align = "center",
  fig.width = 7,
  fig.asp = 0.618,
  fig.show = "hold",
  out.width = "90%"
)
library(MASS)
library(reshape)
library(rstan)
rstan_options(auto_write = FALSE)
options(mc.cores = 1)
library(tufte)




# UTILITY FUNCTIONS

printf <- function(pattern, ...) {
  cat(sprintf(pattern, ...))
}

print_file <- function(file) {
  cat(paste(readLines(file), "\n", sep=""), sep="")
}

extract_one_draw <- function(stanfit, chain = 1, iter = 1) {
  x <- get_inits(stanfit, iter = iter)
  x[[chain]]
}

# TUFTE GGPLOT STYLE

ggtheme_tufte <- function() {
  theme(plot.background =
          element_rect(fill = "#fffff8",
                       colour = "#fffff8",
                       size = 0.5,
                       linetype = "solid"),
        plot.margin=unit(c(1, 1, 0.5, 0.5), "lines"),
        panel.background =
          element_rect(fill = "#fffff8",
                       colour = "#fffff8",
                       size = 0.5,
                       linetype = "solid"),
        panel.grid.major = element_line(colour = "white",
                                        size = 1, linetype="dashed"),
        panel.grid.minor = element_blank(),
        legend.box.background =
          element_rect(fill = "#fffff8",
                       colour = "#fffff8",
                       linetype = "solid"),
        axis.line = element_blank(),
        axis.ticks = element_blank(),
        axis.text = element_text(family = "Palatino", size = 12),
        axis.title.x = element_text(family = "Palatino", size = 14,
                                    margin = margin(t = 15,
                                                    r = 0, b = 0, l = 0)),
        axis.title.y = element_text(family = "Palatino", size = 14,
                                    margin = margin(t = 0,
                                                    r = 15, b = 0, l = 0)),
        strip.background = element_rect(fill = "#fffff8",
                                        colour = "#fffff8",
                                        linetype = "solid"),
        strip.text = element_text(family = "Palatino", size = 12),
        legend.text = element_text(family = "Palatino", size = 12),
        legend.title = element_text(family = "Palatino", size = 14,
                                    margin = margin(b = 5)),
        legend.background = element_rect(fill = "#fffff8",
                                        colour = "#fffff8",
                                        linetype = "solid"),
        legend.key = element_rect(fill = "#fffff8",
                                        colour = "#fffff8",
                                        linetype = "solid")
  )
}

# GENERAL R CONFIGURATION

options(digits = 2)
options(htmltools.dir.version = FALSE)


set.seed(1123)
