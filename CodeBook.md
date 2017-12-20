---
title: "CodeBook"
author: "Thomas Miebach"
date: "December 20, 2017"
output: html_document
---

# Background
Coursera Data Science Specialization

Course 3 - Getting and Cleaning Data

Week 4: Course Project

Thomas Miebach

# Purpose
This Codebook provides information on the data in the data file "data_tidy", resulting as output from running the r-code "run_analysis.R". Please refer also to the ReadMe file and the r-code itself for additional information. 

Helpfull information about the original data set can be found in the "features_info.txt" file provided with the data set provided here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# Description

## General overview
* The dataset stored in "data_tidy.txt" contains 180 observation for two variables:  subject_code (30 levels) and activity_code (6 levels). 

* The subject code represents a numerical value for each of 30 study participants

* The activity code represents six activities performed by each subject: LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, and WALKING_UPSTAIRS

* For each combination of subject and participant the mean and standard deviation of a series of accelerator and gyroscope data is given, resulting in a total of 66 features for the total of 180 observations (30 people x 6 activities)  

A full description of the orignal study can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Feature Selection 
The features selected for this dataset come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ

tGravityAcc-XYZ

tBodyAccJerk-XYZ

tBodyGyro-XYZ

tBodyGyroJerk-XYZ

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag

fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyGyro-XYZ

fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value

std(): Standard deviation

From the total of 10299 observation contained in the original data set, the mean of the data for each combination of subject and activity was calculated and saved in the tidy dataset

## Variable Naming
The variable naming of the original data set was largely preserved with the following notable modifications:

* Features are named as described above, e.g. tBodyAcc is the accelrator signal for the body movement in the temporal domain
* Function performed on the data are the next part of the data name. The "mean()" and "std()" description used in the orignal data set were translated into "main_fct" and "std_fct" as "(" or ")" are not valid symbols in column names.
* The last part of the name respresents the coordinate (-X, -Y  or -Z) if applicable
* Dashes "-" used in the orignal dataset were replace with underscores "_"
* As an illustrative example, the orignal feature name "tGravityAcc-mean()-X" was converts to "tGravityAcc_mean_fct_X"
