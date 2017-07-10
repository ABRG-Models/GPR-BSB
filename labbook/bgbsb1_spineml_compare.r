# Compare event and impulse based versions of the bgbsb1 model.

source('./bootstrap_functions.r')

impt_D1_tmp <- read.csv (file="./results/bgbsb1_impt/d1spikes.csv", header=FALSE, sep=",");
impt_D1 <- impt_D1_tmp$V1;
evbased_D1_tmp <- read.csv (file="./results/bgbsb1/d1spikes.csv", header=FALSE, sep=",");
evbased_D1 <- evbased_D1_tmp$V1;

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

print ("***********  Means/medians  *************")

D1mean <- b.mean(impt_D1, 256)
STNmean <- b.mean(impt_STN, 256)
GPemean <- b.mean(impt_GPe, 256)
SNrmean <- b.mean(impt_SNr, 256)
print (sprintf ("Impulse based model, D1 mean: %f spikes with stderr %f", mean(impt_D1), D1mean$std.err))
print (sprintf ("Impulse based model, STN mean: %f spikes with stderr %f", mean(impt_STN), STNmean$std.err))
print (sprintf ("Impulse based model, GPe mean: %f spikes with stderr %f", mean(impt_GPe), GPemean$std.err))
print (sprintf ("Impulse based model, SNr mean: %f spikes with stderr %f", mean(impt_SNr), SNrmean$std.err))

D1mean <- b.mean(evbased_D1, 256)
STNmean <- b.mean(evbased_STN, 256)
GPemean <- b.mean(evbased_GPe, 256)
SNrmean <- b.mean(evbased_SNr, 256)
print (sprintf ("Event based model, D1 mean: %f spikes with stderr %f", mean(evbased_D1), D1mean$std.err))
print (sprintf ("Event based model, STN mean: %f spikes with stderr %f", mean(evbased_STN), STNmean$std.err))
print (sprintf ("Event based model, GPe mean: %f spikes with stderr %f", mean(evbased_GPe), GPemean$std.err))
print (sprintf ("Event based model, SNr mean: %f spikes with stderr %f", mean(evbased_SNr), SNrmean$std.err))


D1median <- b.median(impt_D1, 256)
STNmedian <- b.median(impt_STN, 256)
GPemedian <- b.median(impt_GPe, 256)
SNrmedian <- b.median(impt_SNr, 256)
print (sprintf ("Impulse based model, D1 median: %f spikes with stderr %f", median(impt_D1), D1median$std.err))
print (sprintf ("Impulse based model, STN median: %f spikes with stderr %f", median(impt_STN), STNmedian$std.err))
print (sprintf ("Impulse based model, GPe median: %f spikes with stderr %f", median(impt_GPe), GPemedian$std.err))
print (sprintf ("Impulse based model, SNr median: %f spikes with stderr %f", median(impt_SNr), SNrmedian$std.err))

D1median <- b.median(evbased_D1, 256)
STNmedian <- b.median(evbased_STN, 256)
GPemedian <- b.median(evbased_GPe, 256)
SNrmedian <- b.median(evbased_SNr, 256)
print (sprintf ("Event based model, D1 median: %f spikes with stderr %f", median(evbased_D1), D1median$std.err))
print (sprintf ("Event based model, STN median: %f spikes with stderr %f", median(evbased_STN), STNmedian$std.err))
print (sprintf ("Event based model, GPe median: %f spikes with stderr %f", median(evbased_GPe), GPemedian$std.err))
print (sprintf ("Event based model, SNr median: %f spikes with stderr %f", median(evbased_SNr), SNrmedian$std.err))


print ("***********  Difference/Stderr  *************")

D1diff <- b.diffste (evbased_D1, impt_D1, 256)
print (sprintf ("For D1 evbased/impulsebased, difference is %f, standard error estimate: %f", D1diff$meandiff, D1diff$stderr))

STNdiff <- b.diffste (evbased_STN, impt_STN, 256)
print (sprintf ("For STN evbased/impulsebased, difference is %f, standard error estimate: %f", STNdiff$meandiff, STNdiff$stderr))

GPediff <- b.diffste (evbased_GPe, impt_GPe, 256)
print (sprintf ("For GPe evbased/impulsebased, difference is %f, standard error estimate: %f", GPediff$meandiff, GPediff$stderr))

SNrdiff <- b.diffste (evbased_SNr, impt_SNr, 256)
print (sprintf ("For SNr evbased/impulsebased, difference is %f, standard error estimate: %f", SNrdiff$meandiff, SNrdiff$stderr))

print ("***********  Studentized t-test  *************")

D1_ttest <- b.studentized_ttest(evbased_D1,impt_D1,10000)
b.showsiglev (D1_ttest, "Evbased vs Impulse based D1 population")

STN_ttest <- b.studentized_ttest(evbased_STN,impt_STN,10000)
b.showsiglev (STN_ttest, "Evbased vs Impulse based STN population")

GPe_ttest <- b.studentized_ttest(evbased_GPe,impt_GPe,10000)
b.showsiglev (GPe_ttest, "Evbased vs Impulse based GPe population")

SNr_ttest <- b.studentized_ttest(evbased_SNr,impt_SNr,10000)
b.showsiglev (SNr_ttest, "Evbased vs Impulse based SNr population")
