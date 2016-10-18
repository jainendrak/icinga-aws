Connected MX External Monitoring

These are plugins being used for monitoring CMX functionality externally . 


Features 
* Monitoring all 4 scenario (uploadSync,UploadBackup,Search & notification)
* Monitoring all 3 endpoints (API,SSO & Notification)
* Monitoring the SSL certificate validity 

Installation 

Puppet will be configuring the Icinga configuration files (services.conf and command.conf) and copy the check plugins to /usr/lib64/nagios/plugins/

Usages

cmx-check.sh  :- 
	This script have been put in crontab which runs every 15 mins and stores the o/p to /home/centos as txt files

check_backup.sh/check_notification.sh/check_search.sh/check_upload.sh/check_notification :-
	These scripts are running and checking respective scenario and greps for ERROR/WARN/GOOD and returs the exit code accordingly .
	
check_curl.sh :-
   This scripts takes web url as argument and check for  response codes (200/503) and returns exit code accordingly 
   
check_ssl.sh :-
	This script takes web url (cmx-us.connected.com /cmx-uk.connected.com)  greps the SSL expiry date and compares with current date .If the diff is 7 days or less it will throw critical error 
	
	