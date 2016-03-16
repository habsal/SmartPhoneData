# run_analysis.R File
The file contains  code to do necessary steps for the assignment of Getting and Cleaning Data Course at Coursera.  

First, the code reads data from web.

Raw data of the project can be found at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
For more details  : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Then it extracts data to the local directory. Even the data exists, we overwrite it. So, if needed please create a brand-new folder and assign it as working directory.

Then we read necessary data, mentioned in the assignment. We read tables, add coulumn names and merge the files to reach a one big dataset.

As it is demanded, only variables containing mena and standart deviation information extracted from the initial huge data set.

Activity names are added to the data set. And variables names are transformed to a meaningful ones.

Additionally we add subject and the activity to the dataset when needed.

At the final step, we get averages of variables by subject id and activity types. We created the names of the new aggregate variables.

Then we created the csv version of the tidy data at the working directory.

Later we showed the result at the screen too.






