dataset <- data.table::fread("data-raw/train.csv", header = FALSE, sep = ",")
names(dataset) <- c("score", "title", "comment")

nms <- paste(
  sample(charlatan:::person_en_us$first_names, nrow(dataset), TRUE), 
  sample(charlatan:::person_en_us$last_names, nrow(dataset), TRUE)
)

date <- sample(0:as.numeric(as.POSIXct("2010-01-01")), nrow(dataset), TRUE)
date <- as.POSIXct(date, origin = "1970-01-01")

dataset[
  , `:=`(
    score = NULL,
    name = nms, 
    date = date
  )
][order(date)]

data.table::fwrite(dataset, "datasetwithusers.csv")