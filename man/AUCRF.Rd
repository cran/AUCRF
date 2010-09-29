\name{AUCRF}
\alias{AUCRF}
\alias{print.AUCRF}
\alias{summary.AUCRF}
\alias{exampleData}
\alias{fit}

\title{
  Variable Selection with Random Forest and the Area Under the Curve
}

\description{
  AUCRF is an algorithm for variable selection using Random Forest based on 
  optimizing the area-under-the ROC curve (AUC) of the Random Forest. The proposed
  strategy implements a backward elimination process based on the initial ranking
  of the variables.
}

\usage{
  AUCRF(formula, data, k0 = 1, pdel = 0.2, ranking=c("MDG","MDA"), ...)
}

\arguments{
  \item{formula}{
    an object of class \code{\link{formula}}: a symbolic description of the model 
    to be fitted. The details of model specification are given in \code{Details}.
  }
  \item{data}{
    a data frame containing the variables in the model. Dependent variable must be a 
    binary variable defined as \code{\link{factor}} and codified as \code{1} for 
    positives (e.g. cases) and \code{0} for negatives (e.g. controls).
  }
  \item{k0}{
    number of remaining variables for stopping the backward elimination process. 
    By default \code{k0=1}.
  }
  \item{pdel}{
    fraction of remaining variables to be removed in each step. By default \code{pdel=0.2}. 
    If \code{pdel=0}, only one variable is removed each time.
  }
  \item{ranking}{
    specifies the importance measure provided by \code{randomForest} for ranking the variables.
    There are two options MDG (by default) for MeanDecreaseGini and MDA for MeanDecreaseAccuracy.
  }
  \item{\dots}{
    optional parameters to be passed to the \code{\link{randomForest}} function. If no arguments
    are specified, default arguments of \code{randomForest} function will be used.
  }
}

\details{
  The AUC-RF algorithm is described in detail in Calle et. al.(2011). The following is 
  a summary:
  
  Ranking and AUC of the initial set: \cr
  Perform a random forest using all predictor variables and the response, as specified in the \code{formula}
  argument, and compute the AUC of the random forest. Based on the selected measure of importance (by default MDG), 
  obtain a ranking of predictors.
  
  Elimination process: \cr
	Based on the variables ranking, remove the less important variables (fraction of variables specified in 
	\code{pdel} argument). Perform a new random forest with the remaining variables and compute its AUC.
	This step is iterated until the number of remaining variables is less or equal than \code{k0}. 
	
  Optimal set: \cr
  The optimal set of predictive variables is considered the one giving rise to the Random Forest with the
  highest OOB-AUC\eqn{opt}. The number of selected predictors is denoted by K\eqn{opt}
}


\value{
  An object of class \code{AUCRF}, which is a list with the following components: 
  
  \item{call}{
    the original call to \code{AUCRF}.
  }
  \item{data}{
    the \code{data} argument.
  }
  \item{ranking}{
    the ranking of predictors based on the importance measure.
  }
  \item{Xopt}{
    optimal set of predictors obtained.
  }
  \item{OOB-AUCopt}{
    AUC obtained for the optimal set of predictors.
  }
  \item{Kopt}{
    size of the optimal set of predictors obtained.
  }
  \item{AUCcurve}{
    values of AUC obtained for each set of predictors evaluated in the elimination process.
  }
  \item{RFopt}{
    the \code{randomForest} adjusted with the optimal set.
  }
}
\references{
   Calle ML, Urrea V, Boulesteix A-L, Malats N (2011) "AUC-RF: A new strategy for genomic 
   profiling with Random Forest". Human Heredity. (In press)
}

\seealso{
    \code{\link{OptimalSet}}, \code{\link{AUCRFcv}}, \code{\link{randomForest}}.
}

\examples{
   
  # load the included example dataset. This is a simulated case/control study  
  # data set with 4000 patients (2000 cases / 2000 controls) and 1000 SNPs, 
  # where the  first 10 SNPs have a direct association with the outcome:
  data(exampleData)
  
  # call AUCRF process: (it may take some time)
  # fit <- AUCRF(Y~., data=exampleData)
  
  # The result of this example is included for illustration purpose:
  
  data(fit)
  summary(fit)
  plot(fit)
  
  # Additional randomForest parameters can be included, otherwise default
  # parameters of randomForest function will be used:
  # fit <- AUCRF(Y~., data=exampleData, ntree=1000, nodesize=20)
}
