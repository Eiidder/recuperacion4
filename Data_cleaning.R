#LIMPIEZA DE DATOS

library(tidyverse)
library(naniar)
library(summarytools)

#Carga de datos
df <- read.csv("C:\\Users\\eider\\Downloads\\netflix.csv")

#Analisis de Nas por vvariable
na_por_variable <- colSums(is.na(df))
na_por_variable <- sort(na_por_variable, decreasing = TRUE)
porcentaje_na <- round((na_por_variable / nrow(df)) * 100, 2)

na_df <- data.frame(
  Variable = names(na_por_variable),
  NAs = na_por_variable,
  Porcentaje = porcentaje_na
)

print(na_df)

#Visualización de distribución de NAs
set.seed(123)
muestra <- df[sample(1:nrow(df), size = round(0.01 * nrow(df))), ]
vis_miss(muestra)

#Tratamiento de NAs en Minutes y Seasons usando imputación con la mediana
df$Minutes[is.na(df$Minutes)] <- median(df$Minutes, na.rm = TRUE)
df$Seasons[is.na(df$Seasons)] <- median(df$Seasons, na.rm = TRUE)
