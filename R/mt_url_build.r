#' Get MyTracker URL
#' @description Get MyTracker URL
#'
#' @param endpoint Target Endpoint
#' @param ... Any query parameters
#'
#' @export

mt_url_build <- function(endpoint, ...) {
  url <- list(endpoint = endpoint,
              query = list(...))

  if (length(url$query) > 0) {
    query <- paste(names(url$query), unname(url$query), sep = "=", collapse = "&")
    return(paste(url$endpoint, query, sep = "?"))
  } else {
    return(url$endpoint)
  }
}
