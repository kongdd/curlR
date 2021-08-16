
# curlR

<!-- badges: start -->
[![AppVeyor build status](https://ci.appveyor.com/api/projects/status/github/rpkgs/curlR?branch=master&svg=true)](https://ci.appveyor.com/project/kongdd/curlR)
[![Codecov test coverage](https://codecov.io/gh/rpkgs/curlR/branch/master/graph/badge.svg)](https://codecov.io/gh/rpkgs/curlR?branch=master)
<!-- badges: end -->

The goal of curlR is to ...

## Installation

You can install the released version of curlR from [CRAN](https://CRAN.R-project.org) with:

``` r
devtools::install_github("rpkgs/curlR")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(curlR)

port = 4444
kill_selenium(port)
p <- init_selenium(port)

p %>% go("https://cn.bing.com/")
getElementByName(p, "q") %>% ele_fillText("curlR", key = "enter")
# getElementByName(p, "go") %>% ele_click()

# GET ALL results
xs = ele_find_all(p, "//ol/li")

# GET the first result
x = ele_find_first(p, "//ol/li")
a = ele_child(x, "//a") # get link
a %>% clickElement()
# if page changed, previous node will be destroyed
```

## selenium 

### Linux
```bash
sudo apt install firefox-geckodriver firefox chromium-chromedriver 
```
