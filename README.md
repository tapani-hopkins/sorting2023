# sorting2023

R package for use at the [Zoological Museum of the University of Turku](https://collections.utu.fi/en/zoological-museum/). Helps when sorting the wasps collected by Malaise trapping in [Uganda 2014-2015](https://doi.org/10.5281/zenodo.2225643).

Meant especially for the 2023 sorting and pinning of subfamilies Banchinae, Ophioninae, Pimplinae, Microgastrinae and Tryphoninae:Netelia. Mainly for my own use, may not be very useful for anyone else.

Takes a file in which I write what wasp jars I have sorted. For each jar, the file also tells:
- the number of pinned wasps
- what box the pinned wasps are in
- whether or not Microgastrinae were found

Based on these, creates an upload file for the wasps to the [Kotka Collection Management System](https://wiki.helsinki.fi/display/digit/Manual+for+Kotka). Also creates an update file for the wasp jars. And saves info on what jars have been sorted (and which of them contained Microgastrinae) for future reference.


## Installation

You can install the development version of wasps2kotka from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("tapani-hopkins/sorting2023")
```

## Usage

### Short version

``` r
# create example of the input file's data
x = data.frame(wasp_jar=6919, nwasps=6, box="BOX18", no_microgastrinae=NA)

# load the package
library(sorting2023)

# make a kotka upload for the wasps
upload_wasps(x, f="uploads/kotka_upload_wasps.csv")

# add the sorted samples to file
update_sorted(x, f="sorted_samples.csv")

# make a kotka update for the wasp jars
update_events(x, f = "uploads/new_events.csv")
```
The above assumes that R is in a working directory that is organised like mine. The folder contains:
- file "sorted_samples.csv" for listing wasp jars that have been sorted
- folder "uploads" for the Kotka upload/update files

After running:
- Upload the wasps to Kotka (they may still need specimen IDs).
- Download the wasp jars from Kotka, update their data to show what subfamilies have been removed, then upload to Kotka.
- Delete the upload files when done.


