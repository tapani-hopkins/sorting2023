% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/update_sorted.R
\name{update_sorted}
\alias{update_sorted}
\title{Add sorted samples to file}
\usage{
update_sorted(x, f = "sorted_samples.csv")
}
\arguments{
\item{x}{Data frame with at least columns "wasp_jar" and "no_microgastrinae". Usually exported from file "Samples sorted.numbers". All columns are added to the file.}

\item{f}{File path where to add the samples. Make sure you add to the right file!}
}
\description{
Adds the wasp jars that have been sorted to a file. Typically to sorted_samples.csv, to make it easier to keep track of what has been sorted and what hasn't. Includes additional data such as the Malaise sample the jar came from, and the ID of the Microgastrinae tube which came from the wasp jar.
}
