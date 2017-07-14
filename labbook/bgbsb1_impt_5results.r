# Here, I will examine the results from the 1 channel BG model
# implemented in SpineML and SpiNNaker. I'll compute the probability
# that the SpineML data is drawn from a different distribution from
# the SpiNNaker model data. The data is the result of 5 runs of the
# model.
#
# These numbers are the results from the shared Spreadsheet which
# Basab and I have been writing our results into. I've used the number
# of spikes, rather than the spike rates.
#

source('./bootstrap_functions.r')

spineml_D1 = c(3087, 3074, 3297, 3117, 3300)
spinnaker_D1 = c(3890, 2656, 3767, 3826, 2876)

spineml_STN = c(1083,	1078,	1074,	1082,	1080)
spinnaker_STN = c(1066,	1051,	1072,	1036,	1054)

spineml_GPe = c(8368,	8338,	8347,	8342,	8336)
spinnaker_GPe = c(8157,	8210,	8201,	8145,	8226)

spineml_SNr = c(3575,	3601,	3559,	3608,	3572)
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

D1_ttest <- b.ttest_equalityofmeans(spinnaker_D1,spineml_D1,10000)
b.showsiglev (D1_ttest, "SpiNNaker vs SpineML D1 population")

STN_ttest <- b.ttest_equalityofmeans(spinnaker_STN,spineml_STN,10000)
b.showsiglev (STN_ttest, "SpiNNaker vs SpineML STN population")

GPe_ttest <- b.ttest_equalityofmeans(spinnaker_GPe,spineml_GPe,10000)
b.showsiglev (GPe_ttest, "SpiNNaker vs SpineML GPe population")

SNr_ttest <- b.ttest_equalityofmeans(spinnaker_SNr,spineml_SNr,10000)
b.showsiglev (SNr_ttest, "SpiNNaker vs SpineML SNr population")
