#!/bin/bash
 
#for i in uploadBackup uploadSync search notification

#do

#java -jar /home/nagios/cmx-tools-synthetic-tran-3.2.3.3-jar-with-dependencies.jar -emailaddress arvind.kumar@hpe.com -url https://cmx-us.connected.com:443 -scenario $i -appMaxRunTime 60000 >/tmp/$i.txt;

if grep -q "ERROR" /home/centos/notification.txt; then
 echo -e "NOTIFICATION FAILED"
 exit 2
fi

if grep -q "WARNING" /home/centos/notification.txt; then
 echo -e " NOTIFICATION FAILED"
 exit 2
fi

if grep -q "OK" /home/centos/notification.txt; then
 echo -e "NOTIFICATION WAS SUCCESSFUL "
 exit 0
fi

#done
