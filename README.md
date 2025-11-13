
<!-- README.md is generated from README.Rmd. Please edit that file -->

# nyczips

<!-- badges: start -->

<!-- badges: end -->

Provides a tibble of New YorK City zip codes and a simple features
collection of their ZCTA polygons.

## Installation

You can install the development version of nyczips like so:

``` r
remotes::install_github("kjhealy/nyczips)
```

## Example

``` r
library(tidyverse)
#> ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
#> ✔ dplyr     1.1.4     ✔ readr     2.1.5
#> ✔ forcats   1.0.1     ✔ stringr   1.6.0
#> ✔ ggplot2   4.0.0     ✔ tibble    3.3.0
#> ✔ lubridate 1.9.4     ✔ tidyr     1.3.1
#> ✔ purrr     1.2.0     
#> ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
#> ✖ dplyr::filter() masks stats::filter()
#> ✖ dplyr::lag()    masks stats::lag()
#> ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors
library(sf)
#> Linking to GEOS 3.13.0, GDAL 3.8.5, PROJ 9.5.1; sf_use_s2() is TRUE
library(nyczips)

nyc_zips
#> # A tibble: 211 × 6
#>      zip borough       city          county          long_county    short_county
#>    <dbl> <chr>         <chr>         <chr>           <chr>          <chr>       
#>  1 11368 Queens        Corona        Queens County   Queens County… Queens      
#>  2 11208 Brooklyn      Brooklyn      Kings County    Kings County,… Kings       
#>  3 11385 Queens        Ridgewood     Queens County   Queens County… Queens      
#>  4 11373 Queens        Elmhurst      Queens County   Queens County… Queens      
#>  5 11226 Brooklyn      Brooklyn      Kings County    Kings County,… Kings       
#>  6 11236 Brooklyn      Brooklyn      Kings County    Kings County,… Kings       
#>  7 10467 Bronx         Bronx         Bronx County    Bronx County,… Bronx       
#>  8 10025 Manhattan     New York      New York County New York Coun… New York    
#>  9 11207 Brooklyn      Brooklyn      Kings County    Kings County,… Kings       
#> 10 10314 Staten Island Staten Island Richmond County Richmond Coun… Richmond    
#> # ℹ 201 more rows


zip_sf
#> Simple feature collection with 209 features and 3 fields
#> Geometry type: MULTIPOLYGON
#> Dimension:     XY
#> Bounding box:  xmin: -74.25609 ymin: 40.4961 xmax: -73.70084 ymax: 40.91528
#> Geodetic CRS:  NAD83
#> First 10 features:
#>      zip        name   pop                       geometry
#> 1  11219 ZCTA5 11219 89371 MULTIPOLYGON (((-74.0127 40...
#> 2  10021 ZCTA5 10021 44280 MULTIPOLYGON (((-73.95926 4...
#> 3  10044 ZCTA5 10044 12440 MULTIPOLYGON (((-73.96159 4...
#> 4  11213 ZCTA5 11213 67056 MULTIPOLYGON (((-73.94782 4...
#> 5  11424 ZCTA5 11424     0 MULTIPOLYGON (((-73.83098 4...
#> 6  10005 ZCTA5 10005  8701 MULTIPOLYGON (((-74.01251 4...
#> 7  10311 ZCTA5 10311     0 MULTIPOLYGON (((-74.18058 4...
#> 8  10280 ZCTA5 10280  9496 MULTIPOLYGON (((-74.01949 4...
#> 9  11365 ZCTA5 11365 44738 MULTIPOLYGON (((-73.81416 4...
#> 10 11205 ZCTA5 11205 46843 MULTIPOLYGON (((-73.98022 4...
```

``` r
ggplot(zip_sf) + geom_sf() + theme_void()
```

<img src="man/figures/README-pressure-1.png" width="100%" />
