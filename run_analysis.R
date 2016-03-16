# This work is related to the Getting and Cleaning Data Course Project

runAnalysis <- function() 
{
# First, we get zip data and extract files to the working directory
# Even if exists, we overwrite
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile="Dataset.zip")

# Unzipping to the existing files, if exists, we overwrite
unzip ("Dataset.zip")

# We read necessary data

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train<- read.table("./UCI HAR Dataset/train/subject_train.txt")
subject_test<- read.table("./UCI HAR Dataset/test/subject_test.txt")
activity_labels<- read.table("./UCI HAR Dataset/activity_labels.txt")



# We add column names

features<- read.table("./UCI HAR Dataset/features.txt")
names(activity_labels)<-c("Motion","MotionName")
names(X_test) = features[,2]
names(X_train) = features[,2]


# Task 1 Merges the training and the test sets to create one data set
# Additionally, subject and activity columns, attribute names added too

TrainTestDataX<-rbind(X_train, X_test)
TrainTestDataY<-rbind(y_train, y_test)
names(TrainTestDataY) <- "Motion"
TrainTestDataY2<- merge(TrainTestDataY, activity_labels)
TrainTestDataSubject<-rbind(subject_train, subject_test)
names(TrainTestDataSubject) <- "SubjectID"
AllCombined<- cbind(TrainTestDataSubject, TrainTestDataX, TrainTestDataY2)


# Task 2  Extracts only the measurements on the mean and standard deviation for each measurement
# All columns containing the keywords are selected

MeanStdColumns<-grep("(mean|Mean|std|Std)\\(\\)", names(AllCombined))
MeanStdSubSet<-AllCombined[MeanStdColumns]



# Task 3 Give activity names to name the activities in the data set
# This has been already done at above :  TrainTestDataY2<- merge(TrainTestDataY, activity_labels)



# Task 4 Appropriately labels the data set with descriptive variable names.
# Variable names transformed to a more understandable format 
# t    to    Time
#Acc   to  Acceleration
#std  to StdDev
#Jerk  to JerkSignals 
#Gyro   to Gyroscope
#Mag  to Magnitude
# -X to XAxis
# -Y to YAxis
# -Z to ZAxis
# (  ) -  to nothing

names(MeanStdSubSet) <- gsub("^t", "Time", names(MeanStdSubSet))
names(MeanStdSubSet) <- gsub("^f", "Frequency", names(MeanStdSubSet))
names(MeanStdSubSet) <- gsub("std", "StdDev", names(MeanStdSubSet))
names(MeanStdSubSet) <- gsub("mean", "Mean", names(MeanStdSubSet))
names(MeanStdSubSet) <- gsub("Acc", "Acceleration", names(MeanStdSubSet))
names(MeanStdSubSet) <- gsub("Gyro", "Gyroscope", names(MeanStdSubSet))
names(MeanStdSubSet) <- gsub("Mag", "Magnitude", names(MeanStdSubSet))
names(MeanStdSubSet) <- gsub("-X", "XAxis", names(MeanStdSubSet))
names(MeanStdSubSet) <- gsub("-Y", "YAxis", names(MeanStdSubSet))
names(MeanStdSubSet) <- gsub("-Z", "ZAxis", names(MeanStdSubSet))
names(MeanStdSubSet) <- gsub("-", "", names(MeanStdSubSet))
names(MeanStdSubSet) <- gsub(")", "", names(MeanStdSubSet))
names(MeanStdSubSet) <- gsub("\\(", "", names(MeanStdSubSet))

# Task 5 From the data set in step 4, we created a second, independent tidy 
# data set with the average of each variable for each activity and each subject

SubjectMotion<-AllCombined[,c(1,564)]
TidyDataSet <- cbind(SubjectMotion, MeanStdSubSet)
TidyAverage<- aggregate(TidyDataSet [, 3:68], by=list(Subject=TidyDataSet$SubjectID,Motion=TidyDataSet$MotionName), mean)
names(TidyAverage)[-c(1,2)] <- paste0("MeanOf", names(TidyAverage)[-c(1,2)])

write.csv(TidyAverage, "tidy.csv", row.names=FALSE)

TidyAverage
}
