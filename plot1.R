unzip("exdata_data_household_power_consumption.zip")
library(dplyr)
data<-read.table("household_power_consumption.txt", sep = ";", 
                        dec = ".", na.strings ="?", header = TRUE) %>% 
             filter(Date == "1/2/2007" | Date == "2/2/2007")
hist(data$Global_active_power, col="red", 
     xlab = "Global Active Power(kilowatts)", main = "Global Active Power")
dev.copy(png, file="plot1.png")
dev.off()

