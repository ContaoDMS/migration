-- **********************************************************
-- *                                                        *
-- * IMPORTANT NOTE                                         *
-- *                                                        *
-- * This file has to be imported manually                  *
-- * The install tool will ignore it!                       *
-- *                                                        *
-- **********************************************************

--
-- Table `tl_dms_categories`
--
RENAME TABLE `tl_dms_kategorie` TO `tl_dms_categories`;
ALTER TABLE `tl_dms_categories` DROP `pid`;
ALTER TABLE `tl_dms_categories` CHANGE `kt_parentid` `pid` int(10) unsigned NOT NULL default '0';
ALTER TABLE `tl_dms_categories` ADD KEY (`pid`);
ALTER TABLE `tl_dms_categories` CHANGE `kt_name` `name` varchar(64) NOT NULL default '';
ALTER TABLE `tl_dms_categories` CHANGE `kt_beschreibung` `description` text NULL;
ALTER TABLE `tl_dms_categories` CHANGE `kt_dateityp` `file_types` varchar(255) NOT NULL default '';
ALTER TABLE `tl_dms_categories` CHANGE `kt_dokument_lesen_grundsatz` `general_read_permission` char(1) NOT NULL default '';
ALTER TABLE `tl_dms_categories` CHANGE `kt_veroeffentlicht` `published` char(1) NOT NULL default '';

-- --------------------------------------------------------

--
-- Table `tl_dms_access_rights`
--
RENAME TABLE `tl_dms_zugriffsrechte` TO `tl_dms_access_rights`;
ALTER TABLE `tl_dms_access_rights` DROP `pid`;
ALTER TABLE `tl_dms_access_rights` CHANGE `zr_kategorieid` `pid` int(10) unsigned NOT NULL default '0';
ALTER TABLE `tl_dms_access_rights` ADD KEY (`pid`);
ALTER TABLE `tl_dms_access_rights` CHANGE `zr_mitgliedergruppenid` `member_group` int(10) unsigned NOT NULL default '0';
ALTER TABLE `tl_dms_access_rights` CHANGE `zr_dokument_lesen` `right_read` char(1) NOT NULL default '';
ALTER TABLE `tl_dms_access_rights` CHANGE `zr_dokument_upload` `right_upload` char(1) NOT NULL default '';
ALTER TABLE `tl_dms_access_rights` CHANGE `zr_dokument_loeschen` `right_delete` char(1) NOT NULL default '';
ALTER TABLE `tl_dms_access_rights` CHANGE `zr_dokument_editieren` `right_edit` char(1) NOT NULL default '';
ALTER TABLE `tl_dms_access_rights` CHANGE `zr_dokument_veroeffentlichen` `right_publish` char(1) NOT NULL default '';

-- --------------------------------------------------------

--
-- Table `tl_dms_documents`
--
RENAME TABLE `tl_dms_dokument` TO `tl_dms_documents`;
ALTER TABLE `tl_dms_documents` DROP `pid`;
ALTER TABLE `tl_dms_documents` CHANGE `dk_kategorieid` `pid` int(10) unsigned NOT NULL default '0';
ALTER TABLE `tl_dms_documents` ADD KEY (`pid`);
ALTER TABLE `tl_dms_documents` DROP `dk_speicherpfad`;
ALTER TABLE `tl_dms_documents` DROP `dk_speicherort`;
ALTER TABLE `tl_dms_documents` CHANGE `dk_name` `name` varchar(64) NOT NULL default '';
ALTER TABLE `tl_dms_documents` CHANGE `dk_beschreibung` `description` text NULL;
ALTER TABLE `tl_dms_documents` CHANGE `dk_stichworte` `keywords` varchar(255) NOT NULL default '';
ALTER TABLE `tl_dms_documents` CHANGE `dk_datei` `file_source` varchar(100) NOT NULL default '';
ALTER TABLE `tl_dms_documents` CHANGE `dk_dateityp` `file_type` varchar(3) NOT NULL default '';
ALTER TABLE `tl_dms_documents` CHANGE `dk_dateigroesse` `file_size` int(5) NOT NULL default '0';
ALTER TABLE `tl_dms_documents` CHANGE `dk_version_major` `version_major` int(3) unsigned NOT NULL default '0'; 
ALTER TABLE `tl_dms_documents` CHANGE `dk_version_minir` `version_minor` int(3) unsigned NOT NULL default '0'; 
ALTER TABLE `tl_dms_documents` CHANGE `dk_bild` `file_preview` varchar(64) NOT NULL default '';
ALTER TABLE `tl_dms_documents` CHANGE `dk_upload_userid` `upload_member` int(10) unsigned NOT NULL default '0';
ALTER TABLE `tl_dms_documents` CHANGE `dk_upload_datum` `upload_date` varchar(8) NOT NULL default '';
ALTER TABLE `tl_dms_documents` CHANGE `dk_lastedit_userid` `lastedit_member` int(10) unsigned NOT NULL default '0';
ALTER TABLE `tl_dms_documents` CHANGE `dk_lastedit_datum` `lastedit_date` varchar(8) NOT NULL default '';
ALTER TABLE `tl_dms_documents` CHANGE `dk_veroeffentlicht` `published` char(1) NOT NULL default '';