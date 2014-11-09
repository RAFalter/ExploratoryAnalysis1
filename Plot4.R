# Load household power consumption data, defining semi-colon as separator and ? as NA
# Change date to format specified by assignment instructions.
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset data to include only 2007-02-01 and 2007-02-02
data_subset <- subset(data, Date <= "2007-02-02" & Date >= "2007-02-01")

# Construct a combined date/time column and append it to data_subset
newdate <- paste(as.Date(data_subset$Date), data_subset$Time)
data_subset$newdate <- as.POSIXct(newdate)

#Set parameters and construct Plots 1,2,3 and 4
par(mfrow=c(2,2), mar=c(4,4,1,1), oma=c(0,0,2,0))
with(data_subset, {
  plot(Global_active_power~newdate, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~newdate, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~newdate, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~newdate,col='Red')
  lines(Sub_metering_3~newdate,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~newdate, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

# Save plots as .PNG file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
