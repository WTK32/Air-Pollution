corr <- function(directory, threshold = 0) {
  complete_data <- data.frame(complete(directory),complete(directory)["nobs"]>threshold)
  names(complete_data) <- c("id","nobs","valid")
  valid_monitor_id <- complete_data[complete_data$valid,]$id
  
  if (length(valid_monitor_id)==0) {
    valid_monitor_id
  }
  else {
    id_char <- as.character(valid_monitor_id)
    cor_valid_monitor <- data.frame(valid_monitor_id, cor=0)
  
    for(i in 1:length(valid_monitor_id)) {
      data <- read.csv(paste0(strrep("0",3-nchar(id_char[i])),id_char[i],".csv"))
      correlation <- cor(x=data$sulfate, y=data$nitrate, use = "complete.obs")
      cor_valid_monitor[i,2] <- correlation
    }
  cor_valid_monitor$cor
  #correlation
  }
}
