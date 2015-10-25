library(shiny)
library(leaflet)
library(RColorBrewer)
library(scales)
library(lattice)
library(dplyr)

set.seed(100)

shinyServer(function(input, output, session) {

  ## Interactive Map ###########################################

  # Create the map
  output$map <- renderLeaflet({
    leaflet() %>%
      addProviderTiles("Stamen.TerrainBackground") %>%
      setView(lng = -93.85, lat = 37.45, zoom = 4)
  })

  # A reactive expression that returns the set of zips that are
  # in bounds right now
  dataInBounds <- reactive({
    empty_df = data_frame( zipcode = character(),
                           ziplat = numeric(),
                           ziplng = numeric(),
                           nrows = integer(),
                           lat = numeric(),
                           lng = numeric()
                           )
    if (is.null(input$map_bounds))
      return(empty_df)
    bounds <- input$map_bounds
    latRng <- range(bounds$north, bounds$south)
    lngRng <- range(bounds$east, bounds$west)

     subsetted <- subset(solarDataLatLngFromUltrix,
       lat >= latRng[1] & lat <= latRng[2] &
         lng >= lngRng[1] & lng <= lngRng[2])

    if(nrow(subsetted) >= 1000){
      subsetted[sample.int(nrow(subsetted), 1000),]
    } else {
      subsetted
    }
  })

   observe({
       leafletProxy("map", data = dataInBounds()) %>%
         clearShapes() %>%
         addCircles(~lng, ~lat)
       })
})
