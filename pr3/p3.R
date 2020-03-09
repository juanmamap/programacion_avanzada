<<<<<<< HEAD
install.packages("dplyr")

library(dplyr)
library(raster)
library(sf)
library(ggplot2)
library(tmap)
library(mapview)
library(leaflet)


## Ejemplo1: datos vectoriales
## leer datos

setwd("D:/00-MASTER/Programacion_av/practica3")

bayarea <- read_sf("data_tema3//backup-counties-bayarea.shp")

glimpse(bayarea)


## primer grafico de un mapa

x11()
plot(bayarea)
names(bayarea)

## hacemos un gráfico con tmap

tm_shape(bayarea) +
  tm_polygons(col = "county", lwd = 2, lty = 3, convert2density = TRUE)
  
?tm_polygons


## CALCULAR CENTROIDES

bayarea_cent <- st_centroid(bayarea)
mapview(list(bayarea,bayarea_cent))

## Leer archivo de provincias

provincias <- read_sf("data_tema3//ll_provinciales_inspire_peninbal_etrs89.shp")
glimpse(provincias)
mapview(provincias)

## Exolorar datos

class(provincias)
head(provincias)

## Hacemos mapa provincias

plot(provincias)

x11()
tm_shape(provincias) +
  tm_lines (col = "orange", lwd = 2)
?tm_lines
st_crs(provincias)
prov_reproy <- st_transform(provincias, crs = 32618) 
mapview(list(provincias,prov_reproy))

## ejemplo con puntos

puntos <- read.delim("data_tema3//Plotcode_madrid.txt")
head(puntos)
names(puntos)
summary(puntos)
puntos$FCCARB[is.na(puntos$FCCARB)] <- 0
puntos<-na.omit(puntos)
x11()
bosque <- puntos[puntos$FCCARB > 10,]
dim(bosque)

## %>% sirve para anidar resultados

## pasar a archivo vectorial

sbosque <- bosque %>% st_as_sf(coords = c("CX","CY"), crs = 25830)
plot(sbosque)                
st_geometry(sbosque)

install.packages("devtools")
library(devtools)

devtools::install_github("ropensci/rnaturalearth", force = TRUE)
library(rnaturalearth)

## mapa paises del mundo
countries <- ne_countries(returnclass = "sf")

tm_shape(shp = countries)+
  tm_polygons(col = "name", border.col = "grey",
              title = "Paises", lwd = 2, lty = 3)+
  tm_layout(main.title = "Mapa del mundo",
            main.title.position = "center")

# states, admin levels

sp_c <- ne_countries(returnclass = "sf", country = "ireland", scale = "large")
tm_shape(shp = sp_c)+
  tm_polygons(col = "red")

coast <- ne_coastline(returnclass = "sf", scale = "large")
tm_shape(shp = coast)+
  tm_lines(col = "blue")

coast <- ne_coastline(returnclass = "sf", scale = "large")
x11()
st_geometry(coast) %>% plot(col = "blue")

#countries: ejemplos de uso de ddply con un vectorial
library(dplyr)
countries <- ne_countries(returnclass = "sf") 
glimpse(countries) # descripcion de los datos uno por uno
names(countries)

europa <-  countries %>% 
  filter(continent == "Europe") %>% 
  dplyr::select("name_sort","subregion","continent","lastcensus") 
  filter(continent == "Europe")
x11()
plot(europa)
plot(europa$geometry) # solo con la geometria

# agrupacion por subregiones

europa_st <- europa %>% 
              group_by(subregion) %>% 
                summarize(lastcensus = mean(lastcensus))

# mapa con distintos colores para lastcensus

tm_shape(shp = europa_st)+
  tm_polygons(col = "lastcensus", border.col = "grey")+
  tm_layout(main.title = "Subregiones de Europa",
            main.title.position = "center")

# sistema de coord

st_crs(europa_st)

# obtener las coordenadas de la extension

europa_st %>% st_bbox()

#convertit la extension en poligono

poly <- st_as_sfc(st_bbox(europa_st))


# trabajando con Raster

library(raster)

# leer datos raster de una unica banda con la función raster

single <- raster("PNOA_MDT200_ETRS89_HU30_Madrid.asc")

multi <- brick("LT05_L1TP_201032_20080820_20180116_01_T1_MB_7BANDAS.TIF")

single

multi

# escribir archivos de salida

writeRaster(single, "output\\elevation.tif")
writeRaster(multi, "output\\landsat.tif")

# visualizar

plot(single)
x11() 
tm_shape (single) + tm_raster()

extent(multi) ## estensión del raster

ext.ras <- c(304185, 547215, 4356885, 4573515)
ext.pol <- c(304186, 547216, 4356886, 4573516)
x11()
plot(ext.ras, col = "red")
points(ext.pol, col = "blue")

new <- crop(multi, ext.pol)
plot(new)

## tratar de hacer operaciones con las bandas (indices, etc)

=======
install.packages("dplyr")

library(dplyr)
library(raster)
library(sf)
library(ggplot2)
library(tmap)
library(mapview)
library(leaflet)


## Ejemplo1: datos vectoriales
## leer datos

setwd("D:/00-MASTER/Programacion_av/practica3")

bayarea <- read_sf("data_tema3//backup-counties-bayarea.shp")

glimpse(bayarea)


## primer grafico de un mapa

x11()
plot(bayarea)
names(bayarea)

## hacemos un gráfico con tmap

tm_shape(bayarea) +
  tm_polygons(col = "county", lwd = 2, lty = 3, convert2density = TRUE)
  
?tm_polygons


## CALCULAR CENTROIDES

bayarea_cent <- st_centroid(bayarea)
mapview(list(bayarea,bayarea_cent))

## Leer archivo de provincias

provincias <- read_sf("data_tema3//ll_provinciales_inspire_peninbal_etrs89.shp")
glimpse(provincias)
mapview(provincias)

## Exolorar datos

class(provincias)
head(provincias)

## Hacemos mapa provincias

plot(provincias)

x11()
tm_shape(provincias) +
  tm_lines (col = "orange", lwd = 2)
?tm_lines
st_crs(provincias)
prov_reproy <- st_transform(provincias, crs = 32618) 
mapview(list(provincias,prov_reproy))

## ejemplo con puntos

puntos <- read.delim("data_tema3//Plotcode_madrid.txt")
head(puntos)
names(puntos)
summary(puntos)
puntos$FCCARB[is.na(puntos$FCCARB)] <- 0
puntos<-na.omit(puntos)
x11()
bosque <- puntos[puntos$FCCARB > 10,]
dim(bosque)

## %>% sirve para anidar resultados

## pasar a archivo vectorial

sbosque <- bosque %>% st_as_sf(coords = c("CX","CY"), crs = 25830)
plot(sbosque)                
st_geometry(sbosque)

install.packages("devtools")
library(devtools)

devtools::install_github("ropensci/rnaturalearth", force = TRUE)
library(rnaturalearth)

## mapa paises del mundo
countries <- ne_countries(returnclass = "sf")

tm_shape(shp = countries)+
  tm_polygons(col = "name", border.col = "grey",
              title = "Paises", lwd = 2, lty = 3)+
  tm_layout(main.title = "Mapa del mundo",
            main.title.position = "center")

# states, admin levels

sp_c <- ne_countries(returnclass = "sf", country = "ireland", scale = "large")
tm_shape(shp = sp_c)+
  tm_polygons(col = "red")

coast <- ne_coastline(returnclass = "sf", scale = "large")
tm_shape(shp = coast)+
  tm_lines(col = "blue")

coast <- ne_coastline(returnclass = "sf", scale = "large")
x11()
st_geometry(coast) %>% plot(col = "blue")

#countries: ejemplos de uso de ddply con un vectorial
library(dplyr)
countries <- ne_countries(returnclass = "sf") 
glimpse(countries) # descripcion de los datos uno por uno
names(countries)

europa <-  countries %>% 
  filter(continent == "Europe") %>% 
  dplyr::select("name_sort","subregion","continent","lastcensus") 
  filter(continent == "Europe")
x11()
plot(europa)
plot(europa$geometry) # solo con la geometria

# agrupacion por subregiones

europa_st <- europa %>% 
              group_by(subregion) %>% 
                summarize(lastcensus = mean(lastcensus))

# mapa con distintos colores para lastcensus

tm_shape(shp = europa_st)+
  tm_polygons(col = "lastcensus", border.col = "grey")+
  tm_layout(main.title = "Subregiones de Europa",
            main.title.position = "center")

# sistema de coord

st_crs(europa_st)

# obtener las coordenadas de la extension

europa_st %>% st_bbox()

#convertit la extension en poligono

poly <- st_as_sfc(st_bbox(europa_st))


# trabajando con Raster

library(raster)

# leer datos raster de una unica banda con la función raster

single <- raster("PNOA_MDT200_ETRS89_HU30_Madrid.asc")

multi <- brick("LT05_L1TP_201032_20080820_20180116_01_T1_MB_7BANDAS.TIF")

single

multi

# escribir archivos de salida

writeRaster(single, "output\\elevation.tif")
writeRaster(multi, "output\\landsat.tif")

# visualizar

plot(single)
x11() 
tm_shape (single) + tm_raster()

extent(multi) ## estensión del raster

ext.ras <- c(304185, 547215, 4356885, 4573515)
ext.pol <- c(304186, 547216, 4356886, 4573516)
x11()
plot(ext.ras, col = "red")
points(ext.pol, col = "blue")

new <- crop(multi, ext.pol)
plot(new)

## tratar de hacer operaciones con las bandas (indices, etc)

>>>>>>> 967a83bc078229f9bd1f0c4a9721be516ea6b761
