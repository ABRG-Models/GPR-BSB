# Like the 5 results, but using the 30 results I have now for the SpineML model.

source('./bootstrap_functions.r')

# spineml_D1 = c(3087, 3074, 3297, 3117, 3300) # manually collected data
spineml_D1_tmp <- read.csv (file="./results/bgbsb1_impt/d1spikes.csv", header=FALSE, sep=",");
spineml_D1 <- spineml_D1_tmp$V1;
spinnaker_D1 = c(3890, 2656, 3767, 3826, 2876)

spineml_STN_tmp <- read.csv (file="./results/bgbsb1_impt/stnspikes.csv", header=FALSE, sep=",");
spineml_STN <- spineml_STN_tmp$V1;
spinnaker_STN = c(1066,	1051,	1072,	1036,	1054)

spineml_GPe_tmp <- read.csv (file="./results/bgbsb1_impt/gpespikes.csv", header=FALSE, sep=",");
spineml_GPe <- spineml_GPe_tmp$V1;
spinnaker_GPe = c(8157,	8210,	8201,	8145,	8226)

spineml_SNr_tmp <- read.csv (file="./results/bgbsb1_impt/snrspikes.csv", header=FALSE, sep=",");
spineml_SNr <- spineml_SNr_tmp$V1;
spinnaker_SNr = c(3404,	3504,	3527,	3510,	3508)

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
