---
title: "ReadMe"
author: "Thomas Miebach"
date: "December 20, 2017"
output: html_document
---

# Background
Coursera Data Science Specialization
Course 3 - Getting and Cleaning Data
Week 4: Course Project
Thomas Miebach

# Assignment
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

The detailed project instructions can be found at https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project

The project requirement is to submit through a GitHub repository: 
1. a tidy data set generate through the r code described below
2. the r code in a file called "run_analysis.R"
3. a code book that describes the variables, the data, and any transformations or work performed to clean up the data called "CodeBook.md" 
4. This file called "README.md", explaining how all of the scripts work and how they are connected

# Data source
-- One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

-- Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

-- The data needs to be unzipped, after which a directory is created called "UCI HAR Dataset". Change the working directory to the directory containing this directory before running the r script. Alternatively a setwd() command can be included in the r script.

# R code
-- This section describes in general the structure of the r code provided in the file "run_analysis.R". Some of these comments are included with the r-code itself and additional information can be found in the Codebook for the resulting "data_tidy.txt" file, especially more detailed explanation regarding the output variables and names.

1. Setup of environment
--* The code makes use of the dplyr library, which is loaded at the beginning of the script
--* The working directory should contain the raw data in the directory "UCI HAR Dataset" as extracted. Alternatively a setwd() command can be included in the r script.

2. Read and combine data into one dataset
--1. Informational data files (metadata?) - The text files "activity labels" and "features" are read in using read.table() and assigned to data objects. 
--* The activity lables will be used as is to de-code the activity for the observations. 

3. Appropriately label the data set with descriptive variable names
--* The features data will be used to name the columns for the observations. It contains characters invalid in columns names ("-", "()" and ",") which will be replaced with ("_", "fct" and "."), respectively. this will, e.g. turn "mean()" or "std()" in the name into "mean_fct" and "std_fct". For additional information on the resulting columns names see the Codebook
--2. Training and test data files (X-, Y, and subject-, for each) are read in and assigned to data objects
--3. Training and test data is combined individually first using the cbind() function and then combined using the rbind() function

4. Extract only measurements on the mean and standard deviation for each measurement   
--* Columns meeting these critera were selected using the grep() function matching mean_fct and std_fct
--* It was decided not to include any angle variables (e.g. angle(tBodyAccMean,gravity)) as they are calculated from variables that are means, but do not represent mean values calulatd using the mean() function.
--* A new data set "data_select" is generated using the selec() function

5. Use descriptive activity names 
--* Coded activity data is replaced by actual activity names using the factor() function

6. Generate tidy data set and write to file
--* Using the group_by function the data is grouped by subject and activity
--* Uhe data is summarized generating the mean for each subject/group combination using the summarize_all() function
--* The data is written to a text file "data_tify.txt"" using the write.table() function

# Codebook
The codebook describes the variables, the data, and transformations or work performed to clean up the data. It can be found in the file called "CodeBook.md" 
