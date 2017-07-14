# R functions to implement bootstraps

# Calculate bootstrap estimate of the mean
b.mean <- function(data, num) {
    resamples <- lapply(1:num, function(i) sample(data, replace=T))
    r.mean <- sapply(resamples, mean)
    std.err <- sqrt(var(r.mean))
    list(std.err=std.err, resamples=resamples, means=r.mean)
}

# Bootstrap estimate of the median
b.median <- function(data, num) {
    resamples <- lapply(1:num, function(i) sample(data, replace=T))
    r.median <- sapply(resamples, median)
    std.err <- sqrt(var(r.median))
    list(std.err=std.err, resamples=resamples, medians=r.median)
}

# Calculates an estimate of the standard error for the difference
# between two distributions. Follows section 8.3 of Efron &
# Tibshirani, 1993 implementing Algorithm 6.1 for the difference of
# means of two sample sets.
b.diffste <- function(zdata, ydata, B) {

    ystar <- lapply(1:B, function(i) sample(ydata, size=length(ydata), replace=T))
    zstar <- lapply(1:B, function(i) sample(zdata, size=length(zdata), replace=T))

    ystarmeans <- sapply(ystar, mean)
    zstarmeans <- sapply(zstar, mean)
    theta <- zstarmeans - ystarmeans
    meantheta <- mean(theta) # theta_hat_star

    thesum <- sapply (1:B, function(i) (zstarmeans[i] - ystarmeans[i] - meantheta)^2 )
    seB <- sqrt(sum(thesum)/(B-1))

    # Observed difference of means
    diffofmeans = mean(zdata) - mean(ydata)

    list(meandiff=diffofmeans, stderr=seB)
}

# Implements a bootstrapped hypothesis test to get a t-statistic. This
# follows the algorithm 16.1 described on p 221 of Efron & Tibshirani.
# zdata and ydata are the two datasets. B is the number of bootstrap
# replications to make to produce ystar and zstar. data2 is treatment,
# data1 is control. The null hypothesis is that ydata and zdata are
# drawn from an identical distribution.
b.ttest <- function(zdata_, ydata_, B) {

    # Ensure that the group which we name zdata is the larger one.
    if (mean(zdata_) > mean(ydata_)) {
        zdata = zdata_;
        ydata = ydata_;
    } else {
        zdata = ydata_;
        ydata = zdata_;
    }

    xstar = c(ydata,zdata) # combine the data as if they were drawn from a single distribution
    tobs = mean(zdata) - mean(ydata) # observed value of the statistic (difference of means)
    print (sprintf("Observed difference of means: %f", tobs))
    ystar <- lapply(1:B, function(i) sample(xstar, size=length(ydata), replace=T))
    zstar <- lapply(1:B, function(i) sample(xstar, size=length(zdata), replace=T))
    ymeans <- sapply(ystar, mean)
    zmeans <- sapply(zstar, mean)
    diffs <- zmeans - ymeans
    numbeyond <- sum(diffs>=tobs)
    print (sprintf("numbeyond: %d out of %d",numbeyond, B))
    asl <- numbeyond/B
    minasl <- 1/B # Smallest possible achieved significance level in case asl==0
    list(asl=asl, minasl=minasl)
}


# Studentized version of b.ttest. This again tests the null hypothesis that the
# populations are identical.
#
# This implements Algorithm 16.1 with t(x) as given in Eq. 16.4.
b.ttest_studentized <- function(zdata_, ydata_, B) {

    # Ensure that the group which we name zdata is the larger one.
    if (mean(zdata_) > mean(ydata_)) {
        zdata = zdata_;
        ydata = ydata_;
    } else {
        zdata = ydata_;
        ydata = zdata_;
    }

    ymean <- mean(ydata)
    zmean <- mean(zdata)
    n <- length(zdata)
    m <- length(ydata)

    sigmabar <- ((sum((zdata - zmean)^2) + sum((ydata - ymean)^2))/(n + m - 2))^0.5

    tobs = (zmean - ymean) / (sigmabar * (1/n + 1/m)^0.5)  # observed value of the statistic (difference of means)
    print (sprintf("Observed value for studentized difference of means: %f", tobs))

    xstar = c(ydata,zdata) # combine the data as if they were drawn from a single distribution
    ystar <- lapply(1:B, function(i) sample(xstar, size=length(ydata), replace=T))
    zstar <- lapply(1:B, function(i) sample(xstar, size=length(zdata), replace=T))

    ymeans <- sapply(ystar, mean)
    zmeans <- sapply(zstar, mean)

    t <- (zmeans - ymeans) / (sigmabar * (1/n + 1/m)^0.5)

    numbeyond <- sum(t>=tobs)

    print (sprintf("numbeyond: %d out of %d",numbeyond, B))
    asl <- numbeyond/B
    minasl <- 1/B # Smallest possible achieved significance level in case asl==0
    list(asl=asl, minasl=minasl)
}

# Utility function to display Achieved Significance Level (ASL) result.
b.showsiglev <- function (asl, tag) {
    if (asl$asl == 0) {
        msg <- sprintf ("Achieved significance level for %s < %f", tag, asl$minasl)
    } else {
        msg <- sprintf ("Achieved significance level for %s = %f", tag, asl$asl)
    }
    print(msg)
}

# Compute a bootstrapped two sample t statistic as per algorithm 16.2
# in Efron & Tibshirani.
# zdata is treatment; ydata is control.
#
# This tests for equality of means, not whether the populations are identical
# and may be used on distributions where the variances may not be equal.
#
b.ttest_equalityofmeans <- function (zdata_, ydata_, B) {

    # Ensure that the group which we name zdata is the larger one.
    if (mean(zdata_) > mean(ydata_)) {
        zdata = zdata_;
        ydata = ydata_;
    } else {
        zdata = ydata_;
        ydata = zdata_;
    }

    n <- length(zdata)
    m <- length(ydata)

    # combine the data as if they were drawn from a single distribution
    x <- c(zdata,ydata)
    xmean <- mean(x)

    ymean <- mean(ydata)
    zmean <- mean(zdata)

    # Compute variances for the observed values:
    obsvarz <- sum((zdata-zmean)^2)/(n-1)
    obsvary <- sum((ydata-ymean)^2)/(m-1)

    # Compute the observed value of the studentised statistic (using
    # separate variances, rather than a pooled variance):
    tobs <- (zmean - ymean) / ((obsvary/m + obsvarz/n)^0.5)
    #print(sprintf("tobs=%f and xmean=%f",tobs,xmean))

    # Create shifted distributions; shifted by group mean and combined mean:
    ztilda <- zdata - mean(zdata) + xmean
    ytilda <- ydata - mean(ydata) + xmean

    # Resample from the shifted (tilda) distributions:
    zstar <- lapply(1:B, function(i) sample(ztilda, size=n, replace=T))
    ystar <- lapply(1:B, function(i) sample(ytilda, size=m, replace=T))

    # Create vectors of the means of these resamples:
    zstarmeans <- sapply(zstar, mean)
    ystarmeans <- sapply(ystar, mean)

    # Compute the variances
    zvariances <- sapply(1:B, function(i) sum((zstar[[i]] - zstarmeans[i])^2)/(n-1))
    yvariances <- sapply(1:B, function(i) sum((ystar[[i]] - ystarmeans[i])^2)/(m-1))

    top <- zstarmeans - ystarmeans
    bot <- ((yvariances/m + zvariances/n)^0.5)
    txstar <- top / bot

    numbeyond <- sum(txstar>=tobs)
    print (sprintf("numbeyond: %d out of %d",numbeyond, B))
    asl <- numbeyond/B
    minasl <- 1/B # Smallest possible achieved significance level in case asl==0
    list(asl=asl, minasl=minasl,txstar=txstar)
}

## Efron & Tibshirani example mouse data, for comparison of methods.
#mouse.treatment=c(94,197,16,38,99,141,23)     # zdata
#mouse.control=c(52,104,146,10,51,30,40,27,46) # ydata
#mouseres0 <- b.diffste (mouse.treatment, mouse.control, 1400)
#print (sprintf ("For mouse treatment/control, difference is %f, standard error estimate: %f", mouseres0$meandiff, mouseres0$stderr))
## Reproduce result of algo 16.1 for the mouse data:
#mouseres1 <- b.ttest(mouse.treatment, mouse.control, 1000)
#b.showsiglev (mouseres1, "Mouse treatment/control basic ttest (16.1)")
## Studentized version of algo 16.1:
#mouseres1p2 <- b.ttest_studentized(mouse.treatment, mouse.control, 1000)
#b.showsiglev (mouseres1p2, "Mouse treatment/control studentized ttest (16.1 + eqn 16.4)")
## Reproduce result of Algo 16.2 for the mouse data:
#mouseres2 <- b.ttest_equalityofmeans(mouse.treatment, mouse.control, 1000)
#b.showsiglev(mouseres2, "Mouse treatment/control equality of means test (16.2)")
