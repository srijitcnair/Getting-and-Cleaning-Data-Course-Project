
#First reading the data from teh files

#Read the train data
train_x <- read.table("train/X_train.txt")
train_y <- read.table("train/y_train.txt")
train_s<-read.table("train/subject_train.txt")

#Read the test data
test_x<-read.table("test/X_test.txt")
test_y<-read.table("test/y_test.txt")
test_s<-read.table("test/subject_test.txt")

#Merge the train and test data
full_x <- rbind(train_x,test_x)
full_y <- rbind(train_y,test_y)
full_s <- rbind(train_s,test_s)

#Read the list of all features 
features <- read.table("features.txt")

#Now we need to pick only those features which are mean and std
#We will record ID and names.. names will be given to columns later
mean_std_col_names <- features[grep("-mean\\(\\)|-std\\(\\)", features$V2), 2]
mean_std_col_ids <- features[grep("-mean\\(\\)|-std\\(\\)", features$V2), 1]
mean_std_col_ids <- paste("V",mean_std_col_ids, sep="")

#Now extract only those X data that refers to mean and std
required_x <- full_x[, mean_std_col_ids]

#Now read the list of activities
activities <- read.table("activity_labels.txt")

#To the fully, add the activities as another column
activities_with_name <- cbind(full_y,activities[full_y[,1],2])

#Now we are ready to build the final clean data table
#Before that let us name the columns to proper names
names(full_s)<-c("SubjectId")
names(activities_with_name)<-c("ActivityId","ActivityName")
names(required_x)<-mean_std_col_names

#Combine all datatables to one
tidy_data <-cbind(full_s, activities_with_name, required_x)

#Create the result table that contain the mean of each field grouped by subject id and activity id
final_data<-aggregate(tidy_data[,4:ncol(tidy_data)],by=list("SubjectId"=tidy_data$SubjectId, "ActivityId"=tidy_data$ActivityName), mean)

write.table(final_data,"final_data.txt")
