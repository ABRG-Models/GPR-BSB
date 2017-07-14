# Compare event and impulse based cut-down models

source('./bootstrap_functions.r')

impt_D1_tmp <- read.csv (file="./results/evimcmp_impulse/d1spikes1.csv", header=FALSE, sep=",");
impt_D1 <- impt_D1_tmp$V1;
evbased_D1_tmp <- read.csv (file="./results/evimcmp_event/d1spikes1.csv", header=FALSE, sep=",");
evbased_D1 <- evbased_D1_tmp$V1;

impt_FSI_tmp <- read.csv (file="./results/evimcmp_impulse/fsispikes1.csv", header=FALSE, sep=",");
impt_FSI <- impt_FSI_tmp$V1;
evbased_FSI_tmp <- read.csv (file="./results/evimcmp_event/fsispikes1.csv", header=FALSE, sep=",");
evbased_FSI <- evbased_FSI_tmp$V1;


print ("***********  Means/medians  *************")

D1mean <- b.mean(impt_D1, 256)
FSImean <- b.mean(impt_FSI, 256)
print (sprintf ("Impulse based model, D1 mean: %f spikes with stderr %f", mean(impt_D1), D1mean$std.err))
print (sprintf ("Impulse based model, FSI mean: %f spikes with stderr %f", mean(impt_FSI), FSImean$std.err))

D1mean <- b.mean(evbased_D1, 256)
FSImean <- b.mean(evbased_FSI, 256)
print (sprintf ("Event based model, D1 mean: %f spikes with stderr %f", mean(evbased_D1), D1mean$std.err))
print (sprintf ("Event based model, FSI mean: %f spikes with stderr %f", mean(evbased_FSI), FSImean$std.err))


print ("***********  Difference/Stderr  *************")

D1diff <- b.diffste (evbased_D1, impt_D1, 256)
print (sprintf ("For D1 evbased/impulsebased, difference is %f, standard error estimate: %f", D1diff$meandiff, D1diff$stderr))

FSIdiff <- b.diffste (evbased_FSI, impt_FSI, 256)
print (sprintf ("For FSI evbased/impulsebased, difference is %f, standard error estimate: %f", FSIdiff$meandiff, FSIdiff$stderr))

print ("***********  Studentized t-test  *************")

D1_ttest <- b.ttest_equalityofmeans(evbased_D1,impt_D1,10000)
b.showsiglev (D1_ttest, "Evbased vs Impulse based D1 population")

FSI_ttest <- b.ttest_equalityofmeans(evbased_FSI,impt_FSI,10000)
b.showsiglev (FSI_ttest, "Evbased vs Impulse based FSI population")
