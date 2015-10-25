Getting and Cleaning Data Course Project Code Book

This describes the variables, data and the transformations that I performed to clean up the data.
The original data for this project is obtained from:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The data for this project is obtained from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The initial steps include, downloading the data from the above URL, save and UNZIP the file
For this exercise, my working directory is set to 
"C:/Coursera/cleaningdata/UCI HAR Dataset"
Variables:
Subject: The ID for the person who performed this activity
Activity: The nature of the activity that the subject was performing
Domain: Time or Frequency
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
The following estimates are also stored:
gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

Transformation steps:
The run_analysis.R has the following steps incorporated into that:
1. Read Training Data set & Test Data Set and merge them into one data set
2. Read Training subject data and Test Subject data and merge them into one data set
3. Read Training Label data and test label data and merge them into one data set
4. Extract only mean and SD for each measurement.  This is achieved by doing the following steps:
      1.The features.txt has the details about the measurements for mean & SD
      2. Subset this from the merged_data
      3. Remove unwanted punctuations
5. Change descriptive activity name to activities
6. Label the Data Set with descriptive activity names
7. Create an independent tidy data set with average of each variable for each activity and each subject
8. Write that into seperate file called "tidy_data.txt"

