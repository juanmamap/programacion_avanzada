<<<<<<< HEAD
# Repite el precio el numero de veces del segundo parentesis

# define los vectores precio e id por separado

precio <- rep(c(4,2,1,3),c(1,5,10,14))

id <- (paste("id",c(1:30), sep = " - "))

# crea el data frame con los vectores antes creados

data <- data.frame(id,precio)

data$libros <- rep(c("novelas","tebeos","cuentos"),10)

data$precio > 2.5 & data$libros == "novelas"

item <- data[1,] # seleccionar la primera fila de un data frame


summary(data$precio)
if (item$precio > 2.5 | data$libros == "novelas"){print("se cumple la condicion")} # te devuelve el resultado de la condicion

paga <- 3

## Con la paga da para comprar??

for(i in 1:nrow(data)){
  if (data$precio[i] < paga){print("puedes comprar el libro")
    print(as.character(data$id[i]))}
}

## bucles con for y else

names(data)
for(i in 1:nrow(data)){
  if (data$precio[i] < paga)
  {print(paste("puedes comprar el libro", data$id[i], "y es una", data$libros[i]))}
  else {print(paste("no puedes comprar el libro", data$id[i], "y es una", data$libros[i]))}
}


## rellenar una nueva columna

names(data)
for(i in 1:nrow(data)){
  if (data$precio[i] < paga)
  {data$decision[i] <- (paste("puedes comprar el libro", data$id[i], "y es una", data$libros[i]))}
  else {data$decision[i] <- (paste("no puedes comprar el libro", data$id[i], "y es una", data$libros[i]))}
}
View(data$decision)

# crear vector con 100 numeros dist normal, media 2 y sd 0.1
vec1 <- rnorm(100, mean = 2, sd = 0.1)

# crear matriz con 20 filas y 10 columnas

m1 <- matrix(nrow = 20,ncol = 10)

# muestra aleatoria de 20 elementos

sample(vec1, 20)

# rellenar matriz con las muestras aleatorias

for(i in 1:ncol(m1)){
  m1[,i] <- sample(vec1, 20)
}

View(m1)

# hacer 10 graficos tipo histograma uno por columna


x11() # abre los graficos en una ventana nueva
par(mfrow = c(2,5))
for(i in 1:ncol(m1)){
  hist(m1[,i])
}

#intentar guardar los histogramas en 10 archivos de imagen diferentes


### funcion sumar 2 numeros


suma2numeros <- function(a,b){a+b}

a <- 1
b <- 145 

suma2numeros (a,b)

# para seleccionar registros dentro de vectores con muchos registros

largo <- c("a","b","c","d","e","f","g","h","i")
corto <- c("a","b","c")

=======
# Repite el precio el numero de veces del segundo parentesis

# define los vectores precio e id por separado

precio <- rep(c(4,2,1,3),c(1,5,10,14))

id <- (paste("id",c(1:30), sep = " - "))

# crea el data frame con los vectores antes creados

data <- data.frame(id,precio)

data$libros <- rep(c("novelas","tebeos","cuentos"),10)

data$precio > 2.5 & data$libros == "novelas"

item <- data[1,] # seleccionar la primera fila de un data frame


summary(data$precio)
if (item$precio > 2.5 | data$libros == "novelas"){print("se cumple la condicion")} # te devuelve el resultado de la condicion

paga <- 3

## Con la paga da para comprar??

for(i in 1:nrow(data)){
  if (data$precio[i] < paga){print("puedes comprar el libro")
    print(as.character(data$id[i]))}
}

## bucles con for y else

names(data)
for(i in 1:nrow(data)){
  if (data$precio[i] < paga)
  {print(paste("puedes comprar el libro", data$id[i], "y es una", data$libros[i]))}
  else {print(paste("no puedes comprar el libro", data$id[i], "y es una", data$libros[i]))}
}


## rellenar una nueva columna

names(data)
for(i in 1:nrow(data)){
  if (data$precio[i] < paga)
  {data$decision[i] <- (paste("puedes comprar el libro", data$id[i], "y es una", data$libros[i]))}
  else {data$decision[i] <- (paste("no puedes comprar el libro", data$id[i], "y es una", data$libros[i]))}
}
View(data$decision)

# crear vector con 100 numeros dist normal, media 2 y sd 0.1
vec1 <- rnorm(100, mean = 2, sd = 0.1)

# crear matriz con 20 filas y 10 columnas

m1 <- matrix(nrow = 20,ncol = 10)

# muestra aleatoria de 20 elementos

sample(vec1, 20)

# rellenar matriz con las muestras aleatorias

for(i in 1:ncol(m1)){
  m1[,i] <- sample(vec1, 20)
}

View(m1)

# hacer 10 graficos tipo histograma uno por columna


x11() # abre los graficos en una ventana nueva
par(mfrow = c(2,5))
for(i in 1:ncol(m1)){
  hist(m1[,i])
}

#intentar guardar los histogramas en 10 archivos de imagen diferentes


### funcion sumar 2 numeros


suma2numeros <- function(a,b){a+b}

a <- 1
b <- 145 

suma2numeros (a,b)

# para seleccionar registros dentro de vectores con muchos registros

largo <- c("a","b","c","d","e","f","g","h","i")
corto <- c("a","b","c")

>>>>>>> 967a83bc078229f9bd1f0c4a9721be516ea6b761
largo %in% corto