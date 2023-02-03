   # **Table of contents**
 --------------------------
 1. Overview about the code
 2. Prerequistes
 3. Step by step manual to configure the cron job
 4. How to run the backup on a specific time
 -------------------------------------------------
 
 ## **1. Overview about the code:**
    -------------------------------
    A program to run a background backup every minute as a cron job. It only keeps the last n backup directories as specified by the user.
    Folder hierarchy:
    	1. cronJob
    		1. dir
    		2. backupdir
    			(contains maximum of n folders of backups adjustable according to the user)

 ## **2. Prerequistes:**
     --------------------
    2.1 To setup the crontab:
    	1. Open your terminal on your Ubuntu Linux.
    	2. Type "crontab -e"
    	3. To use the default editor press Enter.
    	
  ## **3. Step by step instructions to activate the cron job:**
     ---------------------------------------------------
     1. Open backup-cron.sh.
     2. Modify lines 3,4,5,6 with the their absolute paths.
     3. Adjust line 7 with the number of maximum backups you want.
     4. Save the backup-cron.sh.
     5. Open the terminal and type "cd lab2/cronJob".
     6. Type "crontab -e" then press Enter and scroll all the way down.
     7. Write the following statement in the crontab "01 * * * * /the/path/to/the/script"
     8. Save (ctrl + s) then exit the crontab (ctrl + x).
     
  ## **4. How to run the backup on a specific time:**
     ------------------------------------------------
     1. Open the crontab (crontab -e) and scroll all the way down.
     2. If you want to run the backup every 3rd Friday of the month at 12:31 am
     	type "31 00 15-21 * * test $(date +\%u) -eq 5 && /home/mariem/cronJob/backup-cron.sh"
     	where 15-21 refers to the third week of the month, %u gets the day of the week as a number and 5 refers to friday. 
     
  
