#' Get Malaise samples and Microgastrinae tubes linked to a wasp jar
#'
#' This is a helper function used by [upload_wasps()] and [update_sorted()]. For each given wasp jar,   gets the identifier of the Malaise sample it came from, and of the Microgastrinae tube that came from it. 
#'
#' @param x Data frame with at least columns "wasp_jar" and "no_microgastrinae". Usually exported from file "Samples sorted.numbers".
#'
#' @return The data frame (`x`) with added columns "sample", "microgastrinae_tube" and "microgastrinae". "microgastrinae" is blank if no Microgastrinae were found in the sample. 
#'
#' @seealso [upload_wasps()] and [update_sorted()], which use this function.
add_equivalents = function(x){
	
	# get data frame showing which sample and microgastrinae tube matches each wasp jar
	e = sorting2023::equivalents
	
	# for each wasp jar, get the matching Malaise sample and microgastrinae ID
	i = match(x$wasp_jar, e$wasp_jar)
	x$sample = e$sample[i]
	x$microgastrinae_tube = e$microgastrinae_tube[i]
	
	# get microgastrinae IDs for those jars that contained microgastrinae
	# (empty if no microgastrinae = no tube going to Canada)
	x$microgastrinae = ""
	i = is.na(x$no_microgastrinae) | x$no_microgastrinae == ""
	x$microgastrinae[i] = x$microgastrinae_tube[i]
	
	# return
	return(x)

}