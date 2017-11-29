context("To detect factors that should be character")

test_that("To Test if check_factor_character() detects factors that should be character",{
  data_1 <-factor(c("Asia","Africa","Americas","Europe","Oceania"))
  data_1_repeated <-factor(c("Asia","Europe","Africa","Americas","Europe","Oceania","Oceania"))
  data_numeric <- c(1,2,3,4,5,1)
  expect_true(check_factor_character(data_1))
  expect_false(check_factor_character(data_1_repeated))
  expect_error(check_factor_character(data_numeric),"Input is not a factor")
})
