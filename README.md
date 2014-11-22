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
script that contains all codes necessary to generate a tidy data set with the average of each variable for each activity and each subject. These steps are incorporated: 

    - Folder is created (optional)
    
    - Zip file is downloaded and decompressed (optional) 

    - Training and test data sets are combined (separately for activity, subject, and feature data)
    
    - Appropriate variable names are inserted
    
    - Measurements on mean and standard deviation are selected
    
    - Activity, subject and feature data are combined
    
    - Descriptive activity names are added
    
    - Combined data is melted and tidy data is generated
    

***


#####*Usage*

The **run_analysis.R** script has been optimized for Windows 7 Professional, R version 3.1.2, and RStudio Version 0.98.1087; the *reshape2* package is required. The download and decompression steps are optional and will be skipped if the *UCI HAR Dataset* has already been saved on your computer (located in your working directory in a folder named *data2*; the script assumes that you did not change any of the original files and folders).  

***





