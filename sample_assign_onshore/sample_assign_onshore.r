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
data <- read.csv(".../dataset_10kmcoast.csv")
data <- tibble::rowid_to_column(data, "ID")
df<- data[,c("ID", "latitude", "longitude")]

out_temp<- #Enter outpath for scrap file 


#Download natural earth data zip at: https://www.naturalearthdata.com/. Zip file also in git rep.
land_10m<-rgdal::readOGR(".../natural_earth_vector/10m_physical/ne_10m_land.shp")
land_50m<-rgdal::readOGR(".../natural_earth_vector/50m_physical/ne_50m_land.shp")


#path for output csv file:
fin_out<-


#####Commands###
sf_data <- st_as_sf(df, coords = c("longitude", "latitude"))
geo_data <- sf_geojson(sf_data)
st_write(sf_data, out_temp) 
samps<-rgdal::readOGR(out_temp)
shore_dat<-crop(samps, land_10m)
shore_data_10m<-as.data.frame(shore_dat)
shore_data_10m$estimated_shore_10m<-'y'
shore_dat<-crop(samps, land_50m)
shore_data_50m<-as.data.frame(shore_dat)
shore_data_50m$estimated_shore_50m<-'y'
fin<-Reduce(function(x, y) merge(x, y, all=TRUE), list(shore_data_10m,shore_data_50m, data))



write.csv(fin, fin_out)
