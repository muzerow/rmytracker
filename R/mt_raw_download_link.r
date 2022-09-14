#' Get MyTracker Raw Data Download Link
#' @description Get MyTracker Raw Data Download Link <https://tracker.my.com/docs/api/export-api/raw/create>
#' @importFrom httr add_headers content GET
#' @importFrom jsonlite fromJSON
#' @importFrom naptime naptime
#'
#' @param export_id Export ID
#' @param api_user_id API User ID
#' @param secret_key Secret Key
#' @param nap_time Nap time before re-trying to get the download link
#'
#' @export

mt_raw_download_link <- function(export_id, api_user_id, secret_key, nap_time = 5) {
  url <- mt_url_build("https://tracker.my.com/api/raw/v1/export/get.json",
                      idRawExport = export_id)

  signature <- mt_auth(url, api_user_id, secret_key)

  raw_data <- GET(url,
                  add_headers("Authorization" = signature))

  if (content(raw_data)$code == 200) {
    while (content(raw_data)$data$status != "Success!") {
      naptime(nap_time)
      raw_data <- GET(url, add_headers("Authorization" = signature))
    }
  }

  fromJSON(rawToChar(raw_data$content))$data$files$link
}
