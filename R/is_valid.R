#' Checks validity of NHS numbers
#'
#' NHS numbers are 10 digit numbers where the 10th digit is a checksum.
#' This function validates the checksums of the supplied NHS numbers.
#'
#' @param nhs_number A vector of 10 digit NHS numbers to validate
#' @param warn Boolean that controls display of warning messages
#' @return A logical vector indicating the validity of each input value
#' @examples
#' is_valid(1234567881)
#' is_valid(c(1234567881, 1234512345, 123456789))
#' is_valid(1234567890, warn = FALSE)
#' @export

is_valid <- function(nhs_number, warn = TRUE) {
  if (! is.vector(nhs_number)) {
    stop("nhs_number must be a vector")
  }
  unlist(lapply(nhs_number, function(x) {
    is_number_valid(x, warn = warn)
  }))
}
