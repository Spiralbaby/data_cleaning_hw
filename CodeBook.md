###Below is a list of steps, variable definitions, and descriptions of modifications to the raw data, performed to create the tidy data set submitted as part of the Coursera assignment.

1. creates the following variables, and read in raw data.
* y_test - contains data from y_test.txt
* x_test - contains data from X_test.txt 
* y_train - contains data from y_train.txt
* x_train - contains data from X_train.txt
* test_subjects - contains data subject_test.txt
* train_subjects - contains data from subject_train.txt 
* features - contains data from features.txt 
* activities - contains data from activity_labels.txt

2. filter "features" to those containing "mean()" or "std()" using the filter method, and grepl.
3. name the activities table for easier handling
4. perform checks for any empty variables (NA values) in our data using: any(is.na("data")) - there did not appear to be any.
5. merge all the data sets using cbind and rbind and merge to create one master data set
6. name variables in data set
7. create tidy data set from master data set using melt function, and ddply and summarise.
8. use write.table to create output for submitting to class

###Data Frame: "master_raw_data"
* 10299 observations of 68 variables. 
* produced by step 4 of the assignment & used to create final tidy data set in the final step.
#####Variable names:
* activity_name - 6 activites: "WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING,"LAYING"
* subjects - (an integer vector from 1 - 30 that refers to subjects names (mapped from raw data))
* tBodyAcc-mean()-X           
* tBodyAcc-mean()-Y           
* tBodyAcc-mean()-Z           
* tBodyAcc-std()-X           
* tBodyAcc-std()-Y            
* tBodyAcc-std()-Z            
* tGravityAcc-mean()-X        
* tGravityAcc-mean()-Y       
* tGravityAcc-mean()-Z        
* tGravityAcc-std()-X         
* tGravityAcc-std()-Y         
* tGravityAcc-std()-Z        
* tBodyAccJerk-mean()-X       
* tBodyAccJerk-mean()-Y       
* tBodyAccJerk-mean()-Z       
* tBodyAccJerk-std()-X       
* tBodyAccJerk-std()-Y        
* tBodyAccJerk-std()-Z        
* tBodyGyro-mean()-X          
* tBodyGyro-mean()-Y         
* tBodyGyro-mean()-Z          
* tBodyGyro-std()-X           
* tBodyGyro-std()-Y           
* tBodyGyro-std()-Z          
* tBodyGyroJerk-mean()-X      
* tBodyGyroJerk-mean()-Y      
* tBodyGyroJerk-mean()-Z      
* tBodyGyroJerk-std()-X      
* tBodyGyroJerk-std()-Y       
* tBodyGyroJerk-std()-Z       
* tBodyAccMag-mean()          
* tBodyAccMag-std()          
* tGravityAccMag-mean()       
* tGravityAccMag-std()        
* tBodyAccJerkMag-mean()      
* tBodyAccJerkMag-std()      
* tBodyGyroMag-mean()         
* tBodyGyroMag-std()          
* tBodyGyroJerkMag-mean()     
* tBodyGyroJerkMag-std()     
* fBodyAcc-mean()-X           
* fBodyAcc-mean()-Y           
* fBodyAcc-mean()-Z           
* fBodyAcc-std()-X           
* fBodyAcc-std()-Y            
* fBodyAcc-std()-Z            
* fBodyAccJerk-mean()-X       
* fBodyAccJerk-mean()-Y      
* fBodyAccJerk-mean()-Z       
* fBodyAccJerk-std()-X        
* fBodyAccJerk-std()-Y        
* fBodyAccJerk-std()-Z       
* fBodyGyro-mean()-X          
* fBodyGyro-mean()-Y          
* fBodyGyro-mean()-Z          
* fBodyGyro-std()-X          
* fBodyGyro-std()-Y           
* fBodyGyro-std()-Z           
* fBodyAccMag-mean()          
* fBodyAccMag-std()          
* fBodyBodyAccJerkMag-mean()  
* fBodyBodyAccJerkMag-std()   
* fBodyBodyGyroMag-mean()     
* fBodyBodyGyroMag-std()     
* fBodyBodyGyroJerkMag-mean() 
* fBodyBodyGyroJerkMag-std() 

###Data Frame: "meanMasterData"
* 11880 observations of 4 variables. 
* the final tidy data set created from master_raw_data, and provided as the answer to step 5 of the homework.
#####Variable names:
* activity_name - 6 activities "WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING,"LAYING"
* subjects - (an integer vector from 1 - 30 that refers to subjects names (mapped from raw data))
* variable - the 66 variables (listed above) from the master_raw_data for which we are finding the mean.
* mean - the mean values for the 66 variables
the mean values are averages of vector data produced by the accelerometer and gyroscope of the Samsung device.

* code is well commented for further details and clarity.
