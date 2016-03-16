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
- Main directory, activity_labels.txt
- Main directory, features.txt
- Train directory : subject_train.txt, X_train.txt, y_train
- Test directory : subject_test.txt, X_test.txt, y_test

Train and Test data is merged to reach the whole dataset.
Varibale and target variable names and categorical values are added to the dataset.
Then variables containing standart deviation or mean information is slected and average of them calculated grouping by Subject and Activity.
Since the names of variables was not clean, names are trasnformed to a more meaning ful version. Since ve aggreagted each variable, we added "MeanOf" to each variable name.

Finally we have :
  Subject : The person id whose moevements are collected. 1 to 30. 
  Motion  : Activity tyeps, "Walking", "Standing" etc.
  Mean of time and frequency values of activity tpes, 66 variables (normalized).
  For more details please see below:
    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
