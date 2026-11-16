test_that("nyczips no longer ships objects that mask nycmaps", {
  items <- utils::data(package = "nyczips")$results[, "Item"]
  expect_false(any(c("nyc_zip_sf", "nyc_zips") %in% items))
})
