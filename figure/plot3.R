library(sqldf)
# Load data, treating "?" as NA
file_path <- "C:/Users/hp/Downloads/household_power_consumption.txt"  # Adjust to your actual file path

data <- read.csv.sql(file_path, 
                     sql = "SELECT * FROM file WHERE Date IN ('1/2/2007', '2/2/2007')",
                     sep = ";", 
                     header = TRUE)

# Combine Date and Time columns to create a Datetime column
data$Datetime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Plotting
png("plot3.png", width=480, height=480)

# Plot Sub_metering_1
plot(data$Datetime, data$Sub_metering_1, type="l", col="black", 
     xlab="", ylab="Energy sub metering")

# Add Sub_metering_2 and Sub_metering_3
lines(data$Datetime, data$Sub_metering_2, col="red")
lines(data$Datetime, data$Sub_metering_3, col="blue")

# Add legend
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty = 1)

dev.off()