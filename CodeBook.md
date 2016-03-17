# THE ORIGINAL DATA SET
Detailed description of the data can be found at :
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Original date can be reached at :
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The zipped file, "UCI HAR Dataset" contains :
- Train and test data sets
- Activity labels, which is the labels of the target variable
- Detailed information on the fetures axisting in the dataset


We use following files:
- Main directory, activity_labels.txt, id and names of 6 different activity
- Main directory, features.txt. 561 features.
- Train directory : subject_train.txt, X_train.txt, y_train
- Test directory : subject_test.txt, X_test.txt, y_test
Train sets have 7352 rows, test sets have 2947 rows.
X_train/X_test stes have 561 features.

# TRANSFORMATION
Train and Test data is merged to reach the whole dataset.
Varibale and target variable names and categorical values are added to the dataset.
Then variables containing standart deviation or mean information is slected and average of them calculated grouping by Subject and Activity.
Since the names of variables was not clean, names are trasnformed to a more meaning ful version. Since ve aggreagted each variable, we added "MeanOf" to each variable name.

# FINAL DATA
  Subject : The person id whose moevements are collected. 1 to 30. 
  Activity  : Activity types, "Walking", "Standing" etc.
  Mean of time and frequency values of activity tpes, 66 variables (normalized).
  For more details please see below:
    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
    
    Subject : The subject id of the person, whose data aggregated
Activity : Type of the activity, data aggregated from
MeanOfTimeBodyAccelerationMeanXAxis :  mean  of time of body acceleration  mean along X Axis
MeanOfTimeBodyAccelerationMeanYAxis :  mean  of time of body acceleration  mean along Y Axis
MeanOfTimeBodyAccelerationMeanZAxis :  mean  of time of body acceleration  mean along Z Axis
MeanOfTimeBodyAccelerationStdDevXAxis :  mean  of time of body acceleration StdDevalong X Axis
MeanOfTimeBodyAccelerationStdDevYAxis :  mean  of time of body acceleration StdDevalong Y Axis
MeanOfTimeBodyAccelerationStdDevZAxis :  mean  of time of body acceleration StdDevalong Z Axis
MeanOfTimeGravityAccelerationMeanXAxis :  mean  of time of gravity acceleration  mean along X Axis
MeanOfTimeGravityAccelerationMeanYAxis :  mean  of time of gravity acceleration  mean along Y Axis
MeanOfTimeGravityAccelerationMeanZAxis :  mean  of time of gravity acceleration  mean along Z Axis
MeanOfTimeGravityAccelerationStdDevXAxis :  mean  of time of gravity acceleration StdDevalong X Axis
MeanOfTimeGravityAccelerationStdDevYAxis :  mean  of time of gravity acceleration StdDevalong Y Axis
MeanOfTimeGravityAccelerationStdDevZAxis :  mean  of time of gravity acceleration StdDevalong Z Axis
MeanOfTimeBodyAccelerationJerkMeanXAxis :  mean  of time of body acceleration  Jerk  mean along X Axis
MeanOfTimeBodyAccelerationJerkMeanYAxis :  mean  of time of body acceleration  Jerk  mean along Y Axis
MeanOfTimeBodyAccelerationJerkMeanZAxis :  mean  of time of body acceleration  Jerk  mean along Z Axis
MeanOfTimeBodyAccelerationJerkStdDevXAxis :  mean  of time of body acceleration  Jerk StdDevalong X Axis
MeanOfTimeBodyAccelerationJerkStdDevYAxis :  mean  of time of body acceleration  Jerk StdDevalong Y Axis
MeanOfTimeBodyAccelerationJerkStdDevZAxis :  mean  of time of body acceleration  Jerk StdDevalong Z Axis
MeanOfTimeBodyGyroscopeMeanXAxis :  mean  of time of body gyroscope mean along X Axis
MeanOfTimeBodyGyroscopeMeanYAxis :  mean  of time of body gyroscope mean along Y Axis
MeanOfTimeBodyGyroscopeMeanZAxis :  mean  of time of body gyroscope mean along Z Axis
MeanOfTimeBodyGyroscopeStdDevXAxis :  mean  of time of body gyroscopeStdDevalong X Axis
MeanOfTimeBodyGyroscopeStdDevYAxis :  mean  of time of body gyroscopeStdDevalong Y Axis
MeanOfTimeBodyGyroscopeStdDevZAxis :  mean  of time of body gyroscopeStdDevalong Z Axis
MeanOfTimeBodyGyroscopeJerkMeanXAxis :  mean  of time of body gyroscope Jerk  mean along X Axis
MeanOfTimeBodyGyroscopeJerkMeanYAxis :  mean  of time of body gyroscope Jerk  mean along Y Axis
MeanOfTimeBodyGyroscopeJerkMeanZAxis :  mean  of time of body gyroscope Jerk  mean along Z Axis
MeanOfTimeBodyGyroscopeJerkStdDevXAxis :  mean  of time of body gyroscope Jerk StdDevalong X Axis
MeanOfTimeBodyGyroscopeJerkStdDevYAxis :  mean  of time of body gyroscope Jerk StdDevalong Y Axis
MeanOfTimeBodyGyroscopeJerkStdDevZAxis :  mean  of time of body gyroscope Jerk StdDevalong Z Axis
MeanOfTimeBodyAccelerationMagnitudeMean :  mean  of time of body acceleration Magnitude mean 
MeanOfTimeBodyAccelerationMagnitudeStdDev :  mean  of time of body acceleration MagnitudeStdDev
MeanOfTimeGravityAccelerationMagnitudeMean :  mean  of time of gravity acceleration Magnitude mean 
MeanOfTimeGravityAccelerationMagnitudeStdDev :  mean  of time of gravity acceleration MagnitudeStdDev
MeanOfTimeBodyAccelerationJerkMagnitudeMean :  mean  of time of body acceleration  Jerk Magnitude mean 
MeanOfTimeBodyAccelerationJerkMagnitudeStdDev :  mean  of time of body acceleration  Jerk MagnitudeStdDev
MeanOfTimeBodyGyroscopeMagnitudeMean :  mean  of time of body gyroscopeMagnitude mean 
MeanOfTimeBodyGyroscopeMagnitudeStdDev :  mean  of time of body gyroscopeMagnitudeStdDev
MeanOfTimeBodyGyroscopeJerkMagnitudeMean :  mean  of time of body gyroscope Jerk Magnitude mean 
MeanOfTimeBodyGyroscopeJerkMagnitudeStdDev :  mean  of time of body gyroscope Jerk MagnitudeStdDev
MeanOfFrequencyBodyAccelerationMeanXAxis :  mean  of frequencyof body acceleration  mean along X Axis
MeanOfFrequencyBodyAccelerationMeanYAxis :  mean  of frequencyof body acceleration  mean along Y Axis
MeanOfFrequencyBodyAccelerationMeanZAxis :  mean  of frequencyof body acceleration  mean along Z Axis
MeanOfFrequencyBodyAccelerationStdDevXAxis :  mean  of frequencyof body acceleration StdDevalong X Axis
MeanOfFrequencyBodyAccelerationStdDevYAxis :  mean  of frequencyof body acceleration StdDevalong Y Axis
MeanOfFrequencyBodyAccelerationStdDevZAxis :  mean  of frequencyof body acceleration StdDevalong Z Axis
MeanOfFrequencyBodyAccelerationJerkMeanXAxis :  mean  of frequencyof body acceleration  Jerk  mean along X Axis
MeanOfFrequencyBodyAccelerationJerkMeanYAxis :  mean  of frequencyof body acceleration  Jerk  mean along Y Axis
MeanOfFrequencyBodyAccelerationJerkMeanZAxis :  mean  of frequencyof body acceleration  Jerk  mean along Z Axis
MeanOfFrequencyBodyAccelerationJerkStdDevXAxis :  mean  of frequencyof body acceleration  Jerk StdDevalong X Axis
MeanOfFrequencyBodyAccelerationJerkStdDevYAxis :  mean  of frequencyof body acceleration  Jerk StdDevalong Y Axis
MeanOfFrequencyBodyAccelerationJerkStdDevZAxis :  mean  of frequencyof body acceleration  Jerk StdDevalong Z Axis
MeanOfFrequencyBodyGyroscopeMeanXAxis :  mean  of frequencyof body gyroscope mean along X Axis
MeanOfFrequencyBodyGyroscopeMeanYAxis :  mean  of frequencyof body gyroscope mean along Y Axis
MeanOfFrequencyBodyGyroscopeMeanZAxis :  mean  of frequencyof body gyroscope mean along Z Axis
MeanOfFrequencyBodyGyroscopeStdDevXAxis :  mean  of frequencyof body gyroscopeStdDevalong X Axis
MeanOfFrequencyBodyGyroscopeStdDevYAxis :  mean  of frequencyof body gyroscopeStdDevalong Y Axis
MeanOfFrequencyBodyGyroscopeStdDevZAxis :  mean  of frequencyof body gyroscopeStdDevalong Z Axis
MeanOfFrequencyBodyAccelerationMagnitudeMean :  mean  of frequencyof body acceleration Magnitude mean 
MeanOfFrequencyBodyAccelerationMagnitudeStdDev :  mean  of frequencyof body acceleration MagnitudeStdDev
MeanOfFrequencyBodyBodyAccelerationJerkMagnitudeMean :  mean  of frequencyBodyof body acceleration  Jerk Magnitude mean 
MeanOfFrequencyBodyBodyAccelerationJerkMagnitudeStdDev :  mean  of frequencyBodyof body acceleration  Jerk MagnitudeStdDev
MeanOfFrequencyBodyBodyGyroscopeMagnitudeMean :  mean  of frequencyBodyof body gyroscopeMagnitude mean 
MeanOfFrequencyBodyBodyGyroscopeMagnitudeStdDev :  mean  of frequencyBodyof body gyroscopeMagnitudeStdDev
MeanOfFrequencyBodyBodyGyroscopeJerkMagnitudeMean :  mean  of frequencyBodyof body gyroscope Jerk Magnitude mean 
MeanOfFrequencyBodyBodyGyroscopeJerkMagnitudeStdDev :  mean  of frequencyBodyof body gyroscope Jerk MagnitudeStdDev

