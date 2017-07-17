#!/bin/bash

MODEL=bgbsb1
LOGFILE=${MODEL}_nolog
echo ${LOGFILE}
EXPT=5
for i in {1..10}; do
    echo "Run $i" >> ${LOGFILE}.txt
    /usr/bin/time -f "Totalseconds: %e" -o timeout.txt ./convert_script_s2b -m ~/models/GPR-BSB/${MODEL} -e${EXPT} temp/${LOGFILE} | tail -n 2 >> ${LOGFILE}.txt

    cat timeout.txt >> ${LOGFILE}.txt
done
