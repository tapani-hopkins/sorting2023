#' Upload pinned wasps to Kotka
#'
#' Creates a Kotka upload file for pinned wasps. Everything in the file should be ready except for the specimen IDs (but worth looking through the file just in case).
#'
#' @param x Data frame with at least columns "wasp_jar", "nwasps" and "no_microgastrinae". Usually exported from file "Samples sorted.numbers".
#' @param f File path where to store the upload file. Will refuse to overwrite existing files.
#'
#' @return If the file already exists or the folder can't be found, returns a message.
#' @export
upload_wasps = function(x, f="uploads/kotka_upload_wasps.csv"){
	
	# stop if 'f' exists
	if (file.exists(f)){
		warning(paste0("File ", f, " already exists. Are you sure you have already uploaded it to Kotka? If you have, delete it and call upload_wasps() again."))
		return("Wasp upload file exists.")
	}
	
	# stop if folder does not exist
	if (! dir.exists(dirname(f))){
		warning(paste0("Folder ", dirname(f), " does not exist. Either create it or update the file path ()'f'), and call upload_wasps() again."))
		return("Wasp upload folder does not exist.")
	}
	
	# add data on Malaise sample and microgastrinae ID
	x = add_equivalents(x)
	
	# get path where to save problems file
	f2 = paste0(dirname(f), "/kotka_upload_problems.csv")
	
	# upload wasps
	wasps2kotka::make_upload(x, nwasps=x$nwasps, upload_file=f, problems_file=f2)
	
}