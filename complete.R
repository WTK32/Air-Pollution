complete <- function(directory, id = 1:332) {
  setwd(paste0("C:/Users/fruit/OneDrive/Documents/R/Coursera/",directory))
  id_char <- as.character(id)
  count_complete_df <- data.frame(id, nobs=0)
  
  for(i in 1:length(id)) {
      data <- read.csv(paste0(strrep("0",3-nchar(id_char[i])),id_char[i],".csv"))
      count_complete <- sum(complete.cases(data))
      count_complete_df[i,2] <- count_complete
  }
  count_complete_df
}
