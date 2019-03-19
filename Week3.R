#Vector containing column names
col_names <- c('Date', 'Country', 'Gender', 'Age', 'q1', 'q2', 'q3', 'q4', 'q5')

#Enter the data into vector before constructing the dataframe

date_col <- c('2018-15-10', '2018-11-01', '2018-21-10', '2018-28-10', '2018-01-05')
country_col <- c('US', 'US', 'IRL', 'IRL', 'IRL')
gender_col <- c('M', 'F', 'F', 'M', 'F')

#99 is a value in the age col that i will need to recode
age_col <- c(32, 45, 25, 39, 99)
q1_col <- c(5, 3, 3, 3, 2)
q2_col <- c(4, 5, 5, 3, 2)
q3_col <- c(5, 2, 5, 4, 1)
#NA is inserted in place of missing data
q4_col <- c(5, 5, 5, NA, 2)
q5_col <- c(5, 5, 2, NA, 1)

#Consruct dataframe using the data from all vectors above
managers <- data.frame(date_col, country_col, gender_col, 
                       age_col, q1_col, q2_col, q3_col, 
                       q4_col, q5_col)
managers
str(managers)
head(managers, 10)
colnames(managers) <- col_names
#managers$Age[managers$Age == 99] <- NA
attach(managers)

#Recode incorrect age to NA
managers$Age[Age == 99] <- NA

#Create a new attribute called Agecat and set values in AgeCat
# to the following if true
# if less than 25 then Agecat is young
# if greaterthan 26 and less than 44 then Agecat is Middle Aged
# if greaterthan 45 then Agecat is Elder

managers$AgeCat[Age >= 45] <- "Elder"
managers$AgeCat[Age <= 25] <- "Young"
managers$AgeCat[Age >= 26 & Age <= 44] <- "Middle Aged"
managers$AgeCat[is.na(Age)] <- "Elder"

#Create a new column called sumary_col
#that contains a summary of each row

summary_col <- c(managers$q1+ managers$q2+ managers$q3+ managers$q4+ managers$q5)
managers <- data.frame(managers, summary_col)

# Calculate mean value for each row
mean_col <- na.mean(summary_col, option='mean', na.rm = TRUE)
mean_col
managers <- cbind(managers, mean_col)
managers


