unzip("exdata_data_household_power_consumption.zip")
library(data.table)
consumption<-read.table("household_power_consumption.txt", sep = ";", 
                        dec = ".", na.strings ="?", header = TRUE) %>% 
  filter(Date == "1/2/2007" | Date == "2/2/2007")

consumption$time_axis<-as.POSIXct(paste(consumption$Date,consumption$Time), 
                                  format="%d/%m/%Y %H:%M:%S")
par(mfrow=c(2,2), mar=c(4,4,1,1))

with(consumption, plot(time_axis, Global_active_power, type="l", 
                       xlab = "", ylab = "Global Active Power"))

with(consumption, plot(time_axis, Voltage, type="l", 
                       xlab = "datetime", ylab = "Voltage"))

with(consumption, plot(time_axis, Sub_metering_1, type="l", 
                       ylab = "Energy sub meeting", xlab=""))
lines(consumption$time_axis, consumption$Sub_metering_2, col ="red")
lines(consumption$time_axis, consumption$Sub_metering_3, col ="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty=c(1,1), bty="n", cex=0.8)


with(consumption, plot(time_axis, Global_reactive_power, type="l", 
                       xlab = "datetime", ylab = "Global_reactive_power"))

dev.copy(png, file="plot4.png")
dev.off()

