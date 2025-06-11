# plumber.R
#* @apiTitle API examen Eider Gana
#* @apiDescription API que permite visualizar la distribución de la duración de películas (Minutes)

# Cargar librerías necesarias
library(plumber)
library(ggplot2)

# Cargar los datos
df <- read.csv("C:\\Users\\eider\\Downloads\\netflix.csv")

#* Devuelve un histograma de la variable Minutes (con o sin transformación)
#* @param transformar Valor lógico ("si" o "no") que indica si se aplica transformación logarítmica a Minutes
#* @get /histograma
#* @serializer png
function(transformar = "no") {
  
  # Filtrar solo películas
  df_filtrado <- df[df$type == "Movie", ]
  
  # Quitar NAs
  minutos <- na.omit(as.numeric(df_filtrado$Minutes))
  
  # Aplicar transformación si se indica
  if (tolower(transformar) == "si") {
    minutos <- log(minutos + 1)
    titulo <- "Histograma (log Minutes)"
  } else {
    titulo <- "Histograma (Minutes)"
  }
  
  # Crear histograma
  histograma <- ggplot(data.frame(Minutes = minutos), aes(x = Minutes)) +
    geom_histogram(bins = 30, fill = "steelblue", color = "white") +
    labs(title = titulo, x = "Minutes", y = "Frecuencia")
  
  print(histograma)
}

r<- plumb("plumber.R")

r$run(port = 8000)

#CREAR RAMA
#git checkout -b api_brach
#AÑADIR Y COMITEAR APPI
#git add plumber.R
#git commit -m "Añadir Api funcional con histograma"
#git push -u origin api_branch
