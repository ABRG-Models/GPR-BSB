#!/bin/bash

# Create csv columns from the logs generated by run_bgbsb[13]*.sh

grep FINI bgbsb3_withlog.txt | awk -F ' ' '{print $2;}'  > bgbsb3_withlog_exe.csv
grep Total bgbsb3_withlog.txt | awk -F ' ' '{print $2;}'  > bgbsb3_withlog_total.csv
grep FINI bgbsb3_nolog.txt | awk -F ' ' '{print $2;}'  > bgbsb3_nolog_exe.csv
grep Total bgbsb3_nolog.txt | awk -F ' ' '{print $2;}'  > bgbsb3_nolog_total.csv

grep FINI bgbsb1_withlog.txt | awk -F ' ' '{print $2;}'  > bgbsb1_withlog_exe.csv
grep Total bgbsb1_withlog.txt | awk -F ' ' '{print $2;}'  > bgbsb1_withlog_total.csv
grep FINI bgbsb1_nolog.txt | awk -F ' ' '{print $2;}'  > bgbsb1_nolog_exe.csv
grep Total bgbsb1_nolog.txt | awk -F ' ' '{print $2;}'  > bgbsb1_nolog_total.csv

grep FINI bgbsb1_impt_withlog.txt | awk -F ' ' '{print $2;}'  > bgbsb1_impt_withlog_exe.csv
grep Total bgbsb1_impt_withlog.txt | awk -F ' ' '{print $2;}'  > bgbsb1_impt_withlog_total.csv
grep FINI bgbsb1_impt_nolog.txt | awk -F ' ' '{print $2;}'  > bgbsb1_impt_nolog_exe.csv
grep Total bgbsb1_impt_nolog.txt | awk -F ' ' '{print $2;}'  > bgbsb1_impt_nolog_total.csv
