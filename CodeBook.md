This file describes  the data, variables and any transformations done in this cleaning and getting peer assessed project.

Here are the sources of our data:
Original data source:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Data used for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

We use the file run_analysis.R to perform the following steps:
1) Download the data (from the sources shown above)
2) Merge the training and the test sets to create one data set.
    - Read training, testing, feature vector and activity label files
    - Assign column names
    - Merge all data in one set
3) Extracting only the measurements on the mean and standard deviation for each measurement
    - Read column names
    - Create vector for defining ID, mean and standard deviation
    - Create any nessesary subsets from the merged file AllInOne
4) Use bespoke and descriptive activity names to name the activities in the dataset
5) Label the dataset with descriptive variable names
6) Finally, create a second, independent tidy data set with the average of each variable for each activity and each subject
    - Create a second tidy dataset
    - Write second tidy dataset in txt file


Variable information:
    x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.
    x_data, y_data and subject_data merge the previous datasets in order to conduct further analysis.
    features contains the correct names for the x_data dataset, which are applied to the column names.
