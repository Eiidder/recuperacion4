#DATA DISCOVERING

library(tidyverse)
library(naniar)
library(summarytools)


#Carga de datos
df <- read.csv("C:\\Users\\eider\\Downloads\\netflix.csv")

df$Minutes <- as.numeric(df$Minutes)
df$Seasons <- as.numeric(df$Seasons)

#EXPLORACIÓN DE DATOS
resumen <- df %>%
  summarise(
    Max_Minutes = max(Minutes, na.rm = TRUE),
    Q3_Minutes = quantile(Minutes, 0.75, na.rm = TRUE),
    Mediana_Minutes = median(Minutes, na.rm = TRUE),
    Media_Minutes = mean(Minutes, na.rm = TRUE),
    Q1_Minutes = quantile(Minutes, 0.25, na.rm = TRUE),
    Min_Minutes = min(Minutes, na.rm = TRUE),
    NAs_Minutes = sum(is.na(Minutes)),
    SD_Minutes = sd(Minutes, na.rm = TRUE),
    
    Max_Seasons = max(Seasons, na.rm = TRUE),
    Q3_Seasons = quantile(Seasons, 0.75, na.rm = TRUE),
    Mediana_Seasons = median(Seasons, na.rm = TRUE),
    Media_Seasons = mean(Seasons, na.rm = TRUE),
    Q1_Seasons = quantile(Seasons, 0.25, na.rm = TRUE),
    Min_Seasons = min(Seasons, na.rm = TRUE),
    NAs_Seasons = sum(is.na(Seasons)),
    SD_Seasons = sd(Seasons, na.rm = TRUE)
  )

print(resumen)

#Valores únicos en Type y Country
length(unique(df$type))
length(unique(df$country))
