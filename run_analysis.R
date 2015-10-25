#This script created a tidy data set after following the below steps
#Assumption is the data is already downloaded and available
#Step 1:  Get all the data and merge
#Read Training Data set & Test Data Set and merge them into one data set
training_data <- read.table("./train/X_train.txt")
test_data <- read.table("./test/X_test.txt")
merged_data <- rbind(training_data,test_data)
#Read Training subject data and Test Subject data and merge them into one data set
train_subject_data <- read.table("./train/subject_train.txt")
test_subject_data <- read.table ("./test/subject_test.txt")
merged_subject_data <- rbind(train_subject_data,test_subject_data)
#Read Training Label data and test label data and merge them into one data set
train_label_data <- read.table("./train/y_train.txt")
test_label_data <- read.table("./test/y_test.txt")
merged_label_data <- rbind(train_label_data,test_label_data)
#Step 2:Extact only mean and SD for each measurement
#The features.txt has the details about the measurements for mean & SD
features_data <- read.table("features.txt")
features_meanStd_data <- grep("mean\\(\\)|std\\(\\)", features_data[, 2])
#Subset this from the merged_data
subset_merged_data <- merged_data [, features_meanStd_data]
#Remove unwanted punctuations
names(subset_merged_data) <- gsub("\\(\\)", "", features_data[features_meanStd_data, 2]) 
names(subset_merged_data) <- gsub("-", "", names(subset_merged_data))
#Change descriptive activity Name to name the activities
activity_data <- read.table("activity_labels.txt")
activity_label_data <- activity_data[merged_label_data[, 1], 2]
merged_label_data[,1] <- activity_label_data
names(merged_label_data) <- "Activity"
#Lable the Data Set with descriptive activity names
names(merged_subject_data) <- "Subject"
clean_data <- cbind(merged_subject_data,merged_label_data,subset_merged_data)
write.table(clean_data,"clean_data.txt")
#Create an independent tidy data set with average of each variable for each activity and each subject

subject_length <- length(table(merged_subject_data)) 
activity_length <- dim(merged_label_data)[1]
column_length <- dim(clean_data)[2]
result_data <- matrix(NA, nrow=subject_length*activity_length, ncol=column_length) 
result_data <- as.data.frame(result_data)
print("error n dataframe")
colnames(result_data) <- colnames(clean_data)
row <- 1
for(i in 1:subject_length) {
  for(j in 1:activity_length) {
    result_data[row, 1] <- sort(unique(subset_merged_data)[, 1])[i]
    result_data[row, 2] <- merged_label_data[j, 2]
    bool1 <- i == clean_data$Subject
    bool2 <- merged_label_data[j, 2] == clean_data$Activity
    result_data[row, 3:column_length] <- colMeans(clean_data[bool1&bool2, 3:column_length])
    row <- row + 1
  }
  print("error in loop")
}

#write.table(result_data, "tidy_data.txt")



