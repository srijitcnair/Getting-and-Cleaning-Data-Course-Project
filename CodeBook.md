##Code Book for the run analysis script
##Data definitions
* train_x : This is the train data from the accelerometers 7352 rows by 561 variables

* train_y : This is the activity information of the train_x data. This tells the activity for each row of train_x data. It is 7352 rows by 1 col

* train_s : This is the subject information of the train_x data. It is 7352 by 1 col. Each row has a subject id representing the subject from which data collected

* test_x : This is the test data from the accelerometers 2947 rows by 561 variables

* test_y : This is the activity information of the test_x data. This tells the activity for each row of test_x data. It is 2947 rows by 1 col

* test_s : This is the subject information of the test_x data. It is 2947 by 1 col. Each row has a subject id representing the subject from which data collected

* full_x : This is the combined test_x and train_x data. It is 10299 rows by 561 cols

* full_y : This is the combined test_y and train_y data. It is 10299 rows by 1 cols

* full_s : This is the combined test_s and train_s data. It is 10299 rows by 1 cols

* features : This the master list of feature code and the corresponding names. It is 561 rows by 2 cols

* mean_std_col_names : This is a vector of only the feature names that are either mean or standard deviation. The way we extract is by checking if the feature name has -mean() or -std() in it.

* mean_std_col_ids : This is a vector of only the columns ids that are either mean or standard deviation. The way we extract is by checking if the feature name has -mean() or -std() in it and concatenating the ID with "V".

* required_x : This is a subset of full_x that contains only the features that we need (the one that is either mean or std deviation). This is extracted by getting only the columns from full_x with the ids mean_std_col_ids 

* activities : Master list of all possible activities by code and description. 

* activities_with_name : This is a data table that has full_y and the corresponding activity name in the second columns. It has 10299 rows and 2 columns

* tidy_data : This is the final table that we want that has subject information, activity and the required data combined. It has 10299 rows and 69 columns

* final_data : This is the final calculated mean of each observation grouped by SubjectId and Activity Name. This data table has 180 rows and 68 cols. This data will be written to the "final_data.txt" file in the working directory.