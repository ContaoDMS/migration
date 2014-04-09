-- **********************************************************
-- *                                                        *
-- * IMPORTANT NOTE                                         *
-- *                                                        *
-- * This file has to be imported manually                  *
-- * The install tool will ignore it!                       *
-- *                                                        *
-- **********************************************************

UPDATE tl_dms_documents SET data_file_name = SUBSTRING(data_file_name, 1, (LENGTH(data_file_name) - LOCATE(".", REVERSE(data_file_name))));
UPDATE tl_dms_documents SET keywords = REPLACE(keywords, ",", " ");
