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

out_temp<- #Enter a filepath for scrap file described below


#Download natural earth data zip at: https://www.naturalearthdata.com/. Zip file also in git rep.
land_10m<-rgdal::readOGR(".../natural_earth_vector/10m_physical/ne_10m_land.shp")
land_50m<-rgdal::readOGR(".../natural_earth_vector/50m_physical/ne_50m_land.shp")



fin_out<-#Enter a filepath for your output csv file:


#####Commands###
#These lines convert the tabular data into spatial data and saves it as a scrapfile. Feel free to delete after.
sf_data <- st_as_sf(df, coords = c("longitude", "latitude"))
geo_data <- sf_geojson(sf_data)
st_write(sf_data, out_temp) 
samps<-rgdal::readOGR(out_temp)
#These line crops your spatial sample data to the 1:10000000 resolution polygon and marks if they are within the subset before being added back to the dataset.
shore_dat<-crop(samps, land_10m)
shore_data_10m<-as.data.frame(shore_dat)
shore_data_10m$estimated_shore_10m<-'y'
#These line crops your spatial sample data to the 1:50000000 resolution polygon and marks if they are within the subset before being added back to the dataset.
shore_dat<-crop(samps, land_50m)
shore_data_50m<-as.data.frame(shore_dat)
shore_data_50m$estimated_shore_50m<-'y'
#This line adds the estimation of onshore state to the overall dataset by merging the above 3 sets.
fin<-Reduce(function(x, y) merge(x, y, all=TRUE), list(shore_data_10m,shore_data_50m, data))


#Write to file:
write.csv(fin, fin_out)
