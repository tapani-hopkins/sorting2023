#' @details 
#' Typical usage is to:
#' * Export "Samples sorted.numbers" to csv.
#' * Use  [upload_wasps()], [update_sorted()] and [update_events()] to create an upload file for the wasps, update "samples_sorted.csv", and update the wasp jar data in Kotka.  
#' * Delete the upload/update files after uploading to Kotka.
#'  
#' When using the functions with the default values, there should be a file "samples_sorted.csv" and a folder "uploads" in the working directory.
#' @keywords internal
"_PACKAGE"


#' Ugandan wasp jars and their matching Malaise samples and Microgastrinae tubes
#'
#' Identifiers of Ugandan wasp jars, with the Malaise samples they came from and the Microgastrinae tubes that were (or will be) split from them. 
#'
#' @format A data frame with 876 rows (one row for each sample) and 6 variables. The variables are:
#' * wasp_jar Identifier of a wasp jar. Short form, e.g. "6919".
#' * microgastrinae_tube Identifier of a microgastrinae tube. Short form, e.g. "4770"
#' * sample Identifier of a Malaise sample. Short form, e.g. "CCT1-141022".
#' 
#' ...and three columns with the same identifiers in long format, e.g. "http://mus.utu.fi/ZMUT.6919", "http://mus.utu.fi/ZMUT.4470", "http://mus.utu.fi/ZMUT.CCT1-141022".
"equivalents"
