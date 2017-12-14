pollutantmean <- function(directory, pollutant, id = 1:332) {
    setwd(paste0("C:/Users/fruit/OneDrive/Documents/R/Coursera/",directory))
    id_char <- as.character(id)
    for(i in 1:length(id)) {
        if(i==1)
            all_data <- read.csv(paste0(strrep("0",3-nchar(id_char[i])),id_char[i],".csv"))[[pollutant]]
        else 
            all_data <- c(all_data,read.csv(paste0(strrep("0",3-nchar(id_char[i])),id_char[i],".csv"))[[pollutant]])
    }
    # class_data <- class(all_data)
    # class_data
    mean(all_data,na.rm = TRUE)
}

