# Getting-and-Cleaning-Data-Course-Project
This is repo was created to share the Getting and Cleanning Data course project.
For this project, we used the Human Activity Recognition Using Smartphones Dataset about which we have the more info in the code book in this repo. From this dataset, we used the following files:

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

# Objective
Create a new, tidy dataset from the information in the original dataset. The analysis process to do this is described below.

# The analysis process

1.  Read into R each of the above files from a directory in the computer.
2.  Name the columns of both train and test sets with the ifo in the 'features.txt' file.
3.  Merge the train and the test sets, binding the rows of both dataframes.
4.  Select from the new dataframe only the columns with information about the mean and the standard deviation of each feature.
5.  Bind to the new dataframe the activity and subject columns from the "y_train.txt" and "y_test.txt" files in the same order the dataframes were binded.
6.  Name the activity and subject columns.
7.  Turn the subject and activity columns into factor variables in order to group them later.
8.   Link the number of the activity with its label in the 'activity_labels.txt label
9.   Group the dataframe by subject and activity.
10. Create a new data set by summarizing the info in the variables with the average of all observation of each subject by each activity.


