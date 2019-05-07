## Dalhousie University 
## Agri-Food Analytics Institute
## Food price report source data from Statscan CPI
##
## load packages
library(readr)
library(dplyr)

## Downloading StatsCan Table 18 monthly food price

food_url <-  "https://www150.statcan.gc.ca/n1/tbl/csv/18100002-eng.zip"
download.file(food_url, dest="dataset.zip")

food_data <- read_csv("dataset.zip")

## data prep
## 1) remove gas prices, i.e. it is not food
## 2) only keep some columns
## 3) exclude terminated products

food_prep <- food_data %>% filter(!VECTOR =='V41838376', is.na(TERMINATED)) %>% 
    select(REF_DATE, Products, VECTOR, COORDINATE, VALUE) 

products <- unique(food_prep$Products)
products





