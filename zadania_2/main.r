library('googleVis')

coords = strsplit(data$coords, split="; ")
lat = sapply(coords, function(x) x[1])
long = sapply(coords, function(x) x[2])

data$lat = lat
data$long = long

data$gcoords = gsub("; ", ":", data$coords)
data$gcoords = sapply(coords, function(x) paste(x[2], x[1], sep=":"))

geoMap = gvisMap(data, locationvar="gcoords", tipvar="url", options=list(showTip=FALSE, 
                                               mapType='normal',
                                               enableScrollWheel=TRUE
                                               ,useMapTypeControl=TRUE))

plot(geoMap)

print(geoMap, tag = "chart")