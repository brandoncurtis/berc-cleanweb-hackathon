library(dplyr)

 setwd('~/workspace/berc-cleanweb-hackathon/R/bayAreaMap/')

#solarData <- read.csv('data/solarhouses_byzip_2050.csv', stringsAsFactors=F)
#solarData$zipcode <- formatC(solarData$ZIP, width=5, format="d", flag="0")
#saveRDS(solarData, 'data/solar.rds')
 
# solarData <- readRDS('data/solar.rds')
# 
# zip code data
# allzips <- readRDS("data/superzip.rds")
# allzips$zipcode <- formatC(allzips$zipcode, width=5, format="d", flag="0")
# allzips <- allzips[c('zipcode', 'latitude', 'longitude')]
# 
 
# join solar data to zip clode data and add jitter
#  solarDataLatLng <- solarData %>%
#    select(zipcode, Solar.Houses) %>%
#    left_join(allzips) %>%
#    filter(complete.cases(.)) %>%
#    group_by(zipcode) %>%
#    do(data.frame( ziplat=.$latitude, ziplng=.$longitude,
#                   nrows = seq(1, .$Solar.Houses))) %>%
#    ungroup() %>%
#    mutate( lat = jitter(ziplat, amount = .01)) %>%
#    mutate( lng = jitter(ziplng, amount=.01))

#saveRDS(solarDataLatLng, file = 'data/solarLatLng.rds')
#solarDataLatLng <- readRDS('data/solarLatLng.rds')
#solarDataLatLngNarrow = solarDataLatLng %>%
#  select( zipcode, nrows)
#write.table(solarDataLatLngNarrow, file='data/allOfAmericaNarrow.csv', row.names=F,
# sep = ",")

#solarDataLatLngFromUltrix <- read.csv('data/bayarea_update.csv', stringsAsFactors=F)
#saveRDS(solarDataLatLngFromUltrix, 'data/bayarea_update.rds')
#solarDataLatLng <- readRDS('data/bayarea_update.rds')
#lngRng = c( -122.8, -121.6)
#latRng = c( 37.2, 37.9)

#solarDataLatLngFromUltrix <- read.csv('data/allus_update.csv', stringsAsFactors=F)
#saveRDS(solarDataLatLngFromUltrix, 'data/allus_update.rds')
solarDataLatLngFromUltrix <- readRDS('data/allus_update.rds') %>%
  select(zipcode, Lat_2, Long_2) %>%
  rename(lat = Lat_2, lng=Long_2)

#subsetted <- solarDataLatLngFromUltrix %>% rename(lat = Lat_2, lng=Long_2)