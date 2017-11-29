context("Re-order() that uses desc() a la (d)plyr")

test_that("levels reordered in descending order", {
  data_1 <- factor(c("1","2","3","4","5"))
  data_1_reversed <- reorder_descending(data_1)
  data_1_manual_reveresed <- c("5","4","3","2","1")
  data_2 <- factor(c("setosa","versicolor"))
  data_2_reversed <- reorder_descending(data_2)
  data_2_manual_reveresed <- c("versicolor","setosa")

  expect_identical(levels(data_1_reversed), data_1_manual_reveresed)
  expect_identical(levels(data_2_reversed), data_2_manual_reveresed)
  expect_error((reorder_descending(data_1)),NA)
})
