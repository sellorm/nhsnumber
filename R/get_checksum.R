#' Calculates NHS number checksums
#'
#' NHS numbers are 10 digit numbers where the 10th digit is a checksum.
#' This function takes the 9 core digits of the NHS number and calculates the
#' checksums.
#'
#' This function has been created using information from:
#' https://en.wikipedia.org/wiki/NHS_number
#' and various NHS sources
#'
#' @param nhs_number A 9 digit NHS numbers to validate
#' @param full_output Boolean that controls display of warning messages
#' @return Checksum or the complete NHS number including the checksum.
#' @examples
#' get_checksum(123456788)
#' get_checksum(123456788, full_output = TRUE)
#' @export

get_checksum <- function(nhs_number, full_output = FALSE) {
  if (is.na(
    suppressWarnings(
      as.numeric(nhs_number)
      )
    )
  ) {
    stop("nhs_number is invalid -
         should be a 9 digit number, not text")
  }
  if (nchar(nhs_number) != 9) {
    stop("nhs_number is incorrect length -
         should be 9 digits as checksum is not required")
  }
  split_number <- as.numeric(strsplit(as.character(nhs_number), "")[[1]])
  multipliers <- c(10, 9, 8, 7, 6, 5, 4, 3, 2)
  multiplied <- split_number * multipliers
  remainder <- sum(multiplied) %% 11
  check_digit <- 11 - remainder

  # A check digit of 10 is not permitted
  # an example number with a checksum of 10 is 123456789
  if (check_digit == 10) {
    stop("Input sequence is invalid
           Checksum was 10 which is not permissable")
  }

  # A check digit of 11 is re-written as a 0
  if (check_digit == 11) {
    check_digit <- 0
  }
  if (full_output) {
    as.numeric(paste0(nhs_number, check_digit))
  } else {
    check_digit
  }
}
