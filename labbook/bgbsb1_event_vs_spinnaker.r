# This compares 30 results for the SpineML event based model with 30
# results from the SpiNNaker model.

source('./bootstrap_functions.r')

# spineml_D1 = c(3087, 3074, 3297, 3117, 3300) # manually collected data
spineml_D1_tmp <- read.csv (file="./results/bgbsb1/d1spikes.csv", header=FALSE, sep=",");
spineml_D1 <- spineml_D1_tmp$V1;


spineml_STN_tmp <- read.csv (file="./results/bgbsb1/stnspikes.csv", header=FALSE, sep=",");
spineml_STN <- spineml_STN_tmp$V1;


spineml_GPe_tmp <- read.csv (file="./results/bgbsb1/gpespikes.csv", header=FALSE, sep=",");
spineml_GPe <- spineml_GPe_tmp$V1;


spineml_SNr_tmp <- read.csv (file="./results/bgbsb1/snrspikes.csv", header=FALSE, sep=",");
spineml_SNr <- spineml_SNr_tmp$V1;



spinnaker_D1_tmp <- read.csv (file="./results/spinnaker1ch/msnd1spikearray.csv", header=FALSE, sep=",");
spinnaker_D1 <- spinnaker_D1_tmp$V1;


spinnaker_STN_tmp <- read.csv (file="./results/spinnaker1ch/stnspikearray.csv", header=FALSE, sep=",");
spinnaker_STN <- spinnaker_STN_tmp$V1;


spinnaker_GPe_tmp <- read.csv (file="./results/spinnaker1ch/gpespikearray.csv", header=FALSE, sep=",");
spinnaker_GPe <- spinnaker_GPe_tmp$V1;


spinnaker_SNr_tmp <- read.csv (file="./results/spinnaker1ch/snrspikearray.csv", header=FALSE, sep=",");
spinnaker_SNr <- spinnaker_SNr_tmp$V1;

print ("***********  Means/medians  *************")

D1mean <- b.mean(spineml_D1, 256)
STNmean <- b.mean(spineml_STN, 256)
GPemean <- b.mean(spineml_GPe, 256)
SNrmean <- b.mean(spineml_SNr, 256)
print (sprintf ("SpineML based model, D1 mean: %f spikes with stderr %f", mean(spineml_D1), D1mean$std.err))
print (sprintf ("SpineML based model, STN mean: %f spikes with stderr %f", mean(spineml_STN), STNmean$std.err))
print (sprintf ("SpineML based model, GPe mean: %f spikes with stderr %f", mean(spineml_GPe), GPemean$std.err))
print (sprintf ("SpineML based model, SNr mean: %f spikes with stderr %f", mean(spineml_SNr), SNrmean$std.err))

D1mean <- b.mean(spinnaker_D1, 256)
STNmean <- b.mean(spinnaker_STN, 256)
GPemean <- b.mean(spinnaker_GPe, 256)
SNrmean <- b.mean(spinnaker_SNr, 256)
print (sprintf ("SpiNNaker model, D1 mean: %f spikes with stderr %f", mean(spinnaker_D1), D1mean$std.err))
print (sprintf ("SpiNNaker model, STN mean: %f spikes with stderr %f", mean(spinnaker_STN), STNmean$std.err))
print (sprintf ("SpiNNaker model, GPe mean: %f spikes with stderr %f", mean(spinnaker_GPe), GPemean$std.err))
print (sprintf ("SpiNNaker model, SNr mean: %f spikes with stderr %f", mean(spinnaker_SNr), SNrmean$std.err))


D1median <- b.median(impt_D1, 256)
STNmedian <- b.median(impt_STN, 256)
GPemedian <- b.median(impt_GPe, 256)
SNrmedian <- b.median(impt_SNr, 256)
print (sprintf ("SpineML based model, D1 median: %f spikes with stderr %f", median(impt_D1), D1median$std.err))
print (sprintf ("SpineML based model, STN median: %f spikes with stderr %f", median(impt_STN), STNmedian$std.err))
print (sprintf ("SpineML based model, GPe median: %f spikes with stderr %f", median(impt_GPe), GPemedian$std.err))
print (sprintf ("SpineML based model, SNr median: %f spikes with stderr %f", median(impt_SNr), SNrmedian$std.err))

D1median <- b.median(spinnaker_D1, 256)
STNmedian <- b.median(spinnaker_STN, 256)
GPemedian <- b.median(spinnaker_GPe, 256)
SNrmedian <- b.median(spinnaker_SNr, 256)
print (sprintf ("SpiNNaker model, D1 median: %f spikes with stderr %f", median(spinnaker_D1), D1median$std.err))
print (sprintf ("SpiNNaker model, STN median: %f spikes with stderr %f", median(spinnaker_STN), STNmedian$std.err))
print (sprintf ("SpiNNaker model, GPe median: %f spikes with stderr %f", median(spinnaker_GPe), GPemedian$std.err))
print (sprintf ("SpiNNaker model, SNr median: %f spikes with stderr %f", median(spinnaker_SNr), SNrmedian$std.err))


print ("***********  Difference/Stderr  *************")

D1diff <- b.diffste (spinnaker_D1, spineml_D1, 256)
print (sprintf ("For D1spinn/spine, difference is %f, standard error estimate: %f", D1diff$meandiff, D1diff$stderr))

STNdiff <- b.diffste (spinnaker_STN, spineml_STN, 256)
print (sprintf ("For STNspinn/spine, difference is %f, standard error estimate: %f", STNdiff$meandiff, STNdiff$stderr))

GPediff <- b.diffste (spinnaker_GPe, spineml_GPe, 256)
print (sprintf ("For GPespinn/spine, difference is %f, standard error estimate: %f", GPediff$meandiff, GPediff$stderr))

SNrdiff <- b.diffste (spinnaker_SNr, spineml_SNr, 256)
print (sprintf ("For SNrspinn/spine, difference is %f, standard error estimate: %f", SNrdiff$meandiff, SNrdiff$stderr))

print ("***********  Studentized t-test  *************")

D1_ttest <- b.studentized_ttest(spinnaker_D1,spineml_D1,10000)
b.showsiglev (D1_ttest, "SpiNNaker vs SpineML D1 population")

STN_ttest <- b.studentized_ttest(spinnaker_STN,spineml_STN,10000)
b.showsiglev (STN_ttest, "SpiNNaker vs SpineML STN population")

GPe_ttest <- b.studentized_ttest(spinnaker_GPe,spineml_GPe,10000)
b.showsiglev (GPe_ttest, "SpiNNaker vs SpineML GPe population")

SNr_ttest <- b.studentized_ttest(spinnaker_SNr,spineml_SNr,10000)
b.showsiglev (SNr_ttest, "SpiNNaker vs SpineML SNr population")