context("Reorder the factors same as those of Input")

test_that("To test if factor_as_orginal() reorders the factors as the Input",{

  data_1 <- c("Asia","Africa","Americas","Europe","Oceania")
  data_1_twice <- c("Asia","Asia","Africa","Africa","Americas","Americas","Europe","Europe","Oceania","Oceania")


  data_2 <- c("setosa","versicolor")
  data_2_repeated <- c("setosa","versicolor")

  expect_identical(levels(factor_as_orginal(data_1_twice)),data_1 )
  expect_identical(levels(factor_as_orginal(data_2_repeated)),data_2 )
})

test_that(" To test if input is neither a character nor a factor",{
  data_numeric <- c(1,2,3,4,5)
  expect_error(factor_as_orginal(data_numeric),"Input is neither a character nor a factor")
})

