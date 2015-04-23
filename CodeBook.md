##The source code is commented at each significant step. 
##Provided below is a higher level description of the overall data, variables, and processing.

1. script creates the following variables, and reads the raw data into them.
###y_test - contains data from y_test.txt
###x_test - contains data from X_test.txt 
###y_train - contains data from y_train.txt
###x_train - contains data from X_train.txt
###test_subjects - contains data subject_test.txt
###train_subjects - contains data from subject_train.txt 
###features - contains data from features.txt 
###activities - contains data from activity_labels.txt

2. filter "features" to those containing "mean()" or "std()" using the filter method, and grepl.
3. name the activities table for easier handling
4. perform a series check for any empty variables (NA values) in our data using: any(is.na("data")) - there did not appear to be any.
5. merge all the data sets using cbind and rbind and merge to create one master data set
6. name variables appropriately
7. create tidy data set from master data set using melt function, and ddply and summarise.
8. use write.table to create output for submitting to class

##Final Variables
###master_raw_data: the final data frame from the raw and organized data. It has 10299 observations of 68 variables. 
###Variables are:
* activity_name - 6 activites: "WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING,"LAYING"
* subjects - (an integer vector from 1 - 30 that refers to subjects names (mapped from raw data))
* 66 variables containing "mean()" or "std()" in their names (filtered from raw data) - representing the data we wish to analyse.


###meanMasterData: the final tidy data set created from master_raw_data, and provided as the answer to step 5 of the homework. It has 11880 observations of 4 variables.
* activity_name - 6 activities "WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING,"LAYING"
* subjects - (an integer vector from 1 - 30 that refers to subjects names (mapped from raw data))
* variable - the 66 variables from the master_raw_data that we are finding the mean for
* mean - the mean values for the 66 variables - 

## the mean values are averages of vector data produced by the accelerometer and gyroscope of the Samsung device.
