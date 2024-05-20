
# Translation
new_data <- input_data |>
  dplyr::mutate(y = dplyr::if_else(x == 1, "Yes", "No"))

# cached SAS version
sas_data <- haven::read_sas("new_data.sas7bdat")

# verify with tes
testthat::expect_equal(new_data, sas_data)


sas_data <- mtcars
R_data <- mtcars

testthat::test_that("Test my conversion", {
  testthat::expect_equal(sas_data, R_data, tolerance = 1e-6)
})
