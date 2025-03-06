library(sf)
library(mapview)
library(maps)
library(mapdata)
library(tidyverse)


# most of this code was taken from 
# https://michaelminn.net/tutorials/r-hurricanes/index.html

library(readr)
panel <- read_csv("2022-hurricane-panel.csv")

barplot(table(panel$DECADE))

library(sf)

waypoints = st_as_sf(panel, coords = c("LONGITUDE", "LATITUDE"), crs = 4326)


waypoints <- waypoints %>% 
  filter(HNAME == "KATRINA") %>%   # I just want one hurricane, that being katrina
  filter(str_detect(DATE, "2005")) # the date is messy

  

plot(waypoints["HNAME"])
# plot(waypoints$HNAME) <-- this doesn't work 

waypoints.hurricanes = waypoints[(waypoints$STATUS == "HU") & (waypoints$DATE >= "20000101"),]

palette = colorRampPalette(c("darkgreen", "gray", "navy"))

plot(waypoints.hurricanes["HNAME"], pal=palette)

# OpenStreetMap does not work unless you have rJava installed so I tried to make mapview work with this
mapview(waypoints.hurricanes, zcol = "PRESURE_MB", col.regions = palette, legend = TRUE)
# lower atmospheric pressure (PRESURE_MB) == stronger storm