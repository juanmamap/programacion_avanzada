library(dismo)
library(XML)
library(maptools)
library(dplyr)
library(ggplot2)
library(reshape2)
library(GSODRdata)
library(skimr)
library(gdalUtils)
library("rgdal")
# Selección de directorio de trabajo

setwd("D:/00-MASTER/Programacion_av/practica3")

# Raiz de la página de descargas para acortar código enlaces

link_head <- "https://envidatrepo.wsl.ch/uploads/chelsa/chelsa_V1/"


#### Script de descarga desde Chelsa

## Rutas de los enlaces a ftp de Chelsa

# Precipitación mensual Escenario RCP 26 - Modelo CCSM4 - 2041 - 2060

desc_prec <- paste0(link_head,"cmip5/2041-2060/prec/CHELSA_pr_mon_CCSM4_rcp26_r1i1p1_g025.nc_", 1:12, "_2041-2060.tif")

# Rutas a directorio de descarga

arch_prec <- paste0("D:/00-MASTER/Programacion_av/practica3/modelos/CHELSA_pr_mon_CCSM4_rcp26_r1i1p1_g025.nc_", 1:12, "_V1.2_land.tif")

# Bucles para que se realicen la descargas 

for(i in seq_along(desc_prec)){
  download.file(desc_prec[i], arch_prec[i], mode="wb")
}

# Temperatura media mensual Escenario RCP 26 - Modelo CCSM4 - 2041 - 2060

desc_temp <- paste0(link_head,"cmip5/2041-2060/temp/CHELSA_tas_mon_CCSM4_rcp26_r1i1p1_g025.nc_", 1:12, "_2041-2060_V1.2.tif")

# Rutas a directorio de descarga

arch_temp <- paste0("D:/00-MASTER/Programacion_av/practica3/modelos/CHELSA_tas_mon_CCSM4_rcp26_r1i1p1_g025.nc_", 1:12, "_2041-2060_V1.2.tif")

# Bucles para que se realicen la descargas 

for(i in seq_along(desc_temp)){
  download.file(desc_temp[i], arch_temp[i], mode="wb")
}

# Lectura de los archivos descargados de Chelsa

path <- "D:/00-MASTER/Programacion_av/practica3/modelos"
files <- list.files(path, pattern='tif$', full.names=TRUE )
files

# Creación de rastrer con Stack para visualizar los datos

predictors <- stack(files)

# Exploramos datos de los raster

glimpse(predictors)
class(predictors) 
crs(predictors)


# Visualizar datos en bruto

x11()
plot(pred)

# Coordenadas de sudamerica para recortar datos climaticos a zona de estudio elegida

e<-extent(-85,-30,-60,25)
pred <- crop(predictors,e)


# Estadisticas de los modelos de precipitación y temperatura

media_modelo_prec <- mean(pred,1:12)
media_modelo_temp <- mean(pred,13:24)
desv_modelo_prec <- sd(pred,1:12) 
desv_modelo_temp <- sd(pred,13:24)
max_modelo_prec <- max(pred,1:12)
max_modelo_temp <- max(pred,13:24)
min_modelo_prec <- max(pred,1:12)
min_modelo_temp <- max(pred,13:24)

# Visualización de las estadisticas

plot(media_modelo_prec)
plot(media_modelo_temp)
plot(desv_modelo_prec)
plot(desv_modelo_temp)
plot(max_modelo_prec)
plot(max_modelo_temp)
plot(min_modelo_prec)
plot(min_modelo_temp)

