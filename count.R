maxCount <- 0

for (i in 1791:2023) {
  startYear <- i
  
  startDate <- ymd(paste(startYear,"-01-22",sep=""))
  endDate <- ymd(paste((startYear+1),"-01-22",sep=""))
  int <- interval(startDate,endDate)
  
  countDf <- df %>% filter(Date %within% int)
  count <- dim(countDf)[1]
  
  if (count >= maxCount) {
    maxCount <- count
  }
  message(i)
}

