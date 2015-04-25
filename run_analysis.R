library(plyr) 
library(dplyr)
library(reshape2)

#please see README.md for more details instructions on set up.
#fork, and clone "data_cleaning_hw" repo locally from github (full GitHub link in Coursera assigment submission)
#download and unzip Dataset.zip to repo root directory ("UCI HAR Dataset" should be in forked repo root directory)
#link to download dataset: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#read x, y test and x, y train files into data frames
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", sep="", header=FALSE)
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", sep="", header=FALSE)
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
test_subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE) ## test subject data
train_subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE) ## train subject data

#get features list
features <- read.table("./UCI HAR Dataset/features.txt", sep="", header=FALSE)

#filter out only rows with "mean()" or "std()"
features <- filter(features, grepl("mean()",V2,fixed=TRUE) | grepl("std()",V2,fixed=TRUE))

#get activities.txt data
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)
#name activities columns for easier reference
names(activities) <- c("actNum","activity_name")

#check data for NA
any(is.na(y_test)) #result was FALSE - No NA values
any(is.na(x_test)) #result was FALSE - No NA values
any(is.na(y_train)) #result was FALSE - No NA values
any(is.na(x_train)) #result was FALSE - No NA values
any(is.na(test_subjects)) #result was FALSE - No NA values
any(is.na(train_subjects)) #result was FALSE - No NA values

#filter out only columns needed (mean and std) 
requiredColumns <- features[,1]
required_x_test <- x_test[,requiredColumns]
required_x_train <- x_train[,requiredColumns]

#combine y and x data for test and train to associate activity names with data 
yx_test <- cbind(y_test,required_x_test)
yx_train <- cbind(y_train,required_x_train)
#combine test and train data
combined_test_train <- rbind(yx_test, yx_train)

colNamesSubAct <- c("subjects","activity")
colNamesVariables <- as.character(features[,2])
#combine into 1 vector of column names
colNames <- c(colNamesSubAct, colNamesVariables)

#combine test and subjets
all_subjects <- rbind(test_subjects,train_subjects)

#combine test_train with all_subjects to make master "raw" data frame
master_raw_data <- cbind(all_subjects, combined_test_train)

#name master_raw_data columns
colnames(master_raw_data) <- colNames

#merge master_raw_data and activities to add activity names to master_raw_data
master_raw_data <- merge(activities, master_raw_data, by.x="actNum", by.y="activity", all=TRUE)

#remove column of activity numbers (since we only need column with names)
master_raw_data <- select(master_raw_data, -actNum)



####creates new tidy data set of "mean" values for each subject per activity 
meltedRawData <- melt(master_raw_data,id=c("activity_name","subjects"),measure.vars=c(3:68))
meanMasterData <- ddply(meltedRawData, c("activity_name","subjects","variable"), summarise, mean=mean(value))


#produce tidy data set as text file, to upload to coursera assessment.
write.table(meanMasterData, file="meanMasterData.txt", row.name=FALSE)
