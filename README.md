---
title: Steel-Dwass test v1.0.0
---

Steel, R.G.D. (1961). Some rank sum multiple comparison tests. Biometrics 17, 539-552.

R code source coming from http://aoki2.si.gunma-u.ac.jp/R/Steel-Dwass.html

# Installing Steel.Dwass.test

You can install directly from GitHub if you have the devtools package installed:

    library(devtools)   # or install.packages("devtools")
	install_github("PhDMeiwp/Steel.Dwass.test@master", force = TRUE)
	library(Steel.Dwass.test)

Then upload your dataset including x and group data, and run 

    Steel.Dwass(x,group)

# Acknowledgments

Thanks to [DLMcArthur](https://disqus.com/by/dlmcarthur/) for help with Rcode improvement [tips](https://meiweiping.github.io/Steel-Dwass-test-in-R-Kruskal-Wallis-post-hoc-test/#comments)!