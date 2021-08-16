#' Search for an element on the page
#'
#' @inherit  seleniumPipes::findElement details
#'
#' @param x A remoteDriver object
#' @param value The search target.
#' @param type Locator scheme to use to search the element, available schemes:
#' `c("xpath", "class name", "css selector", "id", "name", "link text", "partial link text",
#' "tag name")`. Defaults to 'xpath'. Partial string matching is
#' accepted.
#'
#' @seealso [seleniumPipes::findElement()]
#' @import xml2
#' @export
ele_find_first <- function(x, pattern, type = "xpath") UseMethod("ele_find_first")

#' @export
#' @rdname ele_find_first
ele_find_first.remoteDriver <- function(x, pattern, type = "xpath") {
    elem <- x$findElement(type, pattern)
    elem
    # xml_html(elem)
}

#' @rdname ele_find_first
#' @export
ele_find_all <- function(x, pattern, type = "xpath") UseMethod("ele_find_all")

#' @rdname ele_find_first
#' @export
ele_find_all.remoteDriver <- function(x, value, type = "xpath") {
    elem <- x$findElements(type, value)
    elem
    # lapply(elem, xml_html)
}

#' @rdname ele_find_first
#' @export
getElementById <- function(x, value) ele_find_first(x, value, "id")

#' @rdname ele_find_first
#' @export
getElementByName <- function(x, value) ele_find_first(x, value, "name")

#' @rdname ele_find_first
#' @export
getElementByClass <- function(x, value) ele_find_first(x, value, "class name")

#' @export 
go <- function(x, url) {
    p$navigate(url)
}

#' @rdname ele_find_first
#' @export
ele_child <- function(x, value = "*", type = "xpath") {
    x$findChildElement(type, value)
}

#' @rdname ele_find_first
#' @export
ele_children <- function(x, value = "*", type = "xpath") {
    x$findChildElements(type, value)
}
