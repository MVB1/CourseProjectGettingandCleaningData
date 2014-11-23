# Course Project Code Book
## Getting and Cleaning Data
### MVB1
#### Saturday, November 22, 2014


***


#####*Instructions Course Project*

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a GitHub repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called **CodeBook.md**. You should also include a **README.md** in the repo with your scripts, which explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article: http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called **run_analysis.R** that does the following:

* Merges the training and the test sets to create one data set

* Extracts only the measurements on the mean and standard deviation for each measurement 

* Uses descriptive activity names to name the activities in the data set

* Appropriately labels the data set with descriptive variable names

* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject


***


#####*Data Set*

For this course project the *Human Activity Recognition Using Smartphones Data Set (UCI HAR Dataset)* is used, which is based on experimental data obtained from 30 volunteers. Each individual performed six activities (i.e. walking, walking upstairs, walking downstairs, sitting, standing, and laying). An accelerometer and gyroscope, embedded in a smartphone, allowed measurements of linear acceleration (in standard gravity units 'g') and velocity (in radians/second). 

The training data (**Train Data**) contains 70% of individuals and the test data (**Test Data**) the remaining 30% of individuals. This course project uses the activity labels, the identifiers of subjects who carried out the experiments, and a 561-feature vector with time and frequency domain variables. More detailed information regarding the training and test data is provided on the following website: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

Included in data set:

* README.txt: additional information on experiments, sensor signals, and files

* train folder: training data 
(**Train Data**)

    - y_train.txt: training labels (*Activity*)
    
    - subject_train.txt: rows identify subjects who participated (*Subject*)
 
    - X_train.txt: training set (*Feature*)
 
    - Inertial Signals folder: individual text files for signals (e.g. acceleration and velocity)
 
* test folder: test data
(**Test Data**)
 
    - y_test.txt: test labels (*Activity*)
    
    - subject_test.txt: rows identify subjects who participated (*Subject*)
 
    - X_test.txt: test set (*Feature*)
  
    - Inertial Signals folder: individual text files for signals (e.g. acceleration and velocity)

* activity_labels.txt: links class labels with activity names

* features.txt: list of features

* features_info.txt: provides information on feature variables


***

#####*Original Feature Variables*

As described in the feature_info.txt file: 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ

* tGravityAcc-XYZ

* tBodyAccJerk-XYZ

* tBodyGyro-XYZ

* tBodyGyroJerk-XYZ

* tBodyAccMag

* tGravityAccMag

* tBodyAccJerkMag

* tBodyGyroMag

* tBodyGyroJerkMag

* fBodyAcc-XYZ

* fBodyAccJerk-XYZ

* fBodyGyro-XYZ

* fBodyAccMag

* fBodyAccJerkMag

* fBodyGyroMag

* fBodyGyroJerkMag


The set of variables that were estimated from these signals are: 

* mean(): Mean value

* std(): Standard deviation

* mad(): Median absolute deviation 

* max(): Largest value in array

* min(): Smallest value in array

* sma(): Signal magnitude area

* energy(): Energy measure. Sum of the squares divided by the number of values

* iqr(): Interquartile range 

* entropy(): Signal entropy

* arCoeff(): Autorregresion coefficients with Burg order equal to 4

* correlation(): Correlation coefficient between two signals

* maxInds(): Index of the frequency component with largest magnitude

* meanFreq(): Weighted average of the frequency components to obtain a mean frequency

* skewness(): Skewness of the frequency domain signal 

* kurtosis(): Kurtosis of the frequency domain signal 

* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window

* angle(): Angle between to vectors

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean

* tBodyAccMean

* tBodyAccJerkMean

* tBodyGyroMean

* tBodyGyroJerkMean


***


#####*Data Structure*

The data structures of the original training and test data are shown below. 

**Train Data**

* *Activity*
```
'data.frame':  7352 obs. of  1 variable:
 $ V1: int  5 5 5 5 5 5 5 5 5 5 ...
```

* *Subject*
```
'data.frame':  7352 obs. of  1 variable:
 $ V1: int  1 1 1 1 1 1 1 1 1 1 ...
```

* *Feature*
```
'data.frame':  7352 obs. of  561 variables:
 $ V1  : num  0.289 0.278 0.28 0.279 0.277 ...
 $ V2  : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ...
 $ V3  : num  -0.133 -0.124 -0.113 -0.123 -0.115 ...
 $ V4  : num  -0.995 -0.998 -0.995 -0.996 -0.998 ...
 $ V5  : num  -0.983 -0.975 -0.967 -0.983 -0.981 ...
 $ V6  : num  -0.914 -0.96 -0.979 -0.991 -0.99 ...
 $ V7  : num  -0.995 -0.999 -0.997 -0.997 -0.998 ...
 $ V8  : num  -0.983 -0.975 -0.964 -0.983 -0.98 ...
 $ V9  : num  -0.924 -0.958 -0.977 -0.989 -0.99 ...
 $ V10 : num  -0.935 -0.943 -0.939 -0.939 -0.942 ...
  [list output truncated]
```

**Test Data**

* *Activity*
```
'data.frame':  2947 obs. of  1 variable:
 $ V1: int  5 5 5 5 5 5 5 5 5 5 ...
```

* *Subject*
```
'data.frame':  2947 obs. of  1 variable:
 $ V1: int  2 2 2 2 2 2 2 2 2 2 ...
```

* *Feature*
```
'data.frame':  2947 obs. of  561 variables:
 $ V1  : num  0.257 0.286 0.275 0.27 0.275 ...
 $ V2  : num  -0.0233 -0.0132 -0.0261 -0.0326 -0.0278 ...
 $ V3  : num  -0.0147 -0.1191 -0.1182 -0.1175 -0.1295 ...
 $ V4  : num  -0.938 -0.975 -0.994 -0.995 -0.994 ...
 $ V5  : num  -0.92 -0.967 -0.97 -0.973 -0.967 ...
 $ V6  : num  -0.668 -0.945 -0.963 -0.967 -0.978 ...
 $ V7  : num  -0.953 -0.987 -0.994 -0.995 -0.994 ...
 $ V8  : num  -0.925 -0.968 -0.971 -0.974 -0.966 ...
 $ V9  : num  -0.674 -0.946 -0.963 -0.969 -0.977 ...
 $ V10 : num  -0.894 -0.894 -0.939 -0.939 -0.939 ...
  [list output truncated]
```


***


#####*Combined Train and Test Data*

The training and test data are combined.

* *Activity*
```
'data.frame':  10299 obs. of  1 variable:
 $ V1: int  5 5 5 5 5 5 5 5 5 5 ...
```

* *Subject*
```
'data.frame':  10299 obs. of  1 variable:
 $ V1: int  1 1 1 1 1 1 1 1 1 1 ...
```

* *Feature*
```
'data.frame':  10299 obs. of  561 variables:
 $ V1  : num  0.289 0.278 0.28 0.279 0.277 ...
 $ V2  : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ...
 $ V3  : num  -0.133 -0.124 -0.113 -0.123 -0.115 ...
 $ V4  : num  -0.995 -0.998 -0.995 -0.996 -0.998 ...
 $ V5  : num  -0.983 -0.975 -0.967 -0.983 -0.981 ...
 $ V6  : num  -0.914 -0.96 -0.979 -0.991 -0.99 ...
 $ V7  : num  -0.995 -0.999 -0.997 -0.997 -0.998 ...
 $ V8  : num  -0.983 -0.975 -0.964 -0.983 -0.98 ...
 $ V9  : num  -0.924 -0.958 -0.977 -0.989 -0.99 ...
 $ V10 : num  -0.935 -0.943 -0.939 -0.939 -0.942 ...
  [list output truncated]
```
 
***


#####*Original Variable Names*

Original variable names contain both upper and lower cases, as well as abbreviations, dashes, and brackets. Only variable names that contain information on mean and standard deviation are selected.

```
 [1] "tBodyAcc-mean()-X"           "tBodyAcc-mean()-Y"           "tBodyAcc-mean()-Z"           "tBodyAcc-std()-X"           
 [5] "tBodyAcc-std()-Y"            "tBodyAcc-std()-Z"            "tGravityAcc-mean()-X"        "tGravityAcc-mean()-Y"       
 [9] "tGravityAcc-mean()-Z"        "tGravityAcc-std()-X"         "tGravityAcc-std()-Y"         "tGravityAcc-std()-Z"        
[13] "tBodyAccJerk-mean()-X"       "tBodyAccJerk-mean()-Y"       "tBodyAccJerk-mean()-Z"       "tBodyAccJerk-std()-X"       
[17] "tBodyAccJerk-std()-Y"        "tBodyAccJerk-std()-Z"        "tBodyGyro-mean()-X"          "tBodyGyro-mean()-Y"         
[21] "tBodyGyro-mean()-Z"          "tBodyGyro-std()-X"           "tBodyGyro-std()-Y"           "tBodyGyro-std()-Z"          
[25] "tBodyGyroJerk-mean()-X"      "tBodyGyroJerk-mean()-Y"      "tBodyGyroJerk-mean()-Z"      "tBodyGyroJerk-std()-X"      
[29] "tBodyGyroJerk-std()-Y"       "tBodyGyroJerk-std()-Z"       "tBodyAccMag-mean()"          "tBodyAccMag-std()"          
[33] "tGravityAccMag-mean()"       "tGravityAccMag-std()"        "tBodyAccJerkMag-mean()"      "tBodyAccJerkMag-std()"      
[37] "tBodyGyroMag-mean()"         "tBodyGyroMag-std()"          "tBodyGyroJerkMag-mean()"     "tBodyGyroJerkMag-std()"     
[41] "fBodyAcc-mean()-X"           "fBodyAcc-mean()-Y"           "fBodyAcc-mean()-Z"           "fBodyAcc-std()-X"           
[45] "fBodyAcc-std()-Y"            "fBodyAcc-std()-Z"            "fBodyAccJerk-mean()-X"       "fBodyAccJerk-mean()-Y"      
[49] "fBodyAccJerk-mean()-Z"       "fBodyAccJerk-std()-X"        "fBodyAccJerk-std()-Y"        "fBodyAccJerk-std()-Z"       
[53] "fBodyGyro-mean()-X"          "fBodyGyro-mean()-Y"          "fBodyGyro-mean()-Z"          "fBodyGyro-std()-X"          
[57] "fBodyGyro-std()-Y"           "fBodyGyro-std()-Z"           "fBodyAccMag-mean()"          "fBodyAccMag-std()"          
[61] "fBodyBodyAccJerkMag-mean()"  "fBodyBodyAccJerkMag-std()"   "fBodyBodyGyroMag-mean()"     "fBodyBodyGyroMag-std()"     
[65] "fBodyBodyGyroJerkMag-mean()" "fBodyBodyGyroJerkMag-std()"  
```

***


#####*Adjusted Variable Names*

For this course project variable names are adjusted to improve clarity. Adjusted names, therefore, contain lower cases; abbreviations, dashes, and brackets are removed.

```
 [1] "timebodyaccelerometermeanx"                                    
 [2] "timebodyaccelerometermeany"                                    
 [3] "timebodyaccelerometermeanz"                                    
 [4] "timebodyaccelerometerstandarddeviationx"                       
 [5] "timebodyaccelerometerstandarddeviationy"                       
 [6] "timebodyaccelerometerstandarddeviationz"                       
 [7] "timegravityaccelerometermeanx"                                 
 [8] "timegravityaccelerometermeany"                                 
 [9] "timegravityaccelerometermeanz"                                 
[10] "timegravityaccelerometerstandarddeviationx"                    
[11] "timegravityaccelerometerstandarddeviationy"                    
[12] "timegravityaccelerometerstandarddeviationz"                    
[13] "timebodyaccelerometerjerksignalmeanx"                          
[14] "timebodyaccelerometerjerksignalmeany"                          
[15] "timebodyaccelerometerjerksignalmeanz"                          
[16] "timebodyaccelerometerjerksignalstandarddeviationx"             
[17] "timebodyaccelerometerjerksignalstandarddeviationy"             
[18] "timebodyaccelerometerjerksignalstandarddeviationz"             
[19] "timebodygyroscopemeanx"                                        
[20] "timebodygyroscopemeany"                                        
[21] "timebodygyroscopemeanz"                                        
[22] "timebodygyroscopestandarddeviationx"                           
[23] "timebodygyroscopestandarddeviationy"                           
[24] "timebodygyroscopestandarddeviationz"                           
[25] "timebodygyroscopejerksignalmeanx"                              
[26] "timebodygyroscopejerksignalmeany"                              
[27] "timebodygyroscopejerksignalmeanz"                              
[28] "timebodygyroscopejerksignalstandarddeviationx"                 
[29] "timebodygyroscopejerksignalstandarddeviationy"                 
[30] "timebodygyroscopejerksignalstandarddeviationz"                 
[31] "timebodyaccelerometermagnitudemean"                            
[32] "timebodyaccelerometermagnitudestandarddeviation"               
[33] "timegravityaccelerometermagnitudemean"                         
[34] "timegravityaccelerometermagnitudestandarddeviation"            
[35] "timebodyaccelerometerjerksignalmagnitudemean"                  
[36] "timebodyaccelerometerjerksignalmagnitudestandarddeviation"     
[37] "timebodygyroscopemagnitudemean"                                
[38] "timebodygyroscopemagnitudestandarddeviation"                   
[39] "timebodygyroscopejerksignalmagnitudemean"                      
[40] "timebodygyroscopejerksignalmagnitudestandarddeviation"         
[41] "frequencybodyaccelerometermeanx"                               
[42] "frequencybodyaccelerometermeany"                               
[43] "frequencybodyaccelerometermeanz"                               
[44] "frequencybodyaccelerometerstandarddeviationx"                  
[45] "frequencybodyaccelerometerstandarddeviationy"                  
[46] "frequencybodyaccelerometerstandarddeviationz"                  
[47] "frequencybodyaccelerometerjerksignalmeanx"                     
[48] "frequencybodyaccelerometerjerksignalmeany"                     
[49] "frequencybodyaccelerometerjerksignalmeanz"                     
[50] "frequencybodyaccelerometerjerksignalstandarddeviationx"        
[51] "frequencybodyaccelerometerjerksignalstandarddeviationy"        
[52] "frequencybodyaccelerometerjerksignalstandarddeviationz"        
[53] "frequencybodygyroscopemeanx"                                   
[54] "frequencybodygyroscopemeany"                                   
[55] "frequencybodygyroscopemeanz"                                   
[56] "frequencybodygyroscopestandarddeviationx"                      
[57] "frequencybodygyroscopestandarddeviationy"                      
[58] "frequencybodygyroscopestandarddeviationz"                      
[59] "frequencybodyaccelerometermagnitudemean"                       
[60] "frequencybodyaccelerometermagnitudestandarddeviation"          
[61] "frequencybodyaccelerometerjerksignalmagnitudemean"             
[62] "frequencybodyaccelerometerjerksignalmagnitudestandarddeviation"
[63] "frequencybodygyroscopemagnitudemean"                           
[64] "frequencybodygyroscopemagnitudestandarddeviation"              
[65] "frequencybodygyroscopejerksignalmagnitudemean"                 
[66] "frequencybodygyroscopejerksignalmagnitudestandarddeviation" 
```

***

#####*Inserted Variable Names*

Variable names are inserted, and additionally, feature variables are selected if they contain information on mean and standard deviation.

* *Activity*
```
'data.frame':  10299 obs. of  1 variable:
 $ activity: int  5 5 5 5 5 5 5 5 5 5 ...
```

* *Subject*
```
'data.frame':  10299 obs. of  1 variable:
 $ subject: int  1 1 1 1 1 1 1 1 1 1 ...
```

* *Feature*
```
'data.frame':  10299 obs. of  66 variables:
 $ timebodyaccelerometermeanx                                    : num  0.289 0.278 0.28 0.279 0.277 ...
 $ timebodyaccelerometermeany                                    : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ...
 $ timebodyaccelerometermeanz                                    : num  -0.133 -0.124 -0.113 -0.123 -0.115 ...
 $ timebodyaccelerometerstandarddeviationx                       : num  -0.995 -0.998 -0.995 -0.996 -0.998 ...
 $ timebodyaccelerometerstandarddeviationy                       : num  -0.983 -0.975 -0.967 -0.983 -0.981 ...
 $ timebodyaccelerometerstandarddeviationz                       : num  -0.914 -0.96 -0.979 -0.991 -0.99 ...
 $ timegravityaccelerometermeanx                                 : num  0.963 0.967 0.967 0.968 0.968 ...
 $ timegravityaccelerometermeany                                 : num  -0.141 -0.142 -0.142 -0.144 -0.149 ...
 $ timegravityaccelerometermeanz                                 : num  0.1154 0.1094 0.1019 0.0999 0.0945 ...
 $ timegravityaccelerometerstandarddeviationx                    : num  -0.985 -0.997 -1 -0.997 -0.998 ...
  [list output truncated]
```

***


#####*Combined Activity, Subject, and Feature Data*

One data frame is created that contains *Activity*, *Subject*, and *Feature* data. An impression of the data structure is shown below.
 
```
'data.frame':  10299 obs. of  68 variables:
 $ activity                                                      : int  5 5 5 5 5 5 5 5 5 5 ...
 $ subject                                                       : int  1 1 1 1 1 1 1 1 1 1 ...
 $ timebodyaccelerometermeanx                                    : num  0.289 0.278 0.28 0.279 0.277 ...
 $ timebodyaccelerometermeany                                    : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ...
 $ timebodyaccelerometermeanz                                    : num  -0.133 -0.124 -0.113 -0.123 -0.115 ...
 $ timebodyaccelerometerstandarddeviationx                       : num  -0.995 -0.998 -0.995 -0.996 -0.998 ...
 $ timebodyaccelerometerstandarddeviationy                       : num  -0.983 -0.975 -0.967 -0.983 -0.981 ...
 $ timebodyaccelerometerstandarddeviationz                       : num  -0.914 -0.96 -0.979 -0.991 -0.99 ...
 $ timegravityaccelerometermeanx                                 : num  0.963 0.967 0.967 0.968 0.968 ...
 $ timegravityaccelerometermeany                                 : num  -0.141 -0.142 -0.142 -0.144 -0.149 ...
  [list output truncated]
```


***


#####*Inserted Descriptive Activity Names*

The original *Activity* data contains numbers (i.e. 1-6). Descriptive activity names are inserted.

```
'data.frame':  10299 obs. of  68 variables:
 $ activity                                                      : chr  "standing" "standing" "standing" "standing" ...
 $ subject                                                       : int  1 1 1 1 1 1 1 1 1 1 ...
 $ timebodyaccelerometermeanx                                    : num  0.289 0.278 0.28 0.279 0.277 ...
 $ timebodyaccelerometermeany                                    : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ...
 $ timebodyaccelerometermeanz                                    : num  -0.133 -0.124 -0.113 -0.123 -0.115 ...
 $ timebodyaccelerometerstandarddeviationx                       : num  -0.995 -0.998 -0.995 -0.996 -0.998 ...
 $ timebodyaccelerometerstandarddeviationy                       : num  -0.983 -0.975 -0.967 -0.983 -0.981 ...
 $ timebodyaccelerometerstandarddeviationz                       : num  -0.914 -0.96 -0.979 -0.991 -0.99 ...
 $ timegravityaccelerometermeanx                                 : num  0.963 0.967 0.967 0.968 0.968 ...
 $ timegravityaccelerometermeany                                 : num  -0.141 -0.142 -0.142 -0.144 -0.149 ...
  [list output truncated]
```


***


#####*Melted Data*

Using the *reshape2* package data is melted (melt function).

```
'data.frame':  679734 obs. of  4 variables:
 $ activity: chr  "laying" "laying" "laying" "laying" ...
 $ subject : int  1 1 1 1 1 1 1 1 1 1 ...
 $ variable: Factor w/ 66 levels "timebodyaccelerometermeanx",..: 1 1 1 1 1 1 1 1 1 1 ...
 $ value   : num  0.403 0.278 0.277 0.28 0.277 ...
```


***


#####*Tidy Data*

Tidy data is generated with the average of each variable for each activity and each subject, using the *reshape2* package (dcast function). A text file that contains the tidy data is created.

```
'data.frame':  180 obs. of  68 variables:
 $ activity                                                      : chr  "laying" "laying" "laying" "laying" ...
 $ subject                                                       : int  1 2 3 4 5 6 7 8 9 10 ...
 $ timebodyaccelerometermeanx                                    : num  0.222 0.281 0.276 0.264 0.278 ...
 $ timebodyaccelerometermeany                                    : num  -0.0405 -0.0182 -0.019 -0.015 -0.0183 ...
 $ timebodyaccelerometermeanz                                    : num  -0.113 -0.107 -0.101 -0.111 -0.108 ...
 $ timebodyaccelerometerstandarddeviationx                       : num  -0.928 -0.974 -0.983 -0.954 -0.966 ...
 $ timebodyaccelerometerstandarddeviationy                       : num  -0.837 -0.98 -0.962 -0.942 -0.969 ...
 $ timebodyaccelerometerstandarddeviationz                       : num  -0.826 -0.984 -0.964 -0.963 -0.969 ...
 $ timegravityaccelerometermeanx                                 : num  -0.249 -0.51 -0.242 -0.421 -0.483 ...
 $ timegravityaccelerometermeany                                 : num  0.706 0.753 0.837 0.915 0.955 ...
  [list output truncated]
```

***


#####*Selected and Adjusted Variables*

Aforementioned steps result in the following 68 variables:

```
 [1] "activity"                                                      
 [2] "subject"                                                       
 [3] "timebodyaccelerometermeanx"                                    
 [4] "timebodyaccelerometermeany"                                    
 [5] "timebodyaccelerometermeanz"                                    
 [6] "timebodyaccelerometerstandarddeviationx"                       
 [7] "timebodyaccelerometerstandarddeviationy"                       
 [8] "timebodyaccelerometerstandarddeviationz"                       
 [9] "timegravityaccelerometermeanx"                                 
[10] "timegravityaccelerometermeany"                                 
[11] "timegravityaccelerometermeanz"                                 
[12] "timegravityaccelerometerstandarddeviationx"                    
[13] "timegravityaccelerometerstandarddeviationy"                    
[14] "timegravityaccelerometerstandarddeviationz"                    
[15] "timebodyaccelerometerjerksignalmeanx"                          
[16] "timebodyaccelerometerjerksignalmeany"                          
[17] "timebodyaccelerometerjerksignalmeanz"                          
[18] "timebodyaccelerometerjerksignalstandarddeviationx"             
[19] "timebodyaccelerometerjerksignalstandarddeviationy"             
[20] "timebodyaccelerometerjerksignalstandarddeviationz"             
[21] "timebodygyroscopemeanx"                                        
[22] "timebodygyroscopemeany"                                        
[23] "timebodygyroscopemeanz"                                        
[24] "timebodygyroscopestandarddeviationx"                           
[25] "timebodygyroscopestandarddeviationy"                           
[26] "timebodygyroscopestandarddeviationz"                           
[27] "timebodygyroscopejerksignalmeanx"                              
[28] "timebodygyroscopejerksignalmeany"                              
[29] "timebodygyroscopejerksignalmeanz"                              
[30] "timebodygyroscopejerksignalstandarddeviationx"                 
[31] "timebodygyroscopejerksignalstandarddeviationy"                 
[32] "timebodygyroscopejerksignalstandarddeviationz"                 
[33] "timebodyaccelerometermagnitudemean"                            
[34] "timebodyaccelerometermagnitudestandarddeviation"               
[35] "timegravityaccelerometermagnitudemean"                         
[36] "timegravityaccelerometermagnitudestandarddeviation"            
[37] "timebodyaccelerometerjerksignalmagnitudemean"                  
[38] "timebodyaccelerometerjerksignalmagnitudestandarddeviation"     
[39] "timebodygyroscopemagnitudemean"                                
[40] "timebodygyroscopemagnitudestandarddeviation"                   
[41] "timebodygyroscopejerksignalmagnitudemean"                      
[42] "timebodygyroscopejerksignalmagnitudestandarddeviation"         
[43] "frequencybodyaccelerometermeanx"                               
[44] "frequencybodyaccelerometermeany"                               
[45] "frequencybodyaccelerometermeanz"                               
[46] "frequencybodyaccelerometerstandarddeviationx"                  
[47] "frequencybodyaccelerometerstandarddeviationy"                  
[48] "frequencybodyaccelerometerstandarddeviationz"                  
[49] "frequencybodyaccelerometerjerksignalmeanx"                     
[50] "frequencybodyaccelerometerjerksignalmeany"                     
[51] "frequencybodyaccelerometerjerksignalmeanz"                     
[52] "frequencybodyaccelerometerjerksignalstandarddeviationx"        
[53] "frequencybodyaccelerometerjerksignalstandarddeviationy"        
[54] "frequencybodyaccelerometerjerksignalstandarddeviationz"        
[55] "frequencybodygyroscopemeanx"                                   
[56] "frequencybodygyroscopemeany"                                   
[57] "frequencybodygyroscopemeanz"                                   
[58] "frequencybodygyroscopestandarddeviationx"                      
[59] "frequencybodygyroscopestandarddeviationy"                      
[60] "frequencybodygyroscopestandarddeviationz"                      
[61] "frequencybodyaccelerometermagnitudemean"                       
[62] "frequencybodyaccelerometermagnitudestandarddeviation"          
[63] "frequencybodyaccelerometerjerksignalmagnitudemean"             
[64] "frequencybodyaccelerometerjerksignalmagnitudestandarddeviation"
[65] "frequencybodygyroscopemagnitudemean"                           
[66] "frequencybodygyroscopemagnitudestandarddeviation"              
[67] "frequencybodygyroscopejerksignalmagnitudemean"                 
[68] "frequencybodygyroscopejerksignalmagnitudestandarddeviation"   
```


***

#####*Comments*

This Code Book provides a concise overview of the data and variables, and of the data cleaning steps. Briefly, the *UCI HAR Dataset* consists of training (**Train Data**) and test data sets (**Test Data**), each containing data on specific activities (*Activity*), subjects (*Subject*), and features (*Feature*). For the activity, subject and feature data separately, training and test data sets are combined. Subsequently, appropriate variable names are inserted, and measurements on mean and standard deviation are selected. The activity, subject and feature data are then combined, and descriptive activity names are added. After melting the combined data, tidy data is generated that contains the average of each variable for each activity and each subject. The tidy data comprises 180 observations and 68 variables, including one activity variable, one subject variable, and 66 feature variables.    

Examples of data structures, before and after any adjustments, are shown in this Code Book. For simplicity, R codes are not displayed; codes and additional information are provided in the **run_analysis.R** script and **README.md** file.


***


