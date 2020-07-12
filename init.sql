CREATE TABLE clients
(
  title text,
  comment text,
  name text,
  date date
);
COPY clients(title,comment,name,date) 
FROM '/datasetwithusers.csv' DELIMITER ',' CSV HEADER;