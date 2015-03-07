#please set your current working directory to the script file location

# this will load household_power_consumption data
# provides power_data dataframe
source('./loaddata.R')

png(file = "./plots/plot1.png", width = 480, height = 480, units = "px")
hist(power_data$Global_active_power,
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power",
     col = "red")
dev.off()
