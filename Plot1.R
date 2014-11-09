# Load household power consumption data, defining semi-colon as separator and ? as NA
# Change date to format specified by assignment instructions.
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset data to include only 2007-02-01 and 2007-02-02
data_subset <- subset(data, Date <= "2007-02-02" & Date >= "2007-02-01")

# Construct histogram of Global Active Power
hist(data_subset$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency", col="Red")

# Save histogram as .PNG file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
