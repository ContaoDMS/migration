-- **********************************************************
-- *                                                        *
-- * IMPORTANT NOTE                                         *
-- *                                                        *
-- * This file has to be imported manually                  *
-- * The install tool will ignore it!                       *
-- *                                                        *
-- **********************************************************

UPDATE tl_dms_documents SET upload_date = UNIX_TIMESTAMP(STR_TO_DATE(upload_date, '%Y%m%d')) WHERE NOT upload_date = '';

UPDATE tl_dms_documents SET lastedit_date = UNIX_TIMESTAMP(STR_TO_DATE(lastedit_date, '%Y%m%d')) WHERE NOT lastedit_date = '';

-- in case there is a time difference, us the following code to update this
UPDATE tl_dms_documents SET upload_date = (upload_date + (2 * 60 * 60)) WHERE upload_date > 0;
UPDATE tl_dms_documents SET lastedit_date = (lastedit_date + (2 * 60 * 60)) WHERE lastedit_date > 0;
