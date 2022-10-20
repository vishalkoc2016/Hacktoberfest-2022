#!/bin/bash
url='https://sample-videos.com/img/Sample-jpg-image-5mb.jpg'
url='https://sample-videos.com/img/Sample-jpg-image-500kb.jpg'
max_speed=0

# proxy_list=("172.31.100.26" "172.31.100.25" "172.31.100.14" "172.31.100.27" "172.31.100.29" "172.31.100.30" "172.31.102.14" "172.31.102.29")
readarray -t proxy_list < ./proxy_list.txt
max_speed_proxy=""
for proxy in ${proxy_list[@]}; do
  if avg_speed=$(curl -x "edcguest:edcguest@"$proxy":3128" -qfsS -w '%{speed_download}' -o /dev/null --url "$url") 
  then
    if [ "$max_speed" -lt "${avg_speed%.*}" ];
    then {
      max_speed=${avg_speed%.*}
      max_speed_proxy=$proxy
      }
    fi
    else
      echo ""$proxy" not working" 
  fi
done
echo ""$max_speed_proxy" is the fastest";
