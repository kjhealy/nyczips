## code to prepare `DATASET` dataset goes here
library(tidyverse)
library(tidycensus)
library(here)

# Prep zip codes
ny_county_boros <- tribble(
  ~long_county                , ~county           , ~short_county , ~borough        ,
  "New York County, New York" , "New York County" , "New York"    , "Manhattan"     ,
  "Queens County, New York"   , "Queens County"   , "Queens"      , "Queens"        ,
  "Kings County, New York"    , "Kings County"    , "Kings"       , "Brooklyn"      ,
  "Bronx County, New York"    , "Bronx County"    , "Bronx"       , "Bronx"         ,
  "Richmond County, New York" , "Richmond County" , "Richmond"    , "Staten Island"
)

read_csv(here("data-raw", "nyc-ziptable.csv")) |>
  janitor::clean_names() |>
  select(-population_a) |>
  filter(county %in% ny_county_boros$county) |>
  rename(zip = zip_code) |>
  write_csv(here("data-raw", "nyc-ziptable-clean.csv"))

nyc_ziptable <- read_csv(here("data-raw", "nyc-ziptable-clean.csv"))

nyc_zips <- nyc_ziptable |>
  left_join(ny_county_boros) |>
  relocate(borough, .after = zip)

usethis::use_data(nyc_zips, overwrite = TRUE, compress = "xz")


census_vars <- tribble(
  ~variable    , ~varname            ,
  "B01001_001" , "population"        ,
  "B02001_002" , "white_alone"       ,
  "B02001_003" , "black_alone"       ,
  "B02001_005" , "asian_alone"       ,
  "B02001_008" , "two_or_more_races" ,
  "B03003_001" , "hispanic"          ,
  "B03002_003" , "nonhispanic_white" ,
  "B03002_004" , "nonhispanic_black" ,
  "B19013_001" , "med_hhinc"
)

# ugh
# https://github.com/walkerke/tidycensus/issues/475
# zcta_info <- get_acs(
#   geography = "zcta",
#   variables = "B01001_001"
# )

zip_sf <- get_acs(
  geography = "zcta",
  variables = "B01001_001",
  state = "NY",
  year = 2019,
  county = NULL,
  geometry = TRUE
) |>
  select(-c(variable, moe)) |>
  rename(zip = GEOID, pop = estimate, name = NAME) |>
  filter(zip %in% nyc_zips$zip)

usethis::use_data(zip_sf, overwrite = TRUE, compress = "xz")
