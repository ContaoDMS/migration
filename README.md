DocumentManagementSystem - Migration
====================================

Some helping files to migrate the old [DokManSystem] to the new [DocumentManagementSystem].

Database
---

! DO NOT UPDATE DATABASE VIA CONTAO !
- Excute each file in folder `sql` in the given order (e.g. via PhpMyAdmin).
...
- Now, update the database via backend

Templates
---------

Use `templates/renaming.txt` to rename yout templates.

Files
-----

- rename all files: add '_0' to version string (will be the patch number)

Contao
------

- Delete entries from localconfig.php starting with `dokmansystem_`
- Go to settings and define base directory and check other options as you like
- Edit and store your moduls (listing and management)
- Check categories and access rights
