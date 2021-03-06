**Code Book**
This codebook describes the data used in this project and the processing required to create the resulting tidy data set.

**Experiment**
30 volunteers performed 6 different activities while wearing a smartphone. The smartphone record various data about their movements.

**Data files**
features.txt: Names of the 561 features.
activity_labels.txt: Names and IDs for each of the 6 activities.
X_train.txt: 7352 observations of the 561 features, for 21 of the 30 volunteers.
subject_train.txt: A vector of 7352 integers, denoting the ID of the volunteer-related to each of the observations in X_train.txt.
y_train.txt: A vector of 7352 integers, denoting the ID of the activity related to each of the observations in X_train.txt.
X_test.txt: 2947 observations of the 561 features, for 9 of the 30 volunteers.
subject_test.txt: A vector of 2947 integers, denoting the ID of the volunteer-related to each of the observations in X_test.txt.
y_test.txt: A vector of 2947 integers, denoting the ID of the activity related to each of the observations in X_test.txt.

**Processing steps**
All of the data files were imported to data tables, appropriate column names were added, and the training and test sets were combined into a single data set.
The measurements on the mean and standard deviation for each measurement were extracted.
The activity column's labels describing the activities were added. 
A tidy data set was created containing the mean of each feature for each subject and each activity. 
The tidy data set was output to a CSV file.
