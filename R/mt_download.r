#' Download and Unzip MyTracker Data
#' @description Download and Unzip MyTracker Data
#' @importFrom R.utils gunzip
#' @importFrom utils download.file
#'
#' @param download_link Download Link
#' @param file_path File Path
#'
#' @export

mt_download <- function(download_link, file_path, overwrite = F) {
  if (endsWith(file_path, ".csv")) {
    gz_file_path <- paste0(file_path, ".gz")
  } else if (endsWith(file_path, ".gz")) {
    gz_file_path <- file_path
  } else {
    stop("Incorrect file_path argument - .csv or .gz file format required")
  }

  download.file(download_link, gz_file_path)

  if (isTRUE(overwrite)) {
    file.remove(file_path)
  }

  gunzip(gz_file_path)
}
