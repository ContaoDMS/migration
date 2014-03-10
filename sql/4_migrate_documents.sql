-- **********************************************************
-- *                                                        *
-- * IMPORTANT NOTE                                         *
-- *                                                        *
-- * This file has to be imported manually                  *
-- * The install tool will ignore it!                       *
-- *                                                        *
-- **********************************************************

UPDATE tl_dms_documents SET file_source = SUBSTRING(file_source, 1, (LENGTH(file_source) - LOCATE(".", REVERSE(file_source))));
