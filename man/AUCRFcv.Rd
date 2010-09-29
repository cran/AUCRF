\name{AUCRFcv}
\alias{AUCRFcv}
\alias{fitCV}

\title{
  Repeated cross validation of the AUC-RF process.
}

\description{
  Performes a repeated cross validation analysis and computes the probability of selection for 
  each variable.
}

\usage{
  AUCRFcv(x, nCV = 5, M = 20)
}

\arguments{
  \item{x}{
    an object of class \code{AUCRF}.
  }
  \item{nCV}{
    number of folds in cross validation. By default a 5-fold cross validation is performed.
  }
  \item{M}{
    number of cross validation repetitions.
  }
}

\details{
  The results of this repeated cross validation analysis are (1) a corrected estimation 
  of the predictive accuracy of the selected variables and (2) an estimate of the probability of selection for 
  each variable.\cr
  The AUC-RF algorithm is exhaustively described in Calle et. al.(2011).
}

\value{
  The same \code{AUCRF} object passed (see \code{\link{AUCRF}}) as argument but updated with the following
  components:
  
  \item{cvAUC}{
    mean of AUC values in test datasets of the optimal sets of predictors.
  }
   \item{Psel}{
    probability of selection of each variable as the proportion of times that is selected by AUC-RF method.
  }

}

\references{
   Calle ML, Urrea V, Boulesteix A-L, Malats N (2011) "AUC-RF: A new strategy for genomic 
   profiling with Random Forest". Human Heredity. (In press)
}

\seealso{
  \code{\link{OptimalSet}}, \code{\link{AUCRF}}, \code{\link{randomForest}}.
}


\examples{
  # Next steps take some time
  
  # load included AUCRF result example:
  # data(fit)
  
  # call AUCRFcv process:
  # fitCV <- AUCRFcv(fit)
  
  # The result of this example is included:
  
  data(fitCV)
  summary(fitCV)
  plot(fitCV)
}
