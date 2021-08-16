#' @title Page element actions
#' @name ele_action
NULL

#' @rdname ele_action
#' @export
ele_click <- function(x) {
    x$clickElement()
}

#' @export
clickElement <- ele_click

#' @param key keyboard element, e.g. `enter`, `control`.
#'
#' @seealso https://cran.r-project.org/web/packages/RSelenium/vignettes/basics.html
#'
#' @rdname ele_action
#' @export
ele_fillText <- function(x, value, key = NULL, return = FALSE) {
    if (length(key) == 1 && key == "") key <- NULL

    x$clearElement()
    param = list(value, key = key) %>% rm_empty()
    x$sendKeysToElement(param)
    if (return) x else invisible()
}

#' @export
send_keys <- function(...) {
    .Deprecated("ele_fillText")
    ele_fillText(...)
}

#' @rdname ele_action
#' @export
focus_first_window <- function(p) {
    # TODO: fix here
    handles <- p$getWindowHandles() %>% sapply(self)
    p$switchToWindow(first(handles))
}

#' @rdname ele_action
#' @export
focus_last_window <- function(p) {
    handles <- p$getWindowHandles() %>% sapply(self)
    p$switchToWindow(last(handles))
}

