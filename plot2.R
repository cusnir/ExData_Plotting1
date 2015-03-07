#please set your current working directory to the script file location

# this will load household_power_consumption data
# provides power_data dataframe
source('./loaddata.R')

png(file = "./plots/plot2.png", width = 480, height = 480, units = "px")
plot(power_data$Global_active_power ~ power_data$datetime,
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     col = "black",
     type = "l")
dev.off()
