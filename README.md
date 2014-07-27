Getting & Cleaning Data Course Project
=========================

***Introduction***
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set. 
- Appropriately labels the data set with descriptive variable names. 
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

***How to Use***
- Data is obtained from the following source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
- Download the zip file and extract the file "UCI Har Dataset" into the following directory from your Desktop: Desktop/Getting and Cleaning Data/UCI HAR Dataset. 
- i.e. Once you downloaded the zip file, create a new folder on your Desktop called "Getting and Cleaning Data" then extract the contents of the zip file into this directory.
- Run run_analysis.R from any directory. The script is only dependent on the source files being in the directory outlined above.
- On successful execution of the script, the file "output.txt" should be generated.

***Files in this repository***
- run_analysis.R - this R script is used to take in the source training and test data files on local disk, transform them and output data.
- CodeBook.md outlines information about the variables and how the data was transformed.
- The training and test data are located in the folders train and test respectively.
