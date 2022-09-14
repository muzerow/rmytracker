#' Get MyTracker Raw Export ID
#' @description Get MyTracker Raw Export ID <https://tracker.my.com/docs/api/export-api/raw/create>
#' @importFrom httr add_headers GET
#' @importFrom jsonlite fromJSON
#'
#' @param event Event
#' @param selectors Selectors
#' @param date_from Start date
#' @param date_to End date
#' @param api_user_id API User ID
#' @param secret_key Secret Key
#' @param ... Any other query parameters
#'
#' @export

mt_raw_export_id <- function(event, selectors, date_from, date_to, api_user_id, secret_key, ...) {
  url <- mt_url_build("https://tracker.my.com/api/raw/v1/export/create.json",
                      event = event,
                      selectors = selectors,
                      dateFrom = date_from,
                      dateTo = date_to)

  signature <- mt_auth(url, api_user_id, secret_key)

  raw_id <- GET(url,
                add_headers("Authorization" = signature))

  fromJSON(rawToChar(raw_id$content))$data$idRawExport
}
