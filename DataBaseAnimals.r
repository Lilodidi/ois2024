# Install and load necessary packages
install.packages("ggplot2")
install.packages("dplyr")
install.packages("patchwork")

library(ggplot2)
library(dplyr)
library(patchwork)

# Create a synthetic dataset
set.seed(123)
animal_data <- data.frame(
  species = rep(c("Elephant", "Tiger", "Rabbit", "Human"), each = 50),
  body_weight = c(rnorm(50, mean = 5400, sd = 100),  # Elephant
                  rnorm(50, mean = 220, sd = 20),    # Tiger
                  rnorm(50, mean = 2, sd = 0.5),     # Rabbit
                  rnorm(50, mean = 70, sd = 10)),    # Human
  lifespan = c(rnorm(50, mean = 70, sd = 5),         # Elephant
               rnorm(50, mean = 15, sd = 2),         # Tiger
               rnorm(50, mean = 10, sd = 1),         # Rabbit
               rnorm(50, mean = 79, sd = 5)),        # Human
  diet_type = rep(c("Herbivore", "Carnivore", "Herbivore", "Omnivore"), each = 50)
)

head(animal_data)

# Create individual plots

# Scatter Plot of Body Weight vs. Lifespan
scatter_plot <- ggplot(animal_data, aes(x = body_weight, y = lifespan, color = diet_type)) +
  geom_point(size = 3, alpha = 0.7) +
  labs(title = "Scatter Plot of Body Weight vs. Lifespan", x = "Body Weight (kg)", y = "Lifespan (years)") +
  theme_minimal()

# Box Plot of Lifespan by Diet Type
box_plot <- ggplot(animal_data, aes(x = diet_type, y = lifespan, fill = diet_type)) +
  geom_boxplot(alpha = 0.7) +
  labs(title = "Box Plot of Lifespan by Diet Type", x = "Diet Type", y = "Lifespan (years)") +
  theme_minimal()

# Bar Plot of Average Body Weight by Species
bar_plot <- animal_data %>%
  group_by(species) %>%
  summarize(avg_body_weight = mean(body_weight)) %>%
  ggplot(aes(x = reorder(species, avg_body_weight), y = avg_body_weight, fill = species)) +
  geom_bar(stat = "identity", alpha = 0.7) +
  labs(title = "Bar Plot of Average Body Weight by Species", x = "Species", y = "Average Body Weight (kg)") +
  theme_minimal() +
  coord_flip()

# Combine the plots using patchwork
combined_plot <- scatter_plot / (box_plot | bar_plot)

# Display the combined plot
print(combined_plot)