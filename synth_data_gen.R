
# Synthetic Data Gen

# setting seed
set.seed(1234)

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

# house structure:
house_type <- c("permanent", "traditional", "traditional", "permanent",
                "permanent", "traditional", "permanent", "traditional",
                "traditional", "traditional", "permanent", "traditional",
                "traditional", "traditional", "traditional")


# needs re-assement date
date <- sample(seq.Date(as.Date("2024-12-01"), as.Date("2024-12-31"), by = "day"), 15)

# primary hazards
hazard <- c(rep("flooding", n))

# secondary hazard effects
secondary_effects <- c("Malaria", "Cholera", "Livestock diseases", "Malaria",
                       "Malaria", "Cholera", "Cholera", "Malaria", "Cholera",
                       "Livestock diseases", "Cholera", "Malaria", "Malaria",
                       "Malaria", "Cholera")

# Amounts received
Jan <- c(trunc(runif(15, min = 400, max = 1200)))
Feb <- c(trunc(runif(15, min = 400, max = 1200)))
March <- c(trunc(runif(15, min = 400, max = 1200)))
April <- c(trunc(runif(15, min = 400, max = 1200)))
May <- c(trunc(runif(15, min = 400, max = 1200)))
June <-  c(trunc(runif(15, min = 400, max = 1200)))
July <- c(trunc(runif(15, min = 400, max = 1200)))
August <- c(trunc(runif(15, min = 400, max = 1200)))
Sept <- c(trunc(runif(15, min = 400, max = 1200)))
Oct <-  c(trunc(runif(15, min = 400, max = 1200)))
Nov <-  c(trunc(runif(15, min = 400, max = 1200)))

image_names <- c("Brian.jpeg", "Mary.jpeg", "Mathew.jpeg", "Maria.jpeg", 
                 "Susan.jpeg", "Trudy.jpeg", "Jayden.jpeg",
                 "Grace.jpeg","Audrey.jpeg","Yvonne.jpeg", "Bella.jpeg", 
                 "Abigael.jpeg", "Jessica.jpeg", "Steven.jpeg", 
                 "Michael.jpeg")

#synthetic_data <- cbind(first_name, children, age, cattle, illness)

#synthetic_data <- cbind(synthetic_data, phone_numbers)



#synthetic_data <- cbind(synthetic_data,image_names)

synthetic_data <- data.frame(first_name, children, age, cattle, illness,
                        phone_numbers, image_names, house_type,
                        date, hazard, secondary_effects, Jan, Feb,
                        March, April, May, June, July, August, Sept,
                        Oct, Nov)



write.csv(synthetic_data, file = "/Users/masinde/Projects/cash_based_assistance/data/synthetic_data.csv")
