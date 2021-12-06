#' Checks validity of an NHS number
#'
#' NHS numbers are 10 digit numbers where the 10th digit is a checksum.
#' This function validates the checksums of the supplied NHS numbers.
#'
#' @param nhs_number A 10 digit NHS number to validate
#' @param warn Boolean that controls display of warning messages
#' @examples
#' is_valid(1234567881)
#' is_valid(1234567890, warn = FALSE)
is_number_valid <- function(nhs_number, warn = TRUE) {
  if (is.na(nhs_number)) {
    if (warn == TRUE) {
      warning("nhs_number is 'NA'")
    }
    return(FALSE)
  }

  if (nchar(nhs_number) != 10) {
    if (warn == TRUE) {
      warning("nhs_number is incorrect length - should be 10 digits")
    }
  }

  no_checksum <- substr(nhs_number, 1, 9)
  # returns FALSE if get_checksum throws an error
  checksum <- tryCatch(
    {
      nhsnumber::get_checksum(no_checksum)
    },
    error = function(e) {
      FALSE
    }
  )

  if (checksum == substr(nhs_number, 10, 10)) {
    TRUE
  } else {
    FALSE
  }
}
