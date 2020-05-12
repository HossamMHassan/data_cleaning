
# load the reshape2
library(reshape2)

## Merges the training and the test sets to create one data set

# read data into data frames
subject_train <- read.table("subject_train.txt")
subject_test <- read.table("subject_test.txt")
X_train <- read.table("X_train.txt")
X_test <- read.table("X_test.txt")
y_train <- read.table("y_train.txt")
y_test <- read.table("y_test.txt")

# add column name for subject files
names(subject_train) <- "ID"
names(subject_test) <- "ID"

# add names for measurement files
features <- read.table("features.txt")
names(X_train) <- features$V2
names(X_test) <- features$V2

# add names for label files
names(y_train) <- "activity"
names(y_test) <- "activity"

# create one dataset
train <- cbind(subject_train, y_train, X_train)
test <- cbind(subject_test, y_test, X_test)
dt <- rbind(train, test)


##  Extracts only the measurements on the mean and standard deviation for each measurement.

#columns contain "mean()" or "std()"
cols <- grepl("mean|std|ID|activity",colnames(dt))

# the necessary columns
dt <- dt[,cols]


# Use descriptive activity names to name the activities in the data set.

activity_labels <- read.table("activity_labels.txt")
dt$activity <- factor(dt$activity, labels= activity_labels$V2)


# Appropriately labels the data set with descriptive variable names.
names(dt) <- gsub("Acc", "Acceleration", names(dt))
names(dt) <- gsub("^t", "Time", names(dt))
names(dt) <- gsub("^f", "Frequency", names(dt))
names(dt) <- gsub("BodyBody", "Body", names(dt))
names(dt) <- gsub("mean\\(\\)", "Mean", names(dt))
names(dt) <- gsub("std\\(\\)", "Std", names(dt))
names(dt) <- gsub("Freq", "Frequency", names(dt))
names(dt) <- gsub("Mag", "Magnitude", names(dt))


# create the tidy data set
m <- melt(dt, id=c("ID","activity"))
tidy_data <- dcast(m, ID+activity ~ variable, mean)

# write the tidy data set to a file
write.csv(tidy_data, "tidy_data.csv", row.names=FALSE)
