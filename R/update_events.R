#' Upload wasp jar data (events) in Kotka
#'
#' Creates Kotka events to mark a jar as having been checked (e.g. "2023-01-27 Pimplinae removed"). Also creates a second file that lists the wasp jar IDs, so they are easy to search for in Kotka.
#'
#' @param x Data frame with at least column "wasp_jar". Usually exported from file "Samples sorted.numbers".
#' @param f File path where to store the upload file. Will refuse to overwrite existing files.
#' @param removed Character vector of what taxa have been removed.
#'
#' @return If the file already exists or the folder can't be found, returns a message.
#' @export
update_events = function(x, f="uploads/new_events.csv", removed = c("Banchinae", "Microgastrinae", "Ophioninae", "Pimplinae", "Tryphoninae:Netelia")){
	
	# stop if 'f' exists
	if (file.exists(f)){
		warning(paste0("File ", f, " already exists. Are you sure you have already uploaded it to Kotka? If you have, delete it and call update_events() again."))
		return("Event file exists.")
	}
	
	# stop if folder does not exist
	if (! dir.exists(dirname(f))){
		warning(paste0("Folder ", dirname(f), " does not exist. Either create it or update the file path ()'f'), and call update_events() again."))
		return("Event folder does not exist.")
	}
	
	# add time stamp and other standard text to events
	events = paste(Sys.Date(), removed, "removed")
	
	# ignore duplicate entries (typically wasp jars whose wasps are in two different boxes)
	x = x[!duplicated(x$wasp_jar), ]
	
	# create data frame with wasp jar IDs and their events
	u = data.frame(matrix(events, nrow=nrow(x), ncol=length(events), byrow=T))
	u = cbind(wasp_jar=x$wasp_jar, u)
	
	# create search text to paste into Kotka to download the wasp jars
	searchtext = paste0("ZMUT.", x$wasp_jar, collapse=", ")
	
	# save events and search text to file
	utils::write.table(u, file=f, row.names=F, col.names=F, sep=",")
	f2 = paste0(dirname(f), "/new_events_searchtext.txt")
	utils::write.table(searchtext, file=f2, row.names=F, col.names=F, quote=F)
	
}