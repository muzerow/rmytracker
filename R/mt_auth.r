#' Get MyTracker Authentication Token
#' @description Get MyTracker Authentication Token <https://tracker.my.com/docs/api/export-api/authentication>
#' @importFrom httr hmac_sha1
#' @importFrom utils URLencode
#'
#' @param url Target URL
#' @param api_user_id API User ID
#' @param secret_key Secret Key
#'
#' @export

mt_auth <- function(url, api_user_id, secret_key) {
  paste0("AuthHMAC ", api_user_id, ":",
         hmac_sha1(key = secret_key,
                   string = paste0("GET&", URLencode(url, reserved = TRUE), "&")))
}
