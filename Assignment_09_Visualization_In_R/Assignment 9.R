# Michael Phommavong
# Visualization in R – Base Graphics, Lattice, and ggplot2

# Compare three visualization systems in R: base graphics, lattice, and ggplot2.
# Apply each system to the same dataset and observe similarities and differences.
# Develop clear, reproducible code and articulate your insights.

# Load Libraries
library(lattice)
library(ggplot2)

# Load Dataset
data(iris)
head(iris)

# 1. Base R Graphics
# Create at least two plots using base R functions
# Scatter  plot
plot(
  iris$Petal.Length,
  iris$Petal.Width,
  col = as.numeric(iris$Species),
  pch = 19,
  xlab = "Petal Length (cm)",
  ylab = "Petal Width (cm)",
  main = "Iris Petal Length vs Width"
)

legend("topleft",
       legend = levels(iris$Species),
       col = 1:3,
       pch = 19)

# Histogram of Sepal Length
hist(
  iris$Sepal.Length,
  col = "lightblue",
  main = "Distribution of Sepal Length",
  xlab = "Sepal Length (cm)",
  border = "white"
)


# 2. Lattice Graphics
# Use the lattice package to produce conditioned or multivariate plots
xyplot(Petal.Width ~ Petal.Length | Species, 
       data = iris,
       layout = c(3, 1),            # 3 panels side by side
       pch = 19,                    # solid points
       col = "steelblue",
       main = "Petal Length vs Width by Species",
       xlab = "Petal Length (cm)",
       ylab = "Petal Width (cm)")


# 3. ggplot2
# Use ggplot2’s grammar of graphics to create layered visuals
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, color = Species)) +
  geom_point(size = 3, alpha = 0.8) +           # layer 1: scatter points
  geom_smooth(method = "lm", se = FALSE, lwd = 1.2) +  # layer 2: regression line
  labs(
    title = "Petal Length vs Width by Species",
    x = "Petal Length (cm)",
    y = "Petal Width (cm)"
  ) +
  theme_minimal()
