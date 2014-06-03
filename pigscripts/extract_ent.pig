-- load_metadata

-- USAGE:
--		mortar local:run pigscripts/load_metadata.pig


-- Set our input and output path as pig parameters
%default INPUT_PATH '/Users/craig/Wattpad/Code_wattpad/data/representative_metadata/fiction_train.csv'
%default OUTPUT_PATH '/Users/craig/Wattpad/Code_wattpad/data/representative_metadata/out'






-- Set our input and output path as pig parameters
%default INPUT_PATH 's3n://mortar-example-data/airline-data'
%default OUTPUT_PATH 's3n://mortar-example-output-data/$MORTAR_EMAIL_S3_ESCAPED/airline-travel'

-- Register the python functions we use in the pigscript
REGISTER 'udfs/python/experiment.py' USING streaming_python AS exp;




input_data  = LOAD '/Users/craig/Wattpad/Code_wattpad/data/representative_metadata/fiction_train.csv'
    USING org.apache.pig.piggybank.storage.CSVExcelStorage(',') AS (
        groupid:int, title:chararray, tag:chararray, desc:chararray
    );


X = FOREACH input_data GENERATE exp.printlen((title, tag, desc);



  
-- LIMIT 
-- data_limit = LIMIT input_data 10;
-- GROUPBY
-- data_grp = GROUP  input_data BY groupid
-- DESCRIBE data_grp
-- FOREACH ... GENERATE
-- groupid_sum = FOREACH data_grp GENERATE group as title, SUM(input_data.groupid) as gid_count;

-- DUMP gid_sum;


