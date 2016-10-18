#!/bin/bash
 
#java -jar /home/nagios/cmx-tools-synthetic-tran-3.2.3.3-jar-with-dependencies.jar -emailaddress arvind.kumar@hpe.com -url https://cmx-us.connected.com:443 -scenario uploadSync -appMaxRunTime 60000 >/tmp/cmx_upload.txt;

if grep -q "ERROR" /home/centos/uploadSync.txt; then
 echo -e "UPLOADSYNC FAILED"
 exit 2
fi

if grep -q "WARNING" /home/centos/uploadSync.txt; then
 echo -e " UPLOADSYNC FAILED"
 exit 2
fi

if grep -q "OK" /home/centos/uploadSync.txt; then
 echo -e "UPLOADSYNC WAS SUCCESSFUL "
 exit 0
fi
~ 
