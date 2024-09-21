#The Required task marked with TASK NUMBER. There are 4 TASKS
# 1. Merge Data set (training and test data)
# 2. Extract only mean & std from each measurements
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Below are scripts step by step in getting the required task
#link to get file in local directory and store in  linkdir variable
#import activity_labels.txt and stored to activitylabels variable and name column as index and activity
#import features.txt and stored to features variable and name column as index and feature
#Import training set data
#import subject_train.txt and stored to subjecttrain variable and name column as subject_id
#import y_train.txt and store to activitytrain variable and name column as activity_id
#import x_train.txt and stored to trainmeas variable and name column to features$feature name

	linkdir <- getwd() 
	activitylabels <- read.csv("activity_labels.txt",header = FALSE, sep = "" ,col.names = c("activity_id","activity"))
	features <- read.csv("features.txt",header = FALSE, sep = "" ,col.names = c("index","feature"))
	subjecttrain <- read.csv(file.path(linkdir,"/train/subject_train.txt"),header = FALSE, sep = "" ,col.names = c("subject_id"))
	activitytrain <- read.csv(file.path(linkdir,"/train/y_train.txt"),header = FALSE, sep = "" ,col.names = c("activity_id"))
	trainmeas <- read.csv(file.path(linkdir,"/train/x_train.txt"),header = FALSE, sep = "" ,col.names = features$feature)


# TASK NUMBER 2 for train data --> select only required column/features (contains mean and std)
#generate traindata and add column dataset = train

	requiredfeatures <- grep("mean|std",features$feature,ignore.case = TRUE)
	requiredtrainmeas <- select(trainmeas,requiredfeatures)
	traindata <- cbind(dataset = "train",subjecttrain,activitytrain,requiredtrainmeas)

#similarly we ll generate for test set data
#import subject_test.txt and store to subjecttest variable and name column as subject_id
#import y_test.txt and store to activitytest variable and name column as activity_id
#import x_test.txt and stored to testmeas variable and name column to features$feature name

	subjecttest <- read.csv(file.path(linkdir,"/test/subject_test.txt"),header = FALSE, sep = "" ,col.names = c("subject_id"))
	activitytest <- read.csv(file.path(linkdir,"/test/y_test.txt"),header = FALSE, sep = "" ,col.names = c("activity_id"))
	testmeas <- read.csv(file.path(linkdir,"/test/x_test.txt"),header = FALSE, sep = "" ,col.names = features$feature)


#TASK NUMBER 2 for test data --> select only required column/features (contains mean and std)
#generate testdata and add column dataset = test

	requiredtestmeas <- select(testmeas,requiredfeatures)
	testdata <- cbind(dataset = "test",subjecttest,activitytest,requiredtestmeas)

#TASK NUMBER 1 --> combine dataset by combining traindata and testdata
	dataset <- rbind(traindata,testdata)

#TASK NUMBER 3 --> lookup the activity labels by activity id and rearrange columns
	readydataset <- select(left_join(dataset,activitylabels,by="activity_id",keep = TRUE),!starts_with("activity_id"))
#rearrange column
	readydataset <-select(readydataset,activity,dataset:angle.Z.gravityMean.)

#TASK NUMBER 4 --> cleaning features name which contain .
	names(readydataset) <- gsub('\\.','',names(readydataset))
	write.csv(readydataset,"1st_task_readydataset.csv",row.names = FALSE)

#TASK NUMBER 4 --> summarize based on activity and subject by mean
#change activity and subject_id variable class to factor, these columns located in column index 1&3
	readydataset[c(1,3)] <- lapply(readydataset[c(1,3)], factor)
	summarytidydata <- readydataset|> select(!dataset) |> group_by(activity,subject_id) |> summarize_all(mean,na.rm = TRUE)
	write.csv(summarytidydata,"2nd_task_summarytidydata.csv",row.names = FALSE)
