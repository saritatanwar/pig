--CREATING A RELATION BY LOADING USER DATA FILE
users = LOAD '/user/maria_dev/employees.csv' 
USING PigStorage(',') 
AS (empName:chararray, empID:int, age:int, salary:chararray);

--LOADING THE USERS IN HBASE TABLE
STORE users INTO 'hbase://users' 
USING org.apache.pig.backend.hadoop.hbase.HBaseStorage ('empinfo:empName,empinfo:empID,empinfo:age,empinfo:salary');