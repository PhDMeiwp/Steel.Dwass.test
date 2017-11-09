#' Steel-Dwass pairwise ranking test
#'
#' The Steel Dwass method performs the multiple comparisons whilst controlling the overall experiment-wise error rate (it is the non-parametric equivalent to the Tukey All-Pairs method)
#' adapted from http://aoki2.si.gunma-u.ac.jp/R/Steel-Dwass.html
#'
#' @param x  data, with more than 3 groups
#' @param group  group data,dataset is similar with those when you run ANOVA etc.
#' @export
#' @examples
#' library(Steel.Dwass.test)
#' x <- c(6.9, 7.5, 8.5, 8.4, 8.1, 8.7, 8.9, 8.2, 7.8, 7.3, 6.8,9.6, 9.4, 9.5, 8.5, 9.4, 9.9, 8.7, 8.1, 7.8, 8.8,5.7, 6.4, 6.8, 7.8, 7.6, 7.0, 7.7, 7.5, 6.8, 5.9,7.6, 8.7, 8.5, 8.5, 9.0, 9.2, 9.3, 8.0, 7.2, 7.9, 7.8)
#' group <- rep(1:4, c(11, 10, 10, 11))
#' Steel.Dwass(x, group)
Steel.Dwass <- function(x,group) 
{
  OK <- complete.cases(x, group)
  x <- x[OK]
  gp <- sort(unique(group))
  group <- as.numeric(factor(group[OK] ,levels=unique(group[OK] ))) 
  n.i <- table(group)
  ng <- length(n.i)
  t <- combn(ng, 2, function(ij) {
    i <- ij[1]
    j <- ij[2]
    r <- rank(c(x[group == i], x[group == j]))
    R <- sum(r[1:n.i[i]])
    N <- n.i[i]+n.i[j]
    E <- n.i[i]*(N+1)/2
    V <- n.i[i]*n.i[j]/(N*(N-1))*(sum(r^2)-N*(N+1)^2/4)
    return(abs(R-E)/sqrt(V))
  })
  p <- ptukey(t*sqrt(2), ng, Inf, lower.tail=FALSE)
  result <- cbind(t, p)
  rownames(result) <- combn(gp, 2, paste, collapse=":")
  return(result)
}