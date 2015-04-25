##Getting and Cleaning Data Homework Assignment

###Purpose:

#####This project creates a tidy data set created from raw data of accelerometers from the Samsung Galaxy S smartphone.

###Files included this repo:

* README.md (this file)
* CodeBook.md (file describing data, variables, and transformations performed in run_analysis.R)
* run_analysis.R (R code that produces the organizes the raw data, and creates a tidy data set)

###Files NOT included in this repo:
* The raw data used for this analysis is available to download in the link provided below. According to the peer review assessment, the R code should run as long as the Samsung data is in your working directory. It does not say we need to provide the data in our repo. In an effort to reduce upload and download time, and considering students should already have this data on their computers, I am not including the raw data as part of this repo. Below I do provide the link, and the steps I took before importing; which was: 1) download, 2) unzip into working directory.

####Steps to recreate Tidy data set:
1. fork this repo, and clone it locally on your machine. 
2. download "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" and unzip it to this cloned repo's directory.
the unzipped file contains 2 folders: "test" and "train" each containing the raw data used in the analysis, as well as it's own README.txt file that describes the contents of the unzipped file.
3. you can run the code from run_analysis.R by sourcing it through R studio, or copying and running the code directly through the R terminal. the end result will be the tidy data set provided in the peer review section of the "Getting and Cleaning Data" Coursera class.