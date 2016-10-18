url=$1
a=$(curl -v --silent "$url" --stderr - | grep expire | awk '{print $4,$5,$7}')
b=$(echo "$a" | cut -c1-3)
c=$(echo "$a" | cut -c5-6)
d=$(echo "$a" | cut -c8-11)
#echo "$b"


case $b in
     Jan)
          dat=$(echo "$d"-"01"-"$c")
          ;;
     Feb)
          dat=$(echo "$d"-"02"-"$c")
          ;;
     Mar)
          dat=$(echo "$d"-"03"-"$c")
         ;;
     Apr)
         dat=$(echo "$d"-"04"-"$c")
          ;;
     May)
        dat=$(echo "$d"-"05"-"$c")
          ;;
     Jun)
        dat=$(echo "$d"-"06"-"$c")
         ;;
     Jul)
        dat=$(echo "$d"-"07"-"$c")
          ;;
     Aug)
        dat=$(echo "$d"-"08"-"$c")
          ;;
     Sep)
        dat=$(echo "$d"-"09"-"$c")
         ;;
     Oct)
        dat=$(echo "$d"-"10"-"$c")
          ;;
     Nov)
        dat=$(echo "$d"-"11"-"$c")
          ;;
     Dec)
        dat=$(echo "$d"-"12"-"$c")
         ;;

esac

#echo "$dat"



D1=`date +%s -d "$dat"`
D2=`date +%s `
((diff_sec=D1-D2))
a=$(echo - | awk -v SECS=$diff_sec '{printf SECS/(60*60*24)}')
b=$(echo "${a%%.*}")
if [ $b -gt 7 ]
then
echo "SSL CERT IS VALID"
exit 0
else
echo "SSL CERT IS EXPIRING IN 7 DAYS or LESS "
exit 2
fi
