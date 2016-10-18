for i in uploadBackup uploadSync search notification
do

java -jar cmx-tools-synthetic-tran-3.2.3.3-jar-with-dependencies.jar -emailaddress arvind.kumar@hpe.com -url https://cmx-uk.connected.com:443 -scenario $i -appMaxRunTime 80000 > /home/centos/$i.txt;
      
 cat /home/centos/$i.txt;

done
