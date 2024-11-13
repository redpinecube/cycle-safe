# variables of interest :

# motivation - is bike theft the primary offense
# time of day
# year
# duration till report
# division
# location type
# bike type
# bike color
# bike cost
# status
# neighborhood
# longitude 
# latitude

library(tidyverse)
data <- read_csv('./data/raw_data/raw_data.csv')

data$OCC_DATE <- as.Date(as.POSIXct(data$OCC_DATE, format="%m/%d/%Y %I:%M:%S %p"))
data$REPORT_DATE <- as.Date(as.POSIXct(data$REPORT_DATE, format="%m/%d/%Y %I:%M:%S %p"))


data <- data |>
  select(OCC_DATE, OCC_YEAR, OCC_HOUR,
         REPORT_DATE, REPORT_HOUR, DIVISION,
         PREMISES_TYPE, BIKE_TYPE, BIKE_SPEED,
         BIKE_COLOUR, BIKE_COST, STATUS, NEIGHBOURHOOD_158,
         HOOD_158, LONG_WGS84, LAT_WGS84, PRIMARY_OFFENCE)

write_csv(data, './data/analysis_data/analysis_data.csv')

