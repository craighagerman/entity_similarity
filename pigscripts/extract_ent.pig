-- load_metadata

-- USAGE:
--		mortar local:run pigscripts/load_metadata.pig


-- Set our input and output path as pig parameters
-- %default INPUT_PATH '/Users/craig/Wattpad/Code_wattpad/data/representative_metadata/fiction_train.csv'
%default INPUT_PATH '/Users/craig/Wattpad/Code_wattpad/similarity/entity_similarity/data_sample.pig'
%default OUTPUT_PATH '/Users/craig/Wattpad/Code_wattpad/data/representative_metadata/out'




-- Register the python functions we use in the pigscript
REGISTER '../udfs/python/experiment.py' USING streaming_python AS exp;
--REGISTER '../udfs/python/SampleLib.py' USING jython AS myfuncs;



input_data  = LOAD '/Users/craig/Wattpad/Code_wattpad/data/representative_metadata/fiction_train.csv'
    USING org.apache.pig.piggybank.storage.CSVExcelStorage(',') AS (
       groupid:int, title:chararray, tag:chararray, descr:chararray
   );


-- input_data  = LOAD '/Users/craig/Wattpad/Code_wattpad/data/representative_metadata/fiction_train.csv'
--     USING org.apache.pig.piggybank.storage.CSVExcelStorage(',') AS (
--         groupid:int
--     );
-- DUMP input_data;
DESCRIBE input_data;
data_lim = LIMIT input_data 10;
DUMP data_lim;

-- X = FOREACH input_data GENERATE exp.helloworld();
X = FOREACH input_data GENERATE exp.square(groupid);

DESCRIBE X;	






-- b = foreach input_data generate myfuncs.helloworld(), myfuncs.square(groupid);
-- DESCRIBE b
-- DUMP b



  
-- LIMIT 
-- data_limit = LIMIT input_data 10;
-- GROUPBY
-- data_grp = GROUP  input_data BY groupid
-- DESCRIBE data_grp
-- FOREACH ... GENERATE
-- groupid_sum = FOREACH data_grp GENERATE group as title, SUM(input_data.groupid) as gid_count;

-- DUMP gid_sum;


