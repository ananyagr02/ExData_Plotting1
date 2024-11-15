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
png("plot2.png", width=480, height=480)
plot(data$Datetime, data$Global_active_power, type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)", 
     main="")
dev.off()