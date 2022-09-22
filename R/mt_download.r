#' Download and Unzip MyTracker Data
#' @description Download and Unzip MyTracker Data
#' @importFrom R.utils gunzip
#' @importFrom utils download.file
#'
#' @param download_link Download Link
#' @param file_path File Path
#' @param overwrite If to overwrite the existing file
#'
#' @export

mt_download <- function(download_link, file_path, overwrite = F) {
  gz_file_path <- paste0(file_path, ".gz")

  if (file.exists(file_path) && isTRUE(overwrite)) {
    file.remove(file_path)
  }

  download.file(download_link, gz_file_path)
  gunzip(gz_file_path)
}
