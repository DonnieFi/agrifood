## Dalhousie University 
## Agri-Food Analytics Institute
## Food price report source data from Statscan CPI
##
## load packages
library(readr)
library(tidyr)
library(dplyr)
library(stringr)

## Downloading StatsCan Table 18 monthly food price

#| food_url <-  "https://www150.statcan.gc.ca/n1/tbl/csv/18100002-eng.zip"
#| download.file(food_url, dest="dataset.zip")
#|
#| food_data <- read_csv("dataset.zip")

## data prep
## 1) remove gas prices, i.e. it is not food
## 2) only keep some columns
## 3) exclude terminated products

## as product names are lengthy, just use the anonymous VECTOR name

food_prep <- food_data %>% filter(VECTOR != 'v41838376', is.na(TERMINATED)) %>% 
    select(REF_DATE, VECTOR, VALUE) %>% spread(VECTOR, value = VALUE)

## but keep a lookup table of vector to product name combinations

food_map <- food_data %>% filter(VECTOR != 'v41838376', is.na(TERMINATED)) %>% 
  select(Products, VECTOR) %>% unique()


## process food_prep into a time series
## drop the ref_date column as it is not needed

food_ts <- ts(food_prep[,-1],f=12,s=1995)




                         