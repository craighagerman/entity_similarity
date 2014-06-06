-- load_metadata

-- USAGE:
--		 mortar local:run pigscripts/extract_ent.pig


-- Set our input and output path as pig parameters
-- %default INPUT_PATH '/Users/craig/Wattpad/Code_wattpad/data/representative_metadata/fiction_train.csv'
%default INPUT_PATH '/Users/craig/Wattpad/Code_wattpad/similarity/entity_similarity/data_sample.pig'
%default OUTPUT_PATH '/Users/craig/Wattpad/Code_wattpad/data/representative_metadata/out'


REGISTER '../udfs/python/experiment.py' USING streaming_python AS nasa_logs;
REGISTER '../udfs/python/extract_ent.py' USING streaming_python as ent_ext;





-- load training data

X  = LOAD '/Users/craig/Wattpad/Code_wattpad/data/representative_metadata/fiction_train.csv'
    USING org.apache.pig.piggybank.storage.CSVExcelStorage(',') AS (
       groupid:int, title:chararray, tag:chararray, descr:chararray
   );



-- concat title, tags, description from X
entities = FOREACH X generate ent_ext.extract_ent(title, tag, descr);






-- load collocation list




-- DESCRIBE X;
-- data_lim = LIMIT X 10;
-- -- DUMP data_lim;

-- -- X = FOREACH X GENERATE exp.helloworld();
-- groups = FOREACH X GENERATE ent_ext.helloworld(tag);

-- DESCRIBE groups; 
-- group_lim = LIMIT groups 10;
-- DUMP group_lim;

-- --------------------------------------------------------------------





-- save gensim corpus


-- save gensim dictionary


-- save lsi language model




