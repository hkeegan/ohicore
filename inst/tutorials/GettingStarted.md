Getting Started
========================================================

This is an R Markdown document. Markdown is a simple formatting syntax for authoring web pages (click the **MD** toolbar button for help on Markdown).

When you click the **Knit HTML** button a web page will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:


```r
library(devtools)
```

```
## Warning: package 'devtools' was built under R version 3.0.2
```

```r

library(ohicore)
```

```
## Loading required package: plyr
## Loading required package: reshape2
## Loading required package: RJSONIO
```

```r
data(package = "ohicore")
```


```
Data sets in package ‘ohicore’:

layers.Global2012.Nature2012ftp  Layers accompanying Nature 2012 publication on the FTP site for Global 2012 analysis.
layers.Global2012.www2013        Layers used for the 2013 web launch applied to Global 2012 analysis.
layers.Global2013.www2013        Layers used for the 2013 web launch applied to Global 2013 analysis.
```

You can also embed plots, for example:


