\name{plot.AUCRF}
\alias{plot.AUCRF}

\title{
  Plot Method for AUCRF
}

\description{
  The plot method for \code{AUCRF} objects.
}

\usage{
  \method{plot}{AUCRF}(x, which=c("auc","ranking","psel"), showOpt=TRUE, digits=4, 
       maxvars=NULL, ...)
}

\arguments{
  \item{x}{
    an object of class \code{AUCRF} as the result of \code{AUCRF} or \code{AUCRFcv} 
    functions.
  }
  \item{which}{
    specifies the information to plot. There are three options: (1) \code{"auc"} (by default) 
    to plot the curve of AUCs in the backwards elimination process, (2) \code{"ranking"} to plot
    the importance measure in initial ranking of each variable, and (3) \code{"psel"} to 
    plot the probability of selection of each variable. The \code{"psel"} option is only
    available if a cross validation is performed by \code{AUCRFcv} function.\cr
    For option (1), \code{showOpt} and \code{digits} arguments can be specified for more details (see below).\cr
    For options (2) and (3), the number of variables to plot and their order preference can be
    specified by \code{maxvars} and \code{order} arguments, respectively (see below). 
  }
  \item{showOpt}{
    (only applied if \code{"auc"} option is specified in \code{wich} argument).
    If \code{showOpt=TRUE}, the optimal subset is emphasised in the plot.
  }
  \item{digits}{
    (only applied if \code{"auc"} option is specified in \code{wich} argument and 
    \code{showOpt} or \code{showThres} are \code{TRUE}).
    Specifies the number of decimal digits for representing the optimal AUC in the plot.
  }
  \item{maxvars}{
    (only applied if \code{"ranking"} or \code{"psel"} options are specified in \code{wich} argument).
    Number of variables to include in the plot. The specified number of variables with highest importance measure
    (initial ranking) will be plotted. If \code{maxvars=NULL} (by default) the selected variables will be plotted. \cr
    (For large number of variables, their names can be illegible in the plot)
  }
  \item{\dots}{
    other graphical parameters (see \code{\link{par}}).
  }
}

\examples{
  data(fitCV)
  
  # Plotting the AUC in the AUCRF backward elimination process:
  plot(fitCV)
  
  # Plotting the probability of selection of the selected variables:
  plot(fitCV, wich="psel")
  
  # Plotting the 20 variables with highest probability of selection:
  plot(fitCV, wich="psel", maxvars=20)

}
