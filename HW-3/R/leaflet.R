##install.packages("leaflet")

library("leaflet")

m<-leaflet()

m <- addTiles(m)

m <- addCircleMarkers(m, lng=-118.28873545702392, lat=34.02704111526119,label="MyHome", radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.28643705569854, lat=34.02341400213798,label="CinematicArtsF",     radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.28563686179062, lat=34.0222446561058,label="EileenNorrisF",      radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.28287364563872, lat=34.021450274116745,label="LeaveyF", radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.28343419693724, lat=34.020489258295896,label="CarolynCraigF",     radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.28456761692429, lat=34.02053795643786,label="DohenyF",      radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.28520808751408, lat=34.020196185486576,label="PatsyForrestF", radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.28597895140501, lat=34.02370892953405,label="WilsonDentalLib",     radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.28293593867708, lat=34.02179057701038,label="LeaveyLib",      radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.28371035911809, lat=34.020184253601485,label="DohenyLib", radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.2866052695459, lat=34.01871004909205,label="HooseLib",     radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.28801069467708, lat=34.01921811736642,label="HelenLib",      radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.28879810874089, lat=34.01962900542824,label="ScienceEngLib",      radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")

m

