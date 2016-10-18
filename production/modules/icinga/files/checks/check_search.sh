#!/bin/bash
 
#java -jar /home/nagios/cmx-tools-synthetic-tran-3.2.3.3-jar-with-dependencies.jar -emailaddress arvind.kumar@hpe.com -url https://cmx-us.connected.com:443 -scenario search -appMaxRunTime 60000 >/tmp/cmx_search.txt;

if grep -q "ERROR" /home/centos/search.txt; then
 echo -e "SEARCH FAILED"
 exit 2
fi

if grep -q "WARNING" /home/centos/search.txt; then
 echo -e " SEARCH FAILED"
 exit 2
fi

if grep -q "SERVICE_UNAVAILABLE" /home/centos/search.txt; then
 echo -e " SERVICE_UNAVAILABLE "
 exit 1
fi

if grep -q "OK" /home/centos/search.txt; then
 echo -e "SEARCH WAS SUCCESSFUL "
 exit 0
fi
~ 
