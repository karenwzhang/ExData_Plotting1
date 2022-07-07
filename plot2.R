unzip("exdata_data_household_power_consumption.zip")
library(data.table)
consumption<-read.table("household_power_consumption.txt", sep = ";", 
                        dec = ".", na.strings ="?", header = TRUE) %>% 
  filter(Date == "1/2/2007" | Date == "2/2/2007")
 
consumption$time_axis<-as.POSIXct(paste(consumption$Date,consumption$Time), 
                      format="%d/%m/%Y %H:%M:%S")

plot(x = consumption$time_axis, y = consumption$Global_active_power, type="l", 
     xlab = "", ylab = "Global Active Power(kilowatts)")
dev.copy(png, file="plot2.png")
dev.off()

