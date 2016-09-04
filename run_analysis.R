run_analysis <- function (files_dir){
    setwd(files_dir)  ## Set the working directory as the directory with all the files.
   
    ## Read the files in R
    test.data = read.table("X_test.txt")       
    test.label = read.table("y_test.txt")
    test.subjects = read.table("subject_test.txt")
    train.data = read.table("X_train.txt")
    train.label = read.table("y_train.txt")
    train.subjects = read.table("subject_train.txt")
    activitylabels = read.table("activity_labels.txt")
    varnames = read.table("features.txt")
    varnames = as.vector(varnames$V2)  ## Turn the features dataframe into a vector
    
    ## Change the columns names in both datasets and bind them into one
    colnames(test.data)= varnames
    colnames(train.data) = varnames
    mergeddata = rbind(test.data,train.data)
    
    ## Retrieve the wanted columns (the ones with the mean and std of the variables)
    b = subset(mergeddata,select = grep(".*mean.*|.*std.*",names(mergeddata)))
    c = grep(".*meanF.*",names(b),value = TRUE)
    mergeddata = b[,-which(names(b) %in% c)]
   
    ## Bind the subject and activity columns and name them
    subject = rbind(as.vector(test.subjects),as.vector(train.subjects))
    activity = rbind(as.vector(test.label),as.vector(train.label))
    mergeddata = cbind(activity,mergeddata)
    mergeddata = cbind(subject,mergeddata)
    colnames(mergeddata)[1] = "subject"
    colnames(mergeddata)[2] = "activity"
   
    ## Turn the activity and subject variables into factors
    activitylabels = as.vector(activitylabels[,2])
    mergeddata[,1]=as.factor(mergeddata[,1])
    mergeddata[,2]=as.factor(mergeddata[,2])
    levels(mergeddata$activity) = activitylabels ## Links the activity name to its number
   
    ## Groups the dataset by activity and subject
    library(dplyr)
    groupeddata = group_by(mergeddata,subject,activity)
   
    ## Create a new, tidy dataset by averaging all the observations of a subject for each activity
    tidydata = summarize_each(groupeddata,funs(mean))
    write.table(tidydata,"tidy data.txt",row.names = FALSE)
}

