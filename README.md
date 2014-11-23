# Course Project README
## Getting and Cleaning Data
### MVB1
#### Saturday, November 22, 2014


***


#####*Introduction*

This repository is generated for the Getting and Cleaning Data Course Project. It focuses on the *Human Activity Recognition Using Smartphones Data Set (UCI HAR Dataset)*, which is available online (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and contains information on 30 volunteers whose linear acceleration and velocity were measured using a smartphone. 


***


#####*Files*

The following files are included in the repository (in addition to this **README.md** file):

* **CodeBook.md**: 
Code Book that provides a concise overview of the data and variables, and of the data cleaning steps. In brief, the *UCI HAR Dataset* consists of training (**Train Data**) and test data sets (**Test Data**), each containing data on specific activities (*Activity*), subjects (*Subject*), and features (*Feature*). Examples of data structures, before and after any adjustments, are shown in the Code Book.

* **run_analysis.R**:
script that contains all codes necessary to generate a tidy data set with the average of each variable for each activity and each subject. The most important steps are specified below (the **run_analysis.R** script contains more detailed information): 

    - Folder is created (optional)
        
    ```
    if(!file.exists("./data2")){dir.create("./data2")}
    ```
    
    - Zip file is downloaded and decompressed (optional) 
    
    ```
    Download <- function () {
    fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl, destfile="./data2/Course_Project.zip")
    }
    ```
    ```
    Unzip <- function () {
    unzip(zipfile="./data2/Course_Project.zip", exdir="./data2")
    }
    ```
    
    ```
    if(!file.exists("./data2/UCI HAR Dataset")){
    Download()
    dateDownloaded <- date()
    dateDownloaded
    Unzip()
    }
    ```
    
    - Training and test data sets are combined (separately for activity, subject, and feature data)
    
    ```
    Activity <- rbind(TrainActivity, TestActivity)
    Subject <- rbind(TrainSubject, TestSubject)
    Feature <- rbind(TrainFeature, TestFeature)
    ```
    
    - Appropriate variable names are inserted
    
    ```
    names(Activity) <- c("activity")
    names(Subject) <- c("subject")
    FeatureNames <- read.table("./data2/UCI HAR Dataset/features.txt", sep="", header=FALSE)
    FeatureNamesChar <- as.character(FeatureNames[,2])
    
    ```
    
    ```
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
    ```
    
    - Measurements on mean and standard deviation are selected
    
    ```
    Selection <- as.numeric(grep("mean\\(|std", FeatureNamesChar))
    FeatureNamesChar <- FeatureNamesChar[Selection]
    Feature <- Feature[,Selection]
    ```
    
    - Activity, subject and feature data are combined
    
    ```
    ActivitySubject <- cbind(Activity, Subject)
    ActivitySubjectFeature <- cbind(ActivitySubject, Feature)
    ```
    
    - Descriptive activity names are added
    
    ```
    ActivityLabels <- read.table("./data2/UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)
    ActivitySubjectFeature$activity <- ActivityLabels[ActivitySubjectFeature$activity, 2]
    ActivitySubjectFeature$activity <- tolower(ActivitySubjectFeature$activity)
    ActivitySubjectFeature$activity <- gsub("_", "", ActivitySubjectFeature$activity)
    ```
    
    - Combined data is melted and tidy data is generated
    
    ```
    MeltedData <- melt(ActivitySubjectFeature, id=c("activity", "subject"))
    MeltedData <- MeltedData[order(MeltedData$subject, MeltedData$activity),]
    TidyCourseProject <- dcast(MeltedData, activity+subject~variable, mean)
    ```
    

***


#####*Usage*

The **run_analysis.R** script has been optimized for Windows 7 Professional, R version 3.1.2, and RStudio Version 0.98.1087; the *reshape2* package is required. The download and decompression steps are optional and will be skipped if the *UCI HAR Dataset* has already been saved on your computer (located in your working directory in a folder named *data2*; the script assumes that you did not change any of the original files and folders).  

***





