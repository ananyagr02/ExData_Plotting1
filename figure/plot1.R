# Install sqldf if you haven't already
install.packages("sqldf")
library(sqldf)
# Load data, treating "?" as NA
file_path <- "C:/Users/hp/Downloads/household_power_consumption.txt"  # Adjust to your actual file path
data <- read.table(file_path, sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

# Convert the Date column to Date format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset the data for the required dates
data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

# Remove rows with any NA values
data <- na.omit(data)

# Combine Date and Time columns to create a Datetime column
data$Datetime <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

png("plot1.png", width=480, height=480)
hist(data$Global_active_power, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()
