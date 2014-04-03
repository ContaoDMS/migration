ContaoDMS - Migration
=====================

Some helping files for migrating existing data from old [DokManSystem] the [[Contao DMS]](https://github.com/ContaoDMS/dms).

Please read the complete guide first, before starting migration. Executing the steps in the given order is very important.

In case there are issues, please use the [tracker](https://github.com/ContaoDMS/migration/issues).


Extension update
----------------

- backup your file system and database and custom templates
- be careful when updating the extension, because it may happen that the DMS_DIRECTORY will be deleted (copy it before to another name)

**! DO NOT UPDATE DATABASE VIA CONTAO NOW !**

Database
--------

**! DO NOT UPDATE DATABASE VIA CONTAO !**
- Excute each file `1_migrate_tables.sql` from folder `sql` in the given order (e.g. via PhpMyAdmin).
- **! Now, update the database via backend !**
- Excute the remaining files from folder `sql` in the given order starting with `2_migrate_sorting.sql` (e.g. via PhpMyAdmin).

Templates
---------

See `templates/renaming.txt` to check the new names of the templates.

Files
-----

- manually rename all files: add `_0` to version string (will be the patch number)
OR
- use `files/rename.php` to rename all files automatically via script
 - copy `files/rename.php` to DokManSystem files directory
 - execute it **ONCE** in your browser (http://domain.tld/tl_files/DMS_DIRECTORY/rename.php)
 - maybe `.htaccess` must be deactivated temporarily

Contao
------

- Delete entries from localconfig.php starting with `dokmansystem_`
- Go to settings and define base directory and check other options as you like
- Edit and store your moduls (listing and management)
- Check categories and access rights
