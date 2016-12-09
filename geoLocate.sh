# 
# Usage: echo "xxx.yyy.ccc.aaa" | geoLocate.sh
#

while read line
do
    ipcim=$line
    

    
    curl -s --data "IP=$ipcim" http://software77.net/geo-ip/ >/tmp/.kib_loc
    CIDR=`cat /tmp/.kib_loc | grep ALTBG-0| cut -d$'\n' -f5|cut -d'>' -f2|cut -d'<' -f1`
    CIDR1=`cat /tmp/.kib_loc | grep ALTBG-1| cut -d$'\n' -f7|cut -d'>' -f2|cut -d'<' -f1`
    CIDR2=`cat /tmp/.kib_loc | grep ALTBG-1| cut -d$'\n' -f6|cut -d'>' -f2|cut -d'<' -f1`

    echo $ipcim $CIDR $CIDR2 $CIDR1

done < "${1:-/dev/stdin}"
