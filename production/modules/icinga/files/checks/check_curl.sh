url=$1
a=$(echo "$url" | cut -c9-14)

case $a in
     cmx-us)
          b=$(curl -i -sLI "$url" | head -n 1 | awk '{print $2}')
               if [ ! -z $b ] && [ $b -eq "200"  ]
                  then
                         echo "STATUS":"OK"
                         exit 0
                else
                        echo "Invalid error code : $b"
                        exit 2
               fi
          ;;


      cmx-uk)
          b=$(curl -i -sLI "$url" | head -n 1 | awk '{print $2}')
               if [ ! -z $b ] && [ $b -eq "200"  ]
                  then
                         echo "STATUS":"OK"
                         exit 0
                else
                        echo "Invalid error code : $b"
                        exit 2
               fi
          ;;




     cmxnot)
          b=$(curl -i -sLI "$url" | head -n 1 | awk '{print $2}')
               if [ ! -z $b ] && [ $b -eq "503"  ]
                  then
                         echo "STATUS":"OK"
                         exit 0
                else
                        echo "Invalid error code : $b"
                        exit 2
               fi
          ;;
     cmxsso)
          b=$(curl -i -sLI "$url" | head -n 1 | awk '{print $2}')

               if [ ! -z $b ] && [ $b -eq "200"  ]
                  then
                         echo "STATUS":"OK"
                         exit 0
                else
                        echo "Invalid error code : $b"
                        exit 2
              fi
  ;;

esac

