###############################################################################
#
# Human Activity Recognition Using Smartphones
# The goal is to prepare tidy data that can be used for later analysis.
# 
# The script generates two files :
#    tidy.csv : Data set with only the mean and standard deviation for each measurement
#    tidy.mean.csv : Aggregate using mean for each activity and each subject.
#
# The data for the project is available at : 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#
# The full description of the data set is available at :
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#
###############################################################################

# Get the data from local directory
setwd("/media/mm/MM/Data Science/03 Cleaning Data/data")
y_tr <- read.csv("y_train.txt", sep = "", header = FALSE)
y_te <- read.csv("y_test.txt", sep = "", header = FALSE)
actlabel <- read.csv("labels.txt", sep = "", header = FALSE)
x_tr <- read.table ("X_train.txt", sep = "", header = FALSE)
x_te <- read.table ("X_test.txt", sep = "", header = FALSE)
varlabel <- read.csv("features.txt", sep = "", header = FALSE)
subject_tr <- read.csv("subject_train.txt", sep = "", header = FALSE)
subject_te <- read.csv("subject_test.txt", sep = "", header = FALSE)

# Build a data set for the Activities
y <- rbind(y_tr,y_te)
colnames(y) <- c("ID")
colnames(actlabel) <- c("ID", "Activities")
ylabel <- data.frame(actlabel[y$ID, "Activities"])
colnames(ylabel) <- c("Activities")

# Build a data set for the Measurements
x <- rbind(x_tr,x_te)
colnames(x) <- varlabel[[2]]

# Build a data set for the Subjects
subject <- rbind(subject_tr,subject_te)
colnames(subject) <- c("Volunteers")

# Merge data (Subjects, Activities and Measurements)
dataset <- cbind(subject,ylabel)
dataset <- cbind(dataset,x)

# Extract only the measurements for the mean and standard deviation
tidy <-dataset[c(1,2,grep("mean\\(", colnames(dataset)),
                     grep("std\\(", colnames(dataset)))]

# Create an aggregate data set (mean)
tidy.mean <- aggregate(tidy[3:68], 
                       by=list(Volunteers=tidy$Volunteers,
                               Activities=tidy$Activities),
                       FUN=mean)

# Write output files
write.csv(tidy, "tidy.csv", row.names=FALSE)
write.csv(tidy.mean, "tidy.mean.csv", row.names=FALSE)