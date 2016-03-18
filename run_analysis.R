## The goal of this script is to prepare tidy data that can be used for later analysis
## Steps : 
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


library(data.table)

## read features and activities labels
feature_labels  <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

## storing needed columns (mean and standard deviation)
features_ext <- grepl("mean|std", t(feature_labels[2]), ignore.case=TRUE)

## read train related data and adding columns names
train_activities <- merge(read.table("UCI HAR Dataset/train/y_train.txt",       header = FALSE), activity_labels, by.x="V1", by.y="V1")
names(train_activities) = c("Activity_id", "Activity")
train_subjects   <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
names(train_subjects) = c("Subject")
train_features   <- fread("UCI HAR Dataset/train/X_train.txt",       header = FALSE)
names(train_features) <- t(feature_labels[2])

## subsetting train features to keep only needed columns (mean and standard deviation)
train_features <- train_features[,t(features_ext), with=FALSE]

## column-binding all training data together but taking out activity_id column
trainData <- as.data.table(cbind(train_subjects, train_activities[2], train_features))


## read test related data and adding columns names
test_activities <- merge(read.table("UCI HAR Dataset/test/y_test.txt",       header = FALSE), activity_labels, by.x="V1", by.y="V1")
names(test_activities) = c("Activity_id", "Activity")
test_subjects   <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
names(test_subjects) = c("Subject")
test_features   <- fread("UCI HAR Dataset/test/X_test.txt",       header = FALSE)
names(test_features) = t(feature_labels[2])

## subsetting test features to keep only needed columns (mean and standard deviation)
test_features <- test_features[,t(features_ext), with=FALSE]

## column-binding all test data together but taking out activity_id column
testData <- as.data.table(cbind(test_subjects, test_activities[2], test_features))

## appending training to test data
rawData <- rbind(testData, trainData)

## freeing memory: cleanup big temporary data.frames/data.tables
rm(testData, trainData, train_features, test_features)

## setting Activity and Subject as factors
rawData$Activity    <- factor(rawData$Activity)
rawData$Subject     <- factor(rawData$Subject)


## renaming columns names
names(rawData)<-gsub("()", "", names(rawData), fixed = TRUE)
names(rawData)<-gsub("^t", "Time", names(rawData))
names(rawData)<-gsub("^f", "Freq", names(rawData))
names(rawData)<-gsub("-mean", "Mean", names(rawData), ignore.case = TRUE)
names(rawData)<-gsub("-std", "Std", names(rawData), ignore.case = TRUE)
names(rawData)<-gsub("-freq", "Freq", names(rawData), ignore.case = TRUE)
names(rawData)<-gsub("Acc", "Acceleration", names(rawData))
names(rawData)<-gsub("Gyro", "AngularVelocity", names(rawData))
names(rawData)<-gsub("tBody", "TimeBody", names(rawData))
names(rawData)<-gsub("BodyBody", "Body", names(rawData))
names(rawData)<-gsub("^angle", "Angle", names(rawData))
names(rawData)<-gsub("gravity", "Gravity", names(rawData))

## aggregating data using the mean function
tidyData <- as.data.table(aggregate(. ~Activity + Subject, rawData, mean))

## sorting data by Activity and Subject
tidyData <- tidyData[order(Activity, Subject),]

## write the tidy data into a file
write.table(tidyData, file = "TidyData.txt", row.names = FALSE)
