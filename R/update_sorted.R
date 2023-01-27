#' Add sorted samples to file
#'
#' Adds the wasp jars that have been sorted to a file. Typically to sorted_samples.csv, to make it easier to keep track of what has been sorted and what hasn't. Includes additional data such as the Malaise sample the jar came from, and the ID of the Microgastrinae tube which came from the wasp jar.
#'
#' @param x Data frame with at least columns "wasp_jar" and "no_microgastrinae". Usually exported from file "Samples sorted.numbers". All columns are added to the file.
#' @param f File path where to add the samples. Make sure you add to the right file!
#'
#' @export
update_sorted = function(x, f="sorted_samples.csv"){
	
	# add data on Malaise sample and microgastrinae ID
	x = add_equivalents(x)
	
	# add timestamp
	x$date = Sys.Date()
	
	# add to file
	utils::write.table(x, file=f, append=T, row.names=F, col.names=F, sep=",")
	
}