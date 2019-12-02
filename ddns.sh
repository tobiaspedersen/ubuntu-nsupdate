#!/bin/bash

a="1"

CACHELOCATION="/cache/"
mkdir -p "$CACHELOCATION"

while [ true ]
do
        while [ $a -le $NUMHOST ]
        do
                FILE="HOST""$a"
                CACHE="$CACHELOCATION""${!FILE}"
                echo "checking for ip change for domain: "${!FILE}""
                touch "$CACHE"
                echo "done"
                
                IP=$(wget -q https://api.ipify.org/ -O -)
                
                if [ "$IP" != "$(cat $CACHE)" ] ; then
                        printf "server $SERVER\nzone $ZONE\nupdate delete "${!FILE}" A\nupdate add "${!FILE}" 60 A $IP\nsend\nquit" | nsupdate -y $ZONE:$KEY && echo -n $IP > $CACHE
                        echo "changed ip-address for: " "${!FILE}"
                fi

                a=$((a+1))
        done
sleep 10
a="1"
done
