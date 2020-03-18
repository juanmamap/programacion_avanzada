library(dismo)
library(XML)
library(maptools)
library(dplyr)
library(ggplot2)
library(reshape2)
library(GSODRdata)
library(skimr)

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





