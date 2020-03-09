<<<<<<< HEAD
##2 - Leer y salvar los datos

##Para seleccionar entre corchetes --variable[filas,columnas]--



#Hacemos un vector con una secuencia

??sequence

new5 <- seq(15,-2, lenght = 100)
View(new5)


#Generacion de matrices
??rep
vector4 <- rep(c(1:4), times = 250) # de 1 a 4, 250 veces
vector4 <- rep(c(1:4), each = 250, times = 1) # de 1 a 4, 250 veces

??matrix

matriz1 <- matrix(vector4, nrow = 250, ncol = 4)

#Seleccionamos de la 3ª columna las filas de 50 a 111

seleccion1 <- matriz1[c(50:111),3]
View(seleccion1)

#seleccionamos todas las filas con valores menores o iguales a 2

matriz2 <- matriz1[matriz1 <= 2]
View(matriz2)

#### data.frames 

area.urb <- rnorm (1000, mean = 20, sd = 2)
prob.inc <- rnorm (1000, mean = 0.6, sd = 0.1)
tipo <-  rep(c("med","temp","bor","trop"), times = 250)

data <- data.frame(area.urb,prob.inc,tipo)
View(data)

# mostrar la probabilidad de incendi en las areas urbana de mas de 17

kk <- data [data$area.urb > 17,]
head(kk)
mean(kk)
sd(kk)

# mostrar areas urbanas de mas 15 o mediterraneas

dataOR <- data [data$area.urb > 15 | data$tipo == "med",]

# mostrar areas urbanas de mas 15 y mediterraneas

dataAND <- data [data$area.urb > 15 & data$tipo == "med",2]

View(dataAND)
View(dataOR)

#### archivos CSV
getwd()
write.csv(data, "area_fuego.csv")

data.f <- read.csv("area_fuego.csv", sep = ",")
str(data.f)

#### analisis: calcular estadisticas basicas

# area quemada y tipo de incendio calculando la media, sd, bocplot y hist

mean(data.f$area.urb)
mean(data.f[,1])
mean(data.f[,2])

#### primer grafico en R

tiff("boxplot_inc.tif", width = 210, height = 130, units = "mm", res = 400)
par(mfrow=c(2,2), bg = "grey", bty = "n")    #### te divide el panel y concatena lo que hay debajo
boxplot(data.f$area.urb, col = "green")
hist(data.f$area.urb, col = "green", main = "", xlab = "Area urbana")
boxplot(data.f$prob.inc, col = "green")
hist(data.f$prob.inc, col = "green", main = "", xlab = "Probabilidad de incendios")
dev.off()

# area quemada y tipo de incendio calculando por bioma

tapply(data.f$area.urb, data.f$tipo,mean)

boxplot(tapply(data.f$area.urb, data.f$tipo,mean))

# ddply resume diferentes funciones para diferentes factores

install.packages("plyr")
library("plyr")
version

ddply (data.f,.(tipo), summarize,
       mean.area = mean(area.urb),
       sd.area = sd(area.urb))
=======
##2 - Leer y salvar los datos

##Para seleccionar entre corchetes --variable[filas,columnas]--



#Hacemos un vector con una secuencia

??sequence

new5 <- seq(15,-2, lenght = 100)
View(new5)


#Generacion de matrices
??rep
vector4 <- rep(c(1:4), times = 250) # de 1 a 4, 250 veces
vector4 <- rep(c(1:4), each = 250, times = 1) # de 1 a 4, 250 veces

??matrix

matriz1 <- matrix(vector4, nrow = 250, ncol = 4)

#Seleccionamos de la 3ª columna las filas de 50 a 111

seleccion1 <- matriz1[c(50:111),3]
View(seleccion1)

#seleccionamos todas las filas con valores menores o iguales a 2

matriz2 <- matriz1[matriz1 <= 2]
View(matriz2)

#### data.frames 

area.urb <- rnorm (1000, mean = 20, sd = 2)
prob.inc <- rnorm (1000, mean = 0.6, sd = 0.1)
tipo <-  rep(c("med","temp","bor","trop"), times = 250)

data <- data.frame(area.urb,prob.inc,tipo)
View(data)

# mostrar la probabilidad de incendi en las areas urbana de mas de 17

kk <- data [data$area.urb > 17,]
head(kk)
mean(kk)
sd(kk)

# mostrar areas urbanas de mas 15 o mediterraneas

dataOR <- data [data$area.urb > 15 | data$tipo == "med",]

# mostrar areas urbanas de mas 15 y mediterraneas

dataAND <- data [data$area.urb > 15 & data$tipo == "med",2]

View(dataAND)
View(dataOR)

#### archivos CSV
getwd()
write.csv(data, "area_fuego.csv")

data.f <- read.csv("area_fuego.csv", sep = ",")
str(data.f)

#### analisis: calcular estadisticas basicas

# area quemada y tipo de incendio calculando la media, sd, bocplot y hist

mean(data.f$area.urb)
mean(data.f[,1])
mean(data.f[,2])

#### primer grafico en R

tiff("boxplot_inc.tif", width = 210, height = 130, units = "mm", res = 400)
par(mfrow=c(2,2), bg = "grey", bty = "n")    #### te divide el panel y concatena lo que hay debajo
boxplot(data.f$area.urb, col = "green")
hist(data.f$area.urb, col = "green", main = "", xlab = "Area urbana")
boxplot(data.f$prob.inc, col = "green")
hist(data.f$prob.inc, col = "green", main = "", xlab = "Probabilidad de incendios")
dev.off()

# area quemada y tipo de incendio calculando por bioma

tapply(data.f$area.urb, data.f$tipo,mean)

boxplot(tapply(data.f$area.urb, data.f$tipo,mean))

# ddply resume diferentes funciones para diferentes factores

install.packages("plyr")
library("plyr")
version

ddply (data.f,.(tipo), summarize,
       mean.area = mean(area.urb),
       sd.area = sd(area.urb))
>>>>>>> 967a83bc078229f9bd1f0c4a9721be516ea6b761
