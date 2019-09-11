context("is_valid and the vectors")
test_that("we can accept vectors", {
  expect_equal(is_valid(c(1234567881, 1234567890, 9876543210, 2345678901)),
               c(TRUE, FALSE, TRUE, FALSE))
})

context("is_valid and dodgy inputs")
test_that("We don't accept these incorrect inputs", {
  expect_error(is_valid(as.data.frame("hat")))
})
