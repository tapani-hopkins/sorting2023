% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/documentation_package_and_data.R
\docType{package}
\name{sorting2023-package}
\alias{sorting2023}
\alias{sorting2023-package}
\title{sorting2023: Upload sorted Ugandan wasp jars and pinned wasps to Kotka}
\description{
Functions for use when sorting Ugandan wasps. Especially for the sorting of Pimplinae, Microgastrinae etc in 2023. Create a Kotka upload for the pinned wasps. Update wasp jar data in Kotka, to tell what subfamilies have been removed. Store a list of all sorted wasp jars.
}
\details{
Typical usage is to:
\itemize{
\item Export "Samples sorted.numbers" to csv.
\item Use  \code{\link[=upload_wasps]{upload_wasps()}}, \code{\link[=update_sorted]{update_sorted()}} and \code{\link[=update_events]{update_events()}} to create an upload file for the wasps, update "samples_sorted.csv", and update the wasp jar data in Kotka.
\item Delete the upload/update files after uploading to Kotka.
}

When using the functions with the default values, there should be a file "samples_sorted.csv" and a folder "uploads" in the working directory.
}
\author{
\strong{Maintainer}: Tapani Hopkins \email{tapani-hopkins@users.noreply.github.com} (\href{https://orcid.org/0000-0002-2256-0098}{ORCID})

}
\keyword{internal}
