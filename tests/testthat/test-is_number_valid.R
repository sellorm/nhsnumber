context("Is that NHS Number valid?")
test_that("10 digit numbers return correct responses", {
  expect_equal(is_number_valid(1234567881), TRUE)
  expect_equal(is_number_valid(1234567890), FALSE)
  expect_equal(is_number_valid(2345678909), TRUE)
  expect_equal(is_number_valid(2345678901), FALSE)
  expect_equal(is_number_valid(NA, warn = FALSE), FALSE)
})

context("Garbage input")
test_that("Incorrect input still provides the expected output", {
  expect_equal(is_number_valid(12345, warn = FALSE), FALSE)
  expect_equal(is_number_valid("hat", warn = FALSE), FALSE)
  expect_equal(is_number_valid(12345678901, warn = FALSE), FALSE)
  expect_warning(is_number_valid(1))
  expect_warning(is_number_valid(NA))
})
