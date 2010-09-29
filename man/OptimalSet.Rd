\name{OptimalSet}
\alias{OptimalSet}

\title{
  AUCRF optimal set selection.
}

\description{
  Returns the optimal set of predictive variables selected by the AUC-RF method.
}

\usage{
   OptimalSet(object)
}

\arguments{
  \item{object}{
    an object of class \code{AUCRF} as the result of \code{AUCRF} or \code{AUCRFcv} 
    functions.
  }
}

\value{
  A data.frame with the selected variables ordered by the initial ranking, their importance 
  values (initial ranking) and, if available, the probability of selection value measured by 
  \code{AUCRFcv} function.  
}

\seealso{
  \code{\link{AUCRF}},  \code{\link{AUCRFcv}}.
}

\examples{
  data(fitCV)
  OptimalSet(fitCV)
}
