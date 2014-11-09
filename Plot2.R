# Load household power consumption data, defining semi-colon as separator and ? as NA
# Change date to format specified by assignment instructions.
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset data to include only 2007-02-01 and 2007-02-02
data_subset <- subset(data, Date <= "2007-02-02" & Date >= "2007-02-01")


# Construct a combined date/time column and append it to data_subset
newdate <- paste(as.Date(data_subset$Date), data_subset$Time)
data_subset$newdate <- as.POSIXct(newdate)

# Construct line plot of Global Active Power
plot(data_subset$Global_active_power~data_subset$newdate, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

# Save line plot as .PNG file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
