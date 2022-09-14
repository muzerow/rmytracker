#' Download and Unzip MyTracker Data
#' @description Download and Unzip MyTracker Data
#' @importFrom R.utils gunzip
#' @importFrom utils download.file
#'
#' @param download_link Download Link
#' @param file_path File Path
#'
#' @export

mt_raw_download <- function(download_link, file_path) {
  download.file(download_link, file_path)
  gunzip(file_path)
}
