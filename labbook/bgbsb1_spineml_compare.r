# Compare event and impulse based versions of the bgbsb1 model.

source('./bootstrap_functions.r')

impt_D1_tmp <- read.csv (file="./results/bgbsb1_impt/d1spikes.csv", header=FALSE, sep=",");
impt_D1 <- impt_D1_tmp$V1;
evbased_D1_tmp <- read.csv (file="./results/bgbsb1/d1spikes.csv", header=FALSE, sep=",");
evbased_D1 <- evbased_D1_tmp$V1;

impt_D2_tmp <- read.csv (file="./results/bgbsb1_impt/d2spikes.csv", header=FALSE, sep=",");
impt_D2 <- impt_D2_tmp$V1;
evbased_D2_tmp <- read.csv (file="./results/bgbsb1/d2spikes.csv", header=FALSE, sep=",");
evbased_D2 <- evbased_D2_tmp$V1;

impt_FSI_tmp <- read.csv (file="./results/bgbsb1_impt/fsispikes.csv", header=FALSE, sep=",");
impt_FSI <- impt_FSI_tmp$V1;
evbased_FSI_tmp <- read.csv (file="./results/bgbsb1/fsispikes.csv", header=FALSE, sep=",");
evbased_FSI <- evbased_FSI_tmp$V1;

impt_STN_tmp <- read.csv (file="./results/bgbsb1_impt/stnspikes.csv", header=FALSE, sep=",");
impt_STN <- impt_STN_tmp$V1;
evbased_STN_tmp <- read.csv (file="./results/bgbsb1/stnspikes.csv", header=FALSE, sep=",");
evbased_STN <- evbased_STN_tmp$V1;

impt_GPe_tmp <- read.csv (file="./results/bgbsb1_impt/gpespikes.csv", header=FALSE, sep=",");
impt_GPe <- impt_GPe_tmp$V1;
evbased_GPe_tmp <- read.csv (file="./results/bgbsb1/gpespikes.csv", header=FALSE, sep=",");
evbased_GPe <- evbased_GPe_tmp$V1;

impt_SNr_tmp <- read.csv (file="./results/bgbsb1_impt/snrspikes.csv", header=FALSE, sep=",");
impt_SNr <- impt_SNr_tmp$V1;
evbased_SNr_tmp <- read.csv (file="./results/bgbsb1/snrspikes.csv", header=FALSE, sep=",");
evbased_SNr <- evbased_SNr_tmp$V1;

print ("***********  Means  *************")

D1mean <- b.mean(impt_D1, 256)
D2mean <- b.mean(impt_D2, 256)
FSImean <- b.mean(impt_FSI, 256)
STNmean <- b.mean(impt_STN, 256)
GPemean <- b.mean(impt_GPe, 256)
SNrmean <- b.mean(impt_SNr, 256)
print (sprintf ("Impulse based model, D1 mean: %f spikes with stderr %f", mean(impt_D1), D1mean$std.err))
print (sprintf ("Impulse based model, D2 mean: %f spikes with stderr %f", mean(impt_D2), D2mean$std.err))
print (sprintf ("Impulse based model, FSI mean: %f spikes with stderr %f", mean(impt_FSI), FSImean$std.err))
print (sprintf ("Impulse based model, STN mean: %f spikes with stderr %f", mean(impt_STN), STNmean$std.err))
print (sprintf ("Impulse based model, GPe mean: %f spikes with stderr %f", mean(impt_GPe), GPemean$std.err))
print (sprintf ("Impulse based model, SNr mean: %f spikes with stderr %f", mean(impt_SNr), SNrmean$std.err))

D1mean <- b.mean(evbased_D1, 256)
D2mean <- b.mean(evbased_D2, 256)
FSImean <- b.mean(evbased_FSI, 256)
STNmean <- b.mean(evbased_STN, 256)
GPemean <- b.mean(evbased_GPe, 256)
SNrmean <- b.mean(evbased_SNr, 256)
print (sprintf ("Event based model, D1 mean: %f spikes with stderr %f", mean(evbased_D1), D1mean$std.err))
print (sprintf ("Event based model, D2 mean: %f spikes with stderr %f", mean(evbased_D2), D2mean$std.err))
print (sprintf ("Event based model, FSI mean: %f spikes with stderr %f", mean(evbased_FSI), FSImean$std.err))
print (sprintf ("Event based model, STN mean: %f spikes with stderr %f", mean(evbased_STN), STNmean$std.err))
print (sprintf ("Event based model, GPe mean: %f spikes with stderr %f", mean(evbased_GPe), GPemean$std.err))
print (sprintf ("Event based model, SNr mean: %f spikes with stderr %f", mean(evbased_SNr), SNrmean$std.err))

print ("***********  Difference/Stderr  *************")

D1diff <- b.diffste (evbased_D1, impt_D1, 256)
print (sprintf ("For D1 evbased/impulsebased, difference is %f, standard error estimate: %f", D1diff$meandiff, D1diff$stderr))

D2diff <- b.diffste (evbased_D2, impt_D2, 256)
print (sprintf ("For D2 evbased/impulsebased, difference is %f, standard error estimate: %f", D2diff$meandiff, D2diff$stderr))

FSIdiff <- b.diffste (evbased_FSI, impt_FSI, 256)
print (sprintf ("For FSI evbased/impulsebased, difference is %f, standard error estimate: %f", FSIdiff$meandiff, FSIdiff$stderr))

STNdiff <- b.diffste (evbased_STN, impt_STN, 256)
print (sprintf ("For STN evbased/impulsebased, difference is %f, standard error estimate: %f", STNdiff$meandiff, STNdiff$stderr))

GPediff <- b.diffste (evbased_GPe, impt_GPe, 256)
print (sprintf ("For GPe evbased/impulsebased, difference is %f, standard error estimate: %f", GPediff$meandiff, GPediff$stderr))

SNrdiff <- b.diffste (evbased_SNr, impt_SNr, 256)
print (sprintf ("For SNr evbased/impulsebased, difference is %f, standard error estimate: %f", SNrdiff$meandiff, SNrdiff$stderr))

print ("***********  Studentized t-test  *************")

D1_ttest <- b.studentized_ttest(evbased_D1,impt_D1,10000)
b.showsiglev (D1_ttest, "Evbased vs Impulse based D1 population")

D2_ttest <- b.studentized_ttest(evbased_D2,impt_D2,10000)
b.showsiglev (D2_ttest, "Evbased vs Impulse based D2 population")

STN_ttest <- b.studentized_ttest(evbased_STN,impt_STN,10000)
b.showsiglev (STN_ttest, "Evbased vs Impulse based STN population")

FSI_ttest <- b.studentized_ttest(evbased_FSI,impt_FSI,10000)
b.showsiglev (FSI_ttest, "Evbased vs Impulse based FSI population")

GPe_ttest <- b.studentized_ttest(evbased_GPe,impt_GPe,10000)
b.showsiglev (GPe_ttest, "Evbased vs Impulse based GPe population")

SNr_ttest <- b.studentized_ttest(evbased_SNr,impt_SNr,10000)
b.showsiglev (SNr_ttest, "Evbased vs Impulse based SNr population")
