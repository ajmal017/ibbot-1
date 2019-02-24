#!/bin/bash -l
# Customize here the main script with your parameters

export scriptPath=$(dirname $0)
cd ${scriptPath}

LOGFILE=pro.log
./ibbot.rb -v --username $P123USR --password $P123PWD --import_pf PRO --import_sim 1557921:98 --logfile $LOGFILE --commit

if [ $? -ne 0 ];then
    tail -200 $LOGFILE > part-${LOGFILE}
    mail -s "IBBOT failed | $LOGFILE" $P123MAIL < part-${LOGFILE}
    rm part-${LOGFILE}
fi
