# Getting and Cleaning Data
## Course Project
### MVB1

# Start course project
dateStarted <- date()
dateStarted
## Once this project is completed you have:
## A) Merged the training and test sets to create one data set 
## B) Extracted measurements on mean and standard deviation for each measurement
## C) Used descriptive activity names to name activities in the data set
## D) Labeled the data set with descriptive variable names
## E) Created a tidy data set with the average of each variable for each activity and each subject
## Importantly, the reshape2 package is required
## This script has been optimized for Windows 7 Professional, R version 3.1.2, and RStudio Version 0.98.1087

# 1) Get data
## Create folder for data (if that folder does not exist yet)
if(!file.exists("./data2")){dir.create("./data2")}

## Download zip file
## Please skip if you already downloaded zip file
Download <- function () {
  message("Downloading zip file")
  fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl, destfile="./data2/Course_Project.zip")
  message("Download completed")
}
Download()
dateDownloaded <- date()
dateDownloaded

## Unzip file
## Please skip if you already decompressed the zip file
Unzip <- function () {
  message("Decompressing files")
  message("This may take a few minutes")
  unzip(zipfile="./data2/Course_Project.zip", exdir="./data2")
  message("Decompression completed") 
}
Unzip()

## Read train data
TrainActivity <- read.table("./data2/UCI HAR Dataset/train/y_train.txt", header=FALSE)
TrainSubject <- read.table("./data2/UCI HAR Dataset/train/subject_train.txt", header=FALSE)
TrainFeature <- read.table("./data2/UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)

## Read test data
TestActivity <- read.table("./data2/UCI HAR Dataset/test/y_test.txt", header=FALSE)
TestSubject <- read.table("./data2/UCI HAR Dataset/test/subject_test.txt", header=FALSE)
TestFeature <- read.table("./data2/UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)

# 2) Clean data
## Combine train and test data
Activity <- rbind(TrainActivity, TestActivity)
str(Activity)
Subject <- rbind(TrainSubject, TestSubject)
str(Subject)
Feature <- rbind(TrainFeature, TestFeature)
str(Feature, list.len=10)

## Add appropriate variable names to activity and subject data
names(Activity) <- c("activity")
str(Activity)
names(Subject) <- c("subject")
str(Subject)

## Obtain variable names for feature data
## Select variables with information on mean and standard deviation
FeatureNames <- read.table("./data2/UCI HAR Dataset/features.txt", sep="", header=FALSE)
FeatureNamesChar <- as.character(FeatureNames[,2])
Selection <- as.numeric(grep("mean\\(|std", FeatureNamesChar))
FeatureNamesChar <- FeatureNamesChar[Selection]

## Extract measurements on mean and standard deviation from feature data
Feature <- Feature[,Selection]

## Add appropriate variable names to feature data
## Names should be descriptive and preferrably lower cases; remove duplicates, dashes and brackets 
FeatureNamesChar <- gsub("^t", "time", FeatureNamesChar)
FeatureNamesChar <- gsub("Acc", "accelerometer", FeatureNamesChar)
FeatureNamesChar <- gsub("std", "standarddeviation", FeatureNamesChar)
FeatureNamesChar <- gsub("Jerk", "jerksignal", FeatureNamesChar)
FeatureNamesChar <- gsub("Gyro", "gyroscope", FeatureNamesChar)
FeatureNamesChar <- gsub("Mag", "magnitude", FeatureNamesChar)
FeatureNamesChar <- gsub("^f", "frequency", FeatureNamesChar)
FeatureNamesChar <- gsub("BodyBody", "body", FeatureNamesChar)
FeatureNamesChar <- gsub("-", "", FeatureNamesChar)
FeatureNamesChar <- gsub("\\()", "", FeatureNamesChar)
FeatureNamesChar <- tolower(FeatureNamesChar)
names(Feature) <- FeatureNamesChar
str(Feature, list.len=10)

## Combine activity, subject, and feature data
ActivitySubject <- cbind(Activity, Subject)
ActivitySubjectFeature <- cbind(ActivitySubject, Feature)
str(ActivitySubjectFeature, list.len=10)

## Add descriptive activity names
## Use lower cases and remove underscores 
ActivityLabels <- read.table("./data2/UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)
ActivitySubjectFeature$activity <- ActivityLabels[ActivitySubjectFeature$activity, 2]
ActivitySubjectFeature$activity <- tolower(ActivitySubjectFeature$activity)
ActivitySubjectFeature$activity <- gsub("_", "", ActivitySubjectFeature$activity)
str(ActivitySubjectFeature, list.len=10)

## Generate tidy data
library(reshape2)
MeltedData <- melt(ActivitySubjectFeature, id=c("activity", "subject"))
MeltedData <- MeltedData[order(MeltedData$subject, MeltedData$activity),]
str(MeltedData)
TidyCourseProject <- dcast(MeltedData, activity+subject~variable, mean)
str(TidyCourseProject, list.len=10)

## Save table that contains tidy data
write.table(TidyCourseProject, "./data2/UCI HAR Dataset/TidyCourseProject.txt", row.name=FALSE)

## Course project completed
dateCompleted <- date()
dateCompleted
