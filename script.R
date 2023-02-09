library(tidyverse)
library(rvest)
library(lubridate)
library(data.table)   # Required for rbindlist
library(dplyr)        # Required to use the pipes %>% and some table manipulation commands
library(magrittr)     # Required to use the pipes %>%
library(stringr)
library(purrr)
library(tm)

df <- as.data.frame(matrix(ncol=3,nrow=0))
colnames(df) <- c("Date","Related","Document Title")

for (i in 0:64) {
  numPage <- i
  
  url <- paste("https://www.presidency.ucsb.edu/advanced-search?field-keywords=&field-keywords2=&field-keywords3=&from%5Bdate%5D=&to%5Bdate%5D=&person2=&category2%5B%5D=58&items_per_page=100&page=",numPage,sep="")
  
  page <- read_html(url)
  page %>% html_nodes(".table") %>% html_table()
  tempDf <- page %>% html_nodes(".table") %>% html_table()
  tempDf <- tempDf[[1]]
  df <- rbind(df,tempDf)
  message(i)

}

for (i in 1:length(df$Related)) {
  tempDf <- codebook %>% filter(President == df[i,]$Related)
  df[i,]$Party <- tempDf[1,]$Party
  message(i)
}
