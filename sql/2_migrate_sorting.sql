-- **********************************************************
-- *                                                        *
-- * IMPORTANT NOTE                                         *
-- *                                                        *
-- * This file has to be imported manually                  *
-- * The install tool will ignore it!                       *
-- *                                                        *
-- **********************************************************

UPDATE tl_dms_categories cat,
 (SELECT @rownum := @rownum + 1 ROWNUM, t.id ID 
 FROM
 (SELECT @rownum := 0) r,
 (SELECT * FROM tl_dms_categories ORDER BY pid, name) t) tsub
SET cat.sorting = (tsub.ROWNUM *64)
WHERE cat.id = tsub.ID;

-- ------------------------------------------------------------------

UPDATE tl_dms_access_rights acr,
 (SELECT @rownum := @rownum + 1 ROWNUM, t.id ID 
 FROM
 (SELECT @rownum := 0) r,
 (SELECT tl_dms_access_rights.* FROM tl_dms_access_rights JOIN tl_member_group ON tl_dms_access_rights.member_group = tl_member_group.id ORDER BY tl_dms_access_rights.pid, tl_member_group.name) t) tsub
SET acr.sorting = (tsub.ROWNUM *64)
WHERE acr.id = tsub.ID;

-- ------------------------------------------------------------------

UPDATE tl_dms_documents doc,
 (SELECT @rownum := @rownum + 1 ROWNUM, t.id ID 
 FROM
 (SELECT @rownum := 0) r,
 (SELECT * FROM tl_dms_documents ORDER BY pid, name, version_major, version_minor, version_patch) t) tsub
SET doc.sorting = (tsub.ROWNUM *64)
WHERE doc.id = tsub.ID;
