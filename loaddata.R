library(dplyr)
library(lubridate)
#please set your current working directory to the script file location

# download data function
download_data <- function(url, file){
    # create data folder if it does not exist
    if (!file.exists("data")) { dir.create("data") }
    file_path <- paste("./data", file, sep = "/")
    if (!file.exists(file_path)) {
        download.file(url, destfile = file_path, method = "curl")
    }
}
# providing url from which to load the dataset zip file
powerdata_url <- "https://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip"
download_data(powerdata_url, "household_power_consumption.zip")
# unzip the dataset
if (!file.exists("./data/household_power_consumption.txt")) {
    unzip("./data/household_power_consumption.zip", exdir = "./data")
}
# check if power_data is alrwady loaded
# so that it will load it on a second run, time efficient
if(length(ls(pattern= "power_data")) == 0 ){
colclasses <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric" )
power_data <- read.table("./data/household_power_consumption.txt", colClasses = colclasses, sep = ";", na.strings = "?", header = TRUE)
power_data <- tbl_df(power_data)
# filter power_data and keep only data for 1st and 2nd january of 2007 
power_data <-filter(power_data, Date == "1/2/2007" | Date == "2/2/2007")
# create a new column datetime
power_data$datetime <- dmy_hms(paste(power_data$Date, power_data$Time))
}

if (!file.exists("plots")) { dir.create("plots") }
