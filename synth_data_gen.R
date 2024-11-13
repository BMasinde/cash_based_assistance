
# Synthetic Data Gen

# Number of observations
n <- 15 

# gender
gender <- sample(c("Male", "Female"), size = n, replace = TRUE, prob = c(0.45, 0.55))

# generate phone numbers
# format (+999 721 xxx 600)

last_3_dgts <- replicate(n, paste0(sample(0:9, 3, replace = TRUE), collapse = ""))

phone_numbers <- paste0("+999 721 xxx ", last_3_dgts)


# gen first names
first_name <- c("Brian", "Mary", "Mathew", "Maria","Susan", "Trudy", "Jayden",
                "Grace","Audrey","Yvonne", "Bella", "Abigael", "Jessica",
                "Steven", "Michael")

# number of children
children <- sample(0:7, size = n, replace = TRUE)

# Age of applicant
age <- sample(18:80, size = n, replace = TRUE)

# number of cattle
cattle <- sample(0:40, size = n, replace = TRUE)

# chronic illness?
illness <- sample(c("Yes", "No"), size = n, replace = TRUE, prob = c(0.15, 0.85))

synthetic_data <- cbind(first_name, children, age, cattle, illness)

synthetic_data <- cbind(synthetic_data, phone_numbers)

image_names <- c("Brian.jpeg", "Mary.jpeg", "Mathew.jpeg", "Maria.jpeg", 
                 "Susan.jpeg", "Trudy.jpeg", "Jayden.jpeg",
                 "Grace.jpeg","Audrey.jpeg","Yvonne.jpeg", "Bella.jpeg", 
                 "Abigael.jpeg", "Jessica.jpeg", "Steven.jpeg", 
                 "Michael.jpeg")

synthetic_data <- cbind(synthetic_data,image_names)

write.csv(synthetic_data, file = "/Users/masinde/Projects/cash_based_assistance/data/synthetic_data.csv")
