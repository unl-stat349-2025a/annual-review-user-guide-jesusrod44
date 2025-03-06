# https://cran.r-project.org/web/packages/hurricaneexposure/vignettes/hurricaneexposure.html

library(drat)
addRepo("geanders")
library(hurricaneexposuredata)
library(hurricaneexposure)

data("hurr_tracks")
head(hurr_tracks)

map_counties(storm = "Katrina-2005", metric = "rainfall")

map_counties(storm = "Katrina-2005", metric = "rainfall", days_included = -1:0) + 
  ggplot2::ggtitle("Rain during Allison (2001) for day before and day of closest approach")


map_counties(storm = "Katrina-2005", metric = "wind")

map_event_exposure(storm = "Floyd-1999", event_type = "flood")
map_event_exposure(storm = "Katrina-2005", event_type = "flood")




