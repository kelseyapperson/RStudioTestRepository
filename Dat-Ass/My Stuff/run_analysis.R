#Have user download data then prompt for path and store in variable MainFolderDirectory
#MainFolderDirectory <- readline(prompt="Please enter path to UCI HAR Dataset folder including / at end")

#Updated per prompt to set MainFolderDirectory = Working Directory
MainFolderDirectory <- getwd()

#Set paths of subfolders using MainFolderDirectory
x_test_path <- paste(MainFolderDirectory,"test/X_test.txt", sep="")
y_test_path <- paste(MainFolderDirectory,"test/y_test.txt", sep="")
x_train_path <- paste(MainFolderDirectory,"train/X_train.txt", sep="")
y_train_path <- paste(MainFolderDirectory,"train/y_train.txt", sep="")
features_path <- paste(MainFolderDirectory, "features.txt", sep="")
subject_train_path <- paste(MainFolderDirectory, "train/subject_train.txt", sep="")
subject_test_path <- paste(MainFolderDirectory, "test/subject_test.txt", sep="")

#Read data into R
x_test <- read.table(x_test_path)
y_test <- read.table(y_test_path)
x_train <- read.table(x_train_path)
y_train <- read.table(y_train_path)
features <- read.table(features_path)
subject_train <- read.table(subject_train_path)
subject_test <- read.table(subject_test_path)

#Join Subject, Set and Labels for Test and Train Data
test <- cbind(x_test, y_test,subject_test)
train <- cbind(x_train, y_train, subject_train)

#Join Test and Train Data for Master Data Set
master_data <- rbind(test, train)

#transpose features table and replace names of master_data with feature names
features_t <- as.data.frame(t(features))
names(master_data) <- features_t[2,]

#Segment Master Data Set to only include mean and standard deviation measurements and activity, rename activity column
sub_data_mean <- master_data[ , grepl("mean", names(master_data))]
sub_data_std <- master_data[ , grepl("std", names(master_data))]
sub_data_activity <- master_data[, 562:563]
sub_data <- cbind(sub_data_std, sub_data_mean, sub_data_activity)
colnames(sub_data)[80] <- "Activity"
colnames(sub_data)[81] <- "Subject"

#Rename activity number values to reflect activity label

sub_data$Activity[sub_data$Activity==1] <- "Walking"
sub_data$Activity[sub_data$Activity==2] <- "Walking_Upstairs"
sub_data$Activity[sub_data$Activity==3] <- "Walking_Downstairs"
sub_data$Activity[sub_data$Activity==4] <- "Sitting"
sub_data$Activity[sub_data$Activity==5] <- "Standing"
sub_data$Activity[sub_data$Activity==6] <- "Laying"

#Create new data set with average of each variable for each activity and each subject
mean_data <- sub_data %>%
            group_by(Activity, Subject) %>%
            summarize_all(mean)
