# clientsdb

Have you ever been looking for a ready to use database while doing training? 
Search no more, this docker is an image with a client review database inside a postgre, to be used for teaching.

The titles and comments are extracted from the [Amazon review database](https://www.kaggle.com/bittlingmayer/amazonreviews) which lead to a [Google Drive](https://drive.google.com/drive/folders/0Bz8a_Dbh9Qhbfll6bVpmNUtUcFdjYmF2SEpmZUZUcVNiMUw1TWN6RDV3a0JHT3kxLVhVR2M) link that contains "amazon_review_full_csv.tar.gz" (the original dataset used here).
Then the two columns date and name being randomly generated in R. 

The code to prepare the dataset is in [data-prep.R](data-prep.R) — the dataset is not on GitHub because of space concerns. 

The main purpose of this image is to provide a "real life" tool for teaching databases. 

Info: 
- the POSTGRES_DB used is clients
- the POSTGRES_PASSWORD is verysecretwow
- the POSTGRES_USER is superduperuser

To launch the db, do: 

```
docker run --rm -d -p 5432:5432 colinfay/clientdb:latest
```

Then, for example from R: 

```r
library(DBI)

con <- dbConnect(
  RPostgres::Postgres(),
  dbname = 'clients', 
  host = 'localhost',
  port = 5432, 
  user = 'superduperuser',
  password = 'verysecretwow'
)

dbListTables(con)
# [1] "clients"
res <- dbSendQuery(con, "SELECT title, name, date FROM clients LIMIT 5")
dbFetch(res)
#                                   title              name       date
# 1                    more like funchuck        Rolf Feest 1998-05-12
# 2                             Inspiring        Skye Sipes 2002-12-15
# 3 The best soundtrack ever to anything. Timothy Schneider 1983-06-11
# 4                      Chrono Cross OST    Rosey Schimmel 1974-06-19
# 5                   Too good to be true     Giovanni Metz 1972-02-18
```