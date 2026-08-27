
# Load libraries that are necessary. May need to add some here
library(dplyr)
library(shiny)
library(knitr)
library(ggplot2)

encoding <- getOption("shiny.site.encoding", default = "UTF-8")

## options for knitting/rendering rmarkdown chunks
knitr::opts_chunk$set(
  echo = FALSE,
  comment = NA,
  cache = FALSE,
  message = FALSE,
  warning = FALSE
)

## function to render .md files to html
inclMD <- function(path) {
  markdown::markdownToHTML(
    path,
    fragment.only = TRUE,
    options = "",
    stylesheet = "",
    encoding = encoding
  )
}

## function to render .Rmd files to html - does not embed image or add css
inclRmd <- function(path, r_env = parent.frame()) {
  paste(
    readLines(path, warn = FALSE, encoding = encoding),
    collapse = '\n'
  ) %>%
  knitr::knit2html(
    text = .,
    fragment.only = TRUE,
    envir = r_env,
    options = "",
    stylesheet = "",
    encoding = encoding
  ) %>%
  gsub("&lt;!--/html_preserve--&gt;","",.) %>%  ## knitr adds this
  gsub("&lt;!--html_preserve--&gt;","",.) %>%   ## knitr adds this
  HTML
}

