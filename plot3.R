#please set your current working directory to the script file location

# this will load household_power_consumption data
# provides power_data dataframe
source('./loaddata.R')

png(file = "./plots/plot3.png", width = 480, height = 480, units = "px")
# prepare the plot
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
# add the legend
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
