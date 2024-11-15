# Install required packages if not installed
if (!require("png")) install.packages("png", dependencies = TRUE)
if (!require("grid")) install.packages("grid", dependencies = TRUE)
if (!require("gridExtra")) install.packages("gridExtra", dependencies = TRUE)

# Load the libraries
library(png)
library(grid)
library(gridExtra)

# Read each plot image into a rasterGrob object
plot1 <- rasterGrob(readPNG("plot11.png"), interpolate = TRUE)
plot2 <- rasterGrob(readPNG("plot22.png"), interpolate = TRUE)
plot3 <- rasterGrob(readPNG("plot33.png"), interpolate = TRUE)
plot4 <- rasterGrob(readPNG("plot44.png"), interpolate = TRUE)

# Create a new PNG file for the combined plot
png("plot4334.png", width = 960, height = 960)

# Arrange the plots in a 2x2 grid
grid.arrange(plot1, plot2, plot3, plot4, ncol = 2)

# Close the graphics device
dev.off()
