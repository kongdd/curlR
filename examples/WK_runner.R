#! /usr/bin/Rscript
library(RSelenium)
library(seleniumPipes)
library(foreach)
library(iterators)
library(purrr)
library(dplyr)
library(glue)
library(jsonlite)
library(stringr)

# "java -jar selenium-server-standalone-3.141.59.jar"
devtools::load_all()
prefs <- list('permissions.default.image', 2L)
cprof <- list(firefox_profile = list(prefs = prefs))

source("examples/WK_pkgs.R")
user <- list(name = "15521041645", pwd = "dong1234")
# write_json(user, "wk_user.json")
# user <- read_json("wk_user.json")

# for (i in 1:10) {
    tryCatch({
        port <- 4444
        kill_selenium(port)
        p <- init_selenium(port, browserName = "firefox")
        # p$open(); #p$maxWindowSize()
        wk_login(user$name[[1]], user$pwd[[1]])
        wk_listener(skip_finished = FALSE)
    }, error = function(e) {
        message(sprintf('%s', e$message))
    })
# }
