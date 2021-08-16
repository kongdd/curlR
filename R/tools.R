self <- function(x) {
    x
}

#' @keywords internal
#' @export
fill_NULL <- function(x) {
    x[which.isnull(x)] <- NA
    x
}

rm_empty <- function(x){
    if (is.list(x)){
        x[!sapply(x, is_empty)]
    }else {
        x[!is.na(x)]
    }
}
