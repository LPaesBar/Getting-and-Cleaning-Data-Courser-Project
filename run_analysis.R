run_analysis <- function (files_dir){
    setwd(files_dir)
    test.data = read.table("X_test.txt")
    test.label = read.table("y_test.txt")
    test.subjects = read.table("subject_test.txt")
    train.data = read.table("X_train.txt")
    train.label = read.table("y_train.txt")
    train.subjects = read.table("subject_train.txt")
    activitylabels = read.table("activity_labels.txt")
    varnames = read.table("features.txt")
    varnames = as.vector(varnames$V2)
    colnames(test.data)= varnames
    colnames(train.data) = varnames
    mergeddata = rbind(test.data,train.data)
    b = subset(mergeddata,select = grep(".*mean.*|.*std.*",names(mergeddata)))
    c = grep(".*meanF.*",names(b),value = TRUE)
    mergeddata = b[,-which(names(b) %in% c)]
    subject = rbind(as.vector(test.subjects),as.vector(train.subjects))
    activity = rbind(as.vector(test.label),as.vector(train.label))
    mergeddata = cbind(activity,mergeddata)
    mergeddata = cbind(subject,mergeddata)
    colnames(mergeddata)[1] = "subject"
    colnames(mergeddata)[2] = "activity"
    activitylabels = as.vector(activitylabels[,2])
    mergeddata[,1]=as.factor(mergeddata[,1])
    mergeddata[,2]=as.factor(mergeddata[,2])
    levels(mergeddata$activity) = activitylabels
    library(dplyr)
    groupeddata = group_by(mergeddata,subject,activity)
    tidydata = summarize_each(groupeddata,funs(mean))
    write.table(tidydata,"tidy data.txt",row.names = FALSE)
}

