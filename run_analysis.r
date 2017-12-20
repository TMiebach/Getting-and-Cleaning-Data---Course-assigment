# Data Science Specialization
# Course 3 - Getting and Cleaning Data
# Week 4 Course Project
# Thomas Miebach

## Libraries used in this code
  library(dplyr)

## Working directory - location of 'UCI HAR Dataset' directory
  setwd("C:/Users/Thomas Miebach/datasciencecoursera/Data Cleaning/Week 4/Course Project")
  ## Pre-set your working directory or enter your own path above and un-comment

##  Read and clean individual data files

    ## Read informational data files: activity labels, features
      activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("activity_code", "activity_name"))
      features <- read.table("./UCI HAR Dataset/features.txt", col.names = c("data_column_number", "data_column_code"))
      ## Clean up character strings to obtain more descriptive data column names, esp.
      ## reaplace invalid characters ("-", "()" and ",") with ("_", "fct" and "."), respectively
      ## e.g. turns "mean()" or "std()" into "mean_fct" and "std_fct"
        features$data_column_code <- gsub("-", "_", features$data_column_code)
        features$data_column_code <- gsub("\\()", "_fct", features$data_column_code)
        features$data_column_code <- gsub(",", ".", features$data_column_code)

      ## Read all training files: X training data, Y training data, subject training data
      X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features$data_column_code)
      y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "activity_code")
      subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "subject_code")

    ## Combine data from three training files
    data_train <- cbind(subject_train, y_train, X_train)
  
    ## Read all test files: X test data, Y test data, subject test data
      X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features$data_column_code)
      y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "activity_code")
      subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "subject_code")
    
    ## Combine data from three test files
      data_test <- cbind(subject_test, y_test, X_test)
    
##  Combine test and training data sets
    data_all <- rbind(data_train, data_test)
    
  ## extract only mean_fct and std_fct data
    select_columns <- grep("mean_fct|std_fct", features$data_column_code, value = TRUE)
    data_select <- select(data_all, subject_code, activity_code, select_columns)

  ## replace activity codes with descriptive activity labels
    data_select$activity_code <- factor(data_select$activity_code, activity_labels$activity_code, labels = activity_labels$activity_name)
  ## designate subject code as factor
    data_select$subject_code <- factor(data_select$subject_code)
  ## group and summarize means by the two factors: subject code and activity
    data_grouped <- group_by(data_select, subject_code, activity_code)
    data_tidy <- summarize_all(data_grouped, mean)

## Write data to text file
    write.table(data_tidy, file = "data_tidy.txt", row.names = FALSE)

## End