context("import_dataframe")

test_that("raw data file exists", {
  expect_that(file.exists("inst/extdata/noaa_data_20170915.tsv"), TRUE)
})

test_that("formatted data file exists", {
  expect_that(file.exists("data/df.rda"), TRUE)
})

test_that("cleaning data file works", {
  raw_data <- eq_read_raw_data(dest_file)
  df <- eq_clean_data(raw_data)
  df <- eq_location_clean(df)
  expect_is(df$DATE, class = 'Date')
  expect_is(df$LOCATION, class = 'character')
})

