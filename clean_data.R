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
data <- read_csv('raw_data.csv')

data$OCC_DATE <- as.Date(as.POSIXct(data$OCC_DATE, format="%m/%d/%Y %I:%M:%S %p"))
data$REPORT_DATE <- as.Date(as.POSIXct(data$REPORT_DATE, format="%m/%d/%Y %I:%M:%S %p"))

primary <- c('INCIDENT - BICYCLE',
             'THEFT OVER - BICYCLE',
             'THEFT OF EBIKE OVER $5000',
             'THEFT OF EBIKE UNDER $5000',
             'THEFT UNDER - BICYCLE')
data <- data |>
  mutate( TYPE = case_when(
    PRIMARY_OFFENCE %in% primary ~ 'Primary',
    TRUE ~ 'Non Primary'
  )) |>
  mutate(DURATION = REPORT_DATE - OCC_DATE)

data <- data |>
  select(OCC_DATE, OCC_YEAR, OCC_HOUR,
         REPORT_DATE, REPORT_HOUR, DIVISION,
         LOCATION_TYPE, BIKE_TYPE, BIKE_SPEED,
         BIKE_COLOUR, BIKE_COST, STATUS, NEIGHBOURHOOD_158,
         HOOD_158, LONG_WGS84, LAT_WGS84, TYPE, DURATION)

write_csv(data, 'analysis_data.csv')

