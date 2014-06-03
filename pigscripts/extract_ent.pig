-- load_metadata

-- USAGE:
--		mortar local:run pigscripts/load_metadata.pig


-- Set our input and output path as pig parameters
-- %default INPUT_PATH '/Users/craig/Wattpad/Code_wattpad/data/representative_metadata/fiction_train.csv'
%default INPUT_PATH '/Users/craig/Wattpad/Code_wattpad/similarity/entity_similarity/data_sample.pig'
%default OUTPUT_PATH '/Users/craig/Wattpad/Code_wattpad/data/representative_metadata/out'




-- Register the python functions we use in the pigscript
REGISTER '../udfs/python/experiment.py' USING streaming_python AS exp;



input_data  = LOAD '/Users/craig/Wattpad/Code_wattpad/data/representative_metadata/fiction_train.csv'
    USING org.apache.pig.piggybank.storage.CSVExcelStorage(',') AS (
        groupid:int, title:chararray, tag:chararray, descr:chararray
    );


-- DUMP input_data;

X = FOREACH input_data GENERATE exp.printlen(descr) AS len_fields;







  
-- LIMIT 
-- data_limit = LIMIT input_data 10;
-- GROUPBY
-- data_grp = GROUP  input_data BY groupid
-- DESCRIBE data_grp
-- FOREACH ... GENERATE
-- groupid_sum = FOREACH data_grp GENERATE group as title, SUM(input_data.groupid) as gid_count;

-- DUMP gid_sum;


