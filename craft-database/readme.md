Only compatible with MAMP!

Navigate to /frontend-base (where the nodescripts are stored)
1. to backup, call script "npm run-script backupdb"

2. to restore, make sure you have an (empty) database on your mamp environment called craftmorkborg
        a. /applications/mamp/library/bin/mysql -uroot -proot
        b. create database craftmorkborg;
        c. exit;
3. to restore, place the db-dump.sql file in ~/
4. to restore, call script "npm run-script restoredb"
5. log in to admin panel with admin // adminadmin