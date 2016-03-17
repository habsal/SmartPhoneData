# This work is related to the Getting and Cleaning Data Course Project
# When we call runAnalysis function , it fetchs data, cleab, aggregate and finnaly write the result to a csv file and display at the screen too.

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
names(subject_train) <- "subjectID"
names(subject_test) <- "subjectID"
names(activity_labels)<-c("activity","ActivityName")
features<- read.table("./UCI HAR Dataset/features.txt")
names(X_test) = features[,2]
names(X_train) = features[,2]
names(y_train) <- "activity"
names(y_test) <- "activity"

# Task 1 Merges the training and the test sets to create one data set
# X observation variables, y target variables and subject data aggregated 
# in one file both containing test nad train data

TrainData <- cbind(subject_train, y_train, X_train)
TestData <- cbind(subject_test, y_test, X_test)
AllCombined <- rbind(TrainData, TestData)

options(warn = -1)

# activity variable is numeric, we replace it by label name
AllCombined2 <- merge(AllCombined,activity_labels , by = "activity")

# we erase the activity name numeric column
AllCombined3 <- AllCombined2[ -c(1) ]


# Task 2  Extracts only the measurements on the mean and standard deviation for each measurement
# All columns containing the keywords are selected

MeanStdColumns<-grep("(mean|Mean|std|Std)\\(\\)", names(AllCombined3))
MeanStdSubSet<-AllCombined3[MeanStdColumns]



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

# add data subjectid and activity
SubjectMotion<-AllCombined3[,c(1,563)]
TidyDataSet <- cbind(SubjectMotion, MeanStdSubSet)

# take averga of values grouped by subject and activity
TidyAverage<- aggregate(TidyDataSet [, 3:68], by=list(Subject=TidyDataSet$subjectID,Activity=TidyDataSet$ActivityName), mean)

# Add "MeanOf" to each variable except subjectid and activity
names(TidyAverage)[-c(1,2)] <- paste0("MeanOf", names(TidyAverage)[-c(1,2)])

# Write the result to a csv at the working directory
write.csv(TidyAverage, "tidy.csv", row.names=FALSE)

TidyAverage
}
