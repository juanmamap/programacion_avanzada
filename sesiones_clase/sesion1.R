<<<<<<< HEAD
##Ejemplo libreria####


library(lattice)
demo(lattice)

##limpiar memoria####
rm(list = ls())

########################################################

# Crear indices en los comentarios ## comentario ####
##Sesion 1.1 Basica

########################################################

##Crear un objeto: flecha de asignacion####

2-1
a<-1
str(a)#
length(a)
??str
??vv
vv <- c(1:10000)# generar vector de las 1 a 10000 de 1 en 1
str(vv)
head(vv,5000000)

cc <- "hola"
str(cc)
ccc <- c("hola mundo", "adios mundo",66)# la c es para concatenar
class(ccc)
View(ccc)

?cat
View(cat(cc,ccc))
View(ccc)

write.csv(ccc,"tabla_prueba.csv")
getwd()

# seleccionar de un vector
nuevo <- vv[500]

=======
##Ejemplo libreria####


library(lattice)
demo(lattice)

##limpiar memoria####
rm(list = ls())

########################################################

# Crear indices en los comentarios ## comentario ####
##Sesion 1.1 Basica

########################################################

##Crear un objeto: flecha de asignacion####

2-1
a<-1
str(a)#
length(a)
??str
??vv
vv <- c(1:10000)# generar vector de las 1 a 10000 de 1 en 1
str(vv)
head(vv,5000000)

cc <- "hola"
str(cc)
ccc <- c("hola mundo", "adios mundo",66)# la c es para concatenar
class(ccc)
View(ccc)

?cat
View(cat(cc,ccc))
View(ccc)

write.csv(ccc,"tabla_prueba.csv")
getwd()

# seleccionar de un vector
nuevo <- vv[500]

>>>>>>> 967a83bc078229f9bd1f0c4a9721be516ea6b761
