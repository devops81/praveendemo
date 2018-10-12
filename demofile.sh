#!/bin/bash

current_usage=$( df -h | grep '/dev/simfs' | awk {'print $5'} )
max_usage=90%

if [ ${current_usage%?} -ge ${max_usage%?} ]; then
    mailbody="Max usage exceeded. Your disk usage is at ${current_usage}."
    echo "Sending mail..."
    echo ${mailbody} | mail -s "Disk alert!" "yourown@mail.tld"
elif [ ${current_usage%?} -lt ${max_usage%?} ]; then
    echo "No problems. Disk usage at ${current_usage}." > /dev/null
fi
