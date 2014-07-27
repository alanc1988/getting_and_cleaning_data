####################################################################################################################
## PROJECT TASK
####################################################################################################################

# You should create one R script called run_analysis.R that does the following. 
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

####################################################################################################################

rm(list=ls())
cat("\014")
library(Hmisc);
setwd("~/../Desktop/Getting and Cleaning Data/UCI HAR Dataset")
options(warn=-1)

print("starting run_analysis.R")
print("loading training and test data sets into memory...")

X_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")
X_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

print("data loaded, re-formatting...")

dist_subj <- unique(tmp <- rbind(subject_train,subject_test))$subject
no_subj <- nrow(tmp)
activity_labels <- read.csv("activity_labels.txt", sep="", header=FALSE)
features <- read.table("features.txt")[,2]
names(activity_labels) <- c("id", "activity")
no_act <- nrow(activity_labels)
names(subject_test) <- names(subject_train) <- "subject"
names(X_test) <- names(X_train) <- features
names(y_test) <- names(y_train) <- "activity"
X_train <- X_train[,grepl("mean|std", features)]
X_test <- X_test[,grepl("mean|std", features)]
y_train[,1] <- sapply(y_train[,1],function(x){subset(activity_labels,id == x)$activity;})
y_test[,1] <- sapply(y_test[,1],function(x){subset(activity_labels,id == x)$activity;})

print("constructing table...")

train <- cbind(as.data.frame(subject_train), y_train, X_train)
test <- cbind(as.data.frame(subject_test), y_test, X_test)
no_cols <- length(cmb_data <- rbind(test, train))
cmb_data$activity <- as.factor(cmb_data$activity)
cmb_data$subject <- as.factor(cmb_data$subject)

i = 1
for (j in activity_labels$activity) {
	cmb_data$activity <- gsub(i, j, cmb_data$activity)
	inc(i) <- 1
}
output <- aggregate(cmb_data, by=list(activity <- cmb_data$activity, subject <- cmb_data$subject), mean)

print("writing table out to disk")

write.table(output, "output.txt")

print("run complete. All is well")
