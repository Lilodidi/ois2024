# Generate some sample data
x <- seq(-10, 10, by = 0.1)
y1 <- x^2
y2 <- sin(x)

# Create a plot with two lines
plot(x, y1, type = "l", col = "blue", lwd = 2, xlab = "X", ylab = "Y", main = "Plot of Functions")
lines(x, y2, col = "red", lwd = 2)

# Add a legend
legend("topright", legend = c("y = x^2", "y = sin(x)"), col = c("blue", "red"), lty = 1, lwd = 2)

# Add grid lines
grid()