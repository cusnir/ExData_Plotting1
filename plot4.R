#please set your current working directory to the script file location

# this will load household_power_consumption data
# provides power_data dataframe
source('./loaddata.R')

png(file = "./plots/plot4.png", width = 480, height = 480, units = "px")

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
# plot 1
plot(power_data$Global_active_power ~ power_data$datetime,
     ylab = "Global Active Power",
     xlab = "",
     col = "black",
     type = "l")
# plot 2
plot(power_data$Voltage ~ power_data$datetime,
     ylab = "Voltage",
     xlab = "datetime",
     col = "black",
     type = "l")
#plot 3
with(power_data,
     plot(
         # setting x,y axe scale
         range(datetime),
         range(c(Sub_metering_1, Sub_metering_2, Sub_metering_1)),
         xlab = "",
         ylab="Energy sub metering", # add titles to the axes
         type="n")
)
# draw the Sub_metering_(1,2,3) lines
lines(power_data$datetime, power_data$Sub_metering_1, col="black")
lines(power_data$datetime, power_data$Sub_metering_2, col="red")
lines(power_data$datetime, power_data$Sub_metering_3, col="blue")
# add the legend without box around it
legend("topright", lty = c(1,1,1), bty = "n", col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# plot 4
plot(power_data$Global_reactive_power ~ power_data$datetime,
     ylab = "Global_reactive_power",
     xlab = "datetime",
     col = "black",
     type = "l")
dev.off()
