#!/bin/bash
#curl --user arvind.kumar@hpe.com:Noki@e63 https://cmxsso-us.connected.com/auth/realms/CMX/tokens/login?client_id=CMX_App
 
#java -jar /home/nagios/cmx-tools-synthetic-tran-3.2.3.3-jar-with-dependencies.jar -emailaddress arvind.kumar@hpe.com -url https://cmx-us.connected.com:443 -scenario uploadBackup -appMaxRunTime 60000 >/tmp/cmx_backup.txt;


if grep -q "ERROR" /home/centos/uploadBackup.txt; then
 echo -e "UPLOADBACKUP FAILED"
 exit 2
fi

if grep -q "WARNING" /home/centos/uploadBackup.txt; then
 echo -e " UPLOADBACKUP FAILED"
 exit 2
fi

if grep -q "OK" /home/centos/uploadBackup.txt; then
 echo -e "UPLOADBACKUP WAS SUCCESSFUL "
 exit 0
fi

