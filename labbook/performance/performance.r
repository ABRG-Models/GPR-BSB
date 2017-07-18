# Compare event and impulse based cut-down models

source('../bootstrap_functions.r')

print ("***********  Single channel event based model  *************")

# Data
bgbsb1_nolog_exe_tmp<- read.csv (file="bgbsb1_nolog_exe.csv", header=FALSE, sep=",");
bgbsb1_nolog_exe <- bgbsb1_nolog_exe_tmp$V1;

bgbsb1_withlog_exe_tmp<- read.csv (file="bgbsb1_withlog_exe.csv", header=FALSE, sep=",");
bgbsb1_withlog_exe <- bgbsb1_withlog_exe_tmp$V1;

bgbsb1_nolog_total_tmp<- read.csv (file="bgbsb1_nolog_total.csv", header=FALSE, sep=",");
bgbsb1_nolog_total <- bgbsb1_nolog_total_tmp$V1;

bgbsb1_withlog_total_tmp<- read.csv (file="bgbsb1_withlog_total.csv", header=FALSE, sep=",");
bgbsb1_withlog_total <- bgbsb1_withlog_total_tmp$V1;

# Analysis
bgbsb1_nolog_exe_mean <- b.mean(bgbsb1_nolog_exe, 256)
print (sprintf ("1 channel no logging: mean exec time: %f s, stderr %f", mean(bgbsb1_nolog_exe), bgbsb1_nolog_exe_mean$std.err))

bgbsb1_withlog_exe_mean <- b.mean(bgbsb1_withlog_exe, 256)
print (sprintf ("1 channel with logging: mean exec time: %f s, stderr %f", mean(bgbsb1_withlog_exe), bgbsb1_withlog_exe_mean$std.err))

# Difference between withlogging and nologging gives time for logging
logdiff <- b.diffste (bgbsb1_withlog_exe, bgbsb1_nolog_exe, 256)
print (sprintf ("1 channel log vs. nolog. Exe difference is %f, stderr: %f", logdiff$meandiff, logdiff$stderr))

# Difference between nolog total and nolog exe gives pre-processing
prediff <- b.diffste (bgbsb1_nolog_total, bgbsb1_nolog_exe, 256)
print (sprintf ("1 channel nolog total vs. nolog exe. difference is %f, stderr: %f", prediff$meandiff, prediff$stderr))



print ("***********  Three channel event based model  *************")

# Data (three channels)
bgbsb3_nolog_exe_tmp<- read.csv (file="bgbsb3_nolog_exe.csv", header=FALSE, sep=",");
bgbsb3_nolog_exe <- bgbsb3_nolog_exe_tmp$V1;

bgbsb3_withlog_exe_tmp<- read.csv (file="bgbsb3_withlog_exe.csv", header=FALSE, sep=",");
bgbsb3_withlog_exe <- bgbsb3_withlog_exe_tmp$V1;

bgbsb3_nolog_total_tmp<- read.csv (file="bgbsb3_nolog_total.csv", header=FALSE, sep=",");
bgbsb3_nolog_total <- bgbsb3_nolog_total_tmp$V1;

bgbsb3_withlog_total_tmp<- read.csv (file="bgbsb3_withlog_total.csv", header=FALSE, sep=",");
bgbsb3_withlog_total <- bgbsb3_withlog_total_tmp$V1;

# Analysis
bgbsb3_nolog_exe_mean <- b.mean(bgbsb3_nolog_exe, 256)
print (sprintf ("3 channel no logging: mean exec time: %f s, stderr %f", mean(bgbsb3_nolog_exe), bgbsb3_nolog_exe_mean$std.err))

bgbsb3_withlog_exe_mean <- b.mean(bgbsb3_withlog_exe, 256)
print (sprintf ("3 channel with logging: mean exec time: %f s, stderr %f", mean(bgbsb3_withlog_exe), bgbsb3_withlog_exe_mean$std.err))

# Difference between withlogging and nologging gives time for logging
logdiff <- b.diffste (bgbsb3_withlog_exe, bgbsb3_nolog_exe, 256)
print (sprintf ("3 channel log vs. nolog. Exe difference is %f, stderr: %f", logdiff$meandiff, logdiff$stderr))

# Difference between nolog total and nolog exe gives pre-processing
prediff <- b.diffste (bgbsb3_nolog_total, bgbsb3_nolog_exe, 256)
print (sprintf ("3 channel nolog total vs. nolog exe. difference is %f, stderr: %f", prediff$meandiff, prediff$stderr))

print ("***********  Single channel impulse based model  *************")

# Data
bgbsb1_impt_nolog_exe_tmp<- read.csv (file="bgbsb1_impt_nolog_exe.csv", header=FALSE, sep=",");
bgbsb1_impt_nolog_exe <- bgbsb1_impt_nolog_exe_tmp$V1;

bgbsb1_impt_withlog_exe_tmp<- read.csv (file="bgbsb1_impt_withlog_exe.csv", header=FALSE, sep=",");
bgbsb1_impt_withlog_exe <- bgbsb1_impt_withlog_exe_tmp$V1;

bgbsb1_impt_nolog_total_tmp<- read.csv (file="bgbsb1_impt_nolog_total.csv", header=FALSE, sep=",");
bgbsb1_impt_nolog_total <- bgbsb1_impt_nolog_total_tmp$V1;

bgbsb1_impt_withlog_total_tmp<- read.csv (file="bgbsb1_impt_withlog_total.csv", header=FALSE, sep=",");
bgbsb1_impt_withlog_total <- bgbsb1_impt_withlog_total_tmp$V1;

# Analysis
bgbsb1_impt_nolog_exe_mean <- b.mean(bgbsb1_impt_nolog_exe, 256)
print (sprintf ("1 channel impulse no logging: mean exec time: %f s, stderr %f", mean(bgbsb1_impt_nolog_exe), bgbsb1_impt_nolog_exe_mean$std.err))

bgbsb1_impt_withlog_exe_mean <- b.mean(bgbsb1_impt_withlog_exe, 256)
print (sprintf ("1 channel impulse with logging: mean exec time: %f s, stderr %f", mean(bgbsb1_impt_withlog_exe), bgbsb1_impt_withlog_exe_mean$std.err))

# Difference between withlogging and nologging gives time for logging
logdiff <- b.diffste (bgbsb1_impt_withlog_exe, bgbsb1_impt_nolog_exe, 256)
print (sprintf ("1 channel impulse log vs. nolog. Exe difference is %f, stderr: %f", logdiff$meandiff, logdiff$stderr))

# Difference between nolog total and nolog exe gives pre-processing
prediff <- b.diffste (bgbsb1_impt_nolog_total, bgbsb1_impt_nolog_exe, 256)
print (sprintf ("1 channel impulse nolog total vs. nolog exe. difference is %f, stderr: %f", prediff$meandiff, prediff$stderr))
