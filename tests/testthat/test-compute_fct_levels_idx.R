# input dataset
tbl_fct <-
  dplyr::tibble(gender = factor(c("M", "M","F", "M", "F")),
                age = factor(c("old", "young", "young", "old", "old")))
# resulting tible
tbl_idx <-
  dplyr::tibble(age = factor(c("old", "old", "young", "young")),
                gender = factor(c("F", "M", "F", "M")),
                index = c(0.83333333, 1.11111111, 1.25, 0.83333333))

test_that("index computation works", {
  expect_equal(
    compute_fct_levels_idx(tbl = tbl_fct,
                           idx_var = gender,
                           grouping_var = age), tbl_idx)
})
