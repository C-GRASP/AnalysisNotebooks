library(tidyverse)
library(maps)
library(rnaturalearth)
library(rnaturalearthdata)
library(rgeos)
library(sf)
library(geosphere)
library(parallel)
library(geojsonR)
library(rgdal)
library(raster)
library(geojsonsf)
library(geojson)

#import the coast data
data <- read.csv("/home/will/Desktop/USGS/Data/dataset_10kmcoast.csv")
data <- tibble::rowid_to_column(data, "ID")
df<- data[,c("ID", "latitude", "longitude")]


sf_data <- st_as_sf(df, coords = c("longitude", "latitude"))

geo_data <- sf_geojson(sf_data)

CL <- ne_countries(scale = 50, returnclass = "sp")

st_write(sf_data, "/home/will/Desktop/USGS/Data/data_temp.geojson") 

samps<-rgdal::readOGR("/home/will/Desktop/USGS/Data/data_temp.geojson")
land<-rgdal::readOGR("/home/will/Desktop/USGS/natural_earth_vector/10m_physical/ne_10m_land.shp")


shore_dat<-crop(samps, land)





#enter output path for data with distances:
outpath='/home/will/Desktop/USGS/Data/dataset_onshoresames.csv'
#dataset is huge, so we will parallelize  function. Input amount of cores:
corenum=enter
#We will clip US coastline to east coast bounds (geojson included in repo)
bounds  <- rgdal::readOGR(".../EastCoastBounds.geojson")



############# Function #############
loc <- data %>% 
  select(longitude, latitude)

#import USA (or Coastline)



bounds <- spTransform(bounds, CRS(proj4string(CL))) # transform CRS
gClip <- function(shp, bb){
  if(class(bb) == "matrix") b_poly <- as(extent(as.vector(t(bb))), "SpatialPolygons")
  else b_poly <- as(extent(bb), "SpatialPolygons")
  gIntersection(shp, b_poly, byid = T)
}
CL <- gClip(CL, bounds)
Sed_Data<-data

# Start the clock!
ptm <- proc.time()





#Run Function
fun<-function(i) return(tryCatch(c(dist2Line(c(Sed_Data$longitude[i], Sed_Data$latitude[i]), CL))[1],
                   (dist2Line(c(Sed_Data$longitude[i], Sed_Data$latitude[i]), CL))[2],
                   (dist2Line(c(Sed_Data$longitude[i], Sed_Data$latitude[i]), CL))[3],
                   (Sed_Data$ID[i]), error=function(i) NULL))
cl <- makeCluster(corenum)
clusterEvalQ(cl, { library("geosphere") }) 
clusterExport(cl, c("dist2Line", "Sed_Data","CL" )) #include all your objects and functions you want to use, and export them to a cluster
results <- parLapply(cl,1:nrow(Sed_Data),fun=fun) #use parLapply to 'loop' through the points and return a list of distance values


dist <- data.frame(matrix(ncol = 4, nrow =nrow(Sed_Data)))
x <- c("ID","Distance", "coast_longitude", "coast_latitude")
colnames(dist) <- x


j=1
for (j in 1:nrow(Sed_Data)){
  dist$ID[j]=results[[j]][4]
  dist$Distance[j]=results[[j]][1]
  dist$coast_longitude[j]=results[[j]][2]
  dist$coast_latitude[j]=results[[j]][3]
  j=j+1
}

#Join the distances to Sample Data

Data_w_CoastDist<-merge(Sed_Data,dist, by='ID')


# Stop the clock
proc.time() - ptm

write.csv(Data_w_CoastDist, outpath)


