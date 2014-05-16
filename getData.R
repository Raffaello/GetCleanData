#################################
# Get Data for run anaylis
##################################

if (!file.exists("./UCI HAR Dataset")) {
  message("Downloading Data...")
  
  fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  fz <- "getdata-projectfiles-UCI HAR Dataset.zip"
  
  if(Sys.info()["sysname"] == "Windows"){
    download.file(fileUrl1, fz)
  }
  else {
    download.file(fileUrl1, fz, method="curl")  
  }
  
  #dateDownloaded <- date()
  #print(dateDownloaded)
  message("Unzipping files...")
  fl <- unzip(fz, list=TRUE)
  unzip(fz, files=fl$Name)
  rm(fileUrl1)
  rm(fz)
  rm(fl)
}