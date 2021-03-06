\name{CalculateResilienceScore}
\alias{CalculateResilienceScore}
\alias{resilience_categories}
\title{Calculate Resilience Score}
\usage{
  CalculateResilienceScore(r, t, w = NA, gamma = 0.5,
    resilience_categories = c("environmental", "regulatory", "social"))
}
\arguments{
  \item{r}{the resilience value matrix \code{[region_id x
  layer]}. Each score must be a real number between 0 and 1
  inclusive, or NA.}

  \item{t}{the typing vector t[layer] where values are from
  \code{resilience_categories}.}

  \item{w}{the weighting matrix of the form
  \code{[region_id x layer]}. Each rank weight must be a
  real number >= 0, or NA for even weighting.}

  \item{w.layers}{the weighting vector of the form
  \code{[layer]}. Each rank weight must be a real number >=
  0, or NA for even weighting.}

  \item{gamma}{the gamma constant for \eqn{r_{i,x}}
  calculation.}

  \item{b}{a boolean value matrix \code{[region_id x
  layer]} which is \code{TRUE} if the given region_id
  should include layer, and \code{FALSE} otherwise.}
}
\value{
  \code{ohi.model.resilience} returns resilience score for
  each region. \code{ohi.model.resilience.matrix} returns a
  weighting matrix suitable for
  \code{ohi.model.resilience}.
}
\description{
  The resilience model function computes a resilience score
  for each region given a weighting matrix for a goal and
  the individual resilience values.
}
\details{
  To calculate Resilience for each goal \emph{g} and region
  \emph{i} (\eqn{r(g, i)}) we assess three types of
  resilience measures \emph{j}: ecological integrity
  (\eqn{Y_{E}(g, i)}), goal-specific regulations aimed at
  addressing ecological pressures (\eqn{G(g, i)}), and
  social integrity (\eqn{Y_{S}(g, i)}). The first two
  measures address ecological resilience while the third
  addresses social resilience. When all three aspects are
  relevant to a goal, Resilience is calculated for each
  goal \emph{g} and each region \emph{i}:

  \deqn{r(g, i) = \gamma*\left(\frac{Y_{E}(g, i) + G(g,
  i)}{2}\right) + (1 - \gamma)*Y_{S}(g, i)}

  where each goal \emph{g} is comprised of several
  resilience layers \emph{j} where \eqn{w_j} is a
  configuration-time weight to aggregate across resilience
  categories:

  \deqn{G(g, i) = \frac{\sum_{j \in g} w_j G(i, j)}{\sum_{j
  \in g} w_j}} \deqn{Y_{E}(g, i) = \frac{\sum_{j \in g}
  Y_{E}(i,j)}{N}} \deqn{Y_{S}(g, i) = \frac{\sum_{j \in g}
  Y_{S}(i,j)}{N}}
}
\examples{
\dontrun{
> conf$config$resilience_categories
[1] "environmental" "regulatory"    "social"
> b
         layer
region_id fishing-v1 habitat-combo species-diversity-3nm wgi-all
      104       TRUE          TRUE                  TRUE    TRUE
      105       TRUE          TRUE                  TRUE    TRUE
      106       TRUE          TRUE                  TRUE    TRUE
      107       TRUE          TRUE                  TRUE    TRUE
      108       TRUE          TRUE                  TRUE    TRUE
      109       TRUE          TRUE                  TRUE    TRUE
      110       TRUE          TRUE                  TRUE    TRUE
      111       TRUE          TRUE                  TRUE    TRUE
      112       TRUE          TRUE                  TRUE    TRUE
      113       TRUE          TRUE                  TRUE    TRUE
      114       TRUE          TRUE                  TRUE    TRUE
> w
           fishing-v1         habitat-combo species-diversity-3nm
                    2                     2                     1
              wgi-all
                    1
> w < -ohi.model.resilience.matrix(b, w)
> w
         layer
region_id fishing-v1 habitat-combo species-diversity-3nm wgi-all
      104          2             2                     1       1
      105          2             2                     1       1
      106          2             2                     1       1
      107          2             2                     1       1
      108          2             2                     1       1
      109          2             2                     1       1
      110          2             2                     1       1
      111          2             2                     1       1
      112          2             2                     1       1
      113          2             2                     1       1
      114          2             2                     1       1

> r
         layer
region_id fishing-v1 habitat-combo species-diversity-3nm wgi-all
      104     0.4870        0.4495                0.8679  0.4385
      105     0.5162        0.5905                0.8748  0.2460
      106     0.4811        0.4051                0.8852  0.6465
      107     0.3618        0.2583                0.8260  0.8007
      108     0.5322        0.4703                0.9318  0.5579
      109     0.5053        0.4703                0.9313  0.5579
      110     0.6491        0.5690                0.9239  0.5703
      111     0.3629        0.1562                0.9230  0.6375
      112     0.5670        0.5000                0.9273  0.5718
      113     0.3807        0.2530                0.9339  0.4484
      114     0.6508        0.5690                0.9275  0.5703
> t
           fishing-v1         habitat-combo species-diversity-3nm
         "regulatory"          "regulatory"       "environmental"
              wgi-all
             "social"

> ohi.model.resilience(r, t, w)
   104    105    106    107    108    109    110    111    112    113
0.5533 0.4800 0.6553 0.6844 0.6372 0.6337 0.6684 0.6144 0.6511 0.5369
   114
0.6695
}
}
\keyword{ohi}

