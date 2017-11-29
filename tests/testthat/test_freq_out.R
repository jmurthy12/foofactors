context("Create a frequency table for a factor")

test_that("To test if freq_out's results of frequency table for a factor", {
  data_1 <- factor(c("Asia","Africa","Americas","Europe","Oceania"))
  data_1_freq <- list(x = factor(c("Asia","Africa","Americas","Europe","Oceania")), n = as.integer(c("1", "1", "1", "1", "1")))
  dataframe_1 <- as.data.frame(data_1_freq)

  expect_equal(freq_out(data_1), dataframe_1)

  data_2 <- factor(c("Africa","Africa","Americas","Americas","Europe","Europe","Oceania","Oceania","London","London"))
  data_2_freq <- list(x = factor(c("Africa","Americas","Europe","Oceania","London")), n = as.integer(c("2", "2", "2", "2", "2")))
  dataframe_2 <- as.data.frame(data_2_freq)

  expect_equal(freq_out(data_2), dataframe_2)

  expect_error(freq_out(data_2) == dataframe_1)

})
