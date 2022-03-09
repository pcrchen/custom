## Load required libraries
library(optparse) # for allowing this script to read in command line arguments
library(msa)      # for multiple sequence align a fasta file


##################################################
### CUSTOM PRINT FUNCTION
##################################################

## Custom print function to print pretty messages to the terminal output
print_message <- function(msg) {
  cat("\n\n")
  cat("##################################################\n")
  cat(paste0("### ", msg, "\n"))
  cat("##################################################\n")
  cat("\n")
}


##################################################
### Command line argument
##################################################

## (so I don't have to edit this script
##  whenever I want to use a different input file)

## Command line argument options
option_list = list(
  make_option(c("-i", "--input"),
              action = "store",
              type = "character",
              default = NULL,
              help = "The path to the input fasta file to be aligned.",
              metavar = "character"),
	make_option(c("-o", "--output"),
              action = "store",
              type = "character",
              default = NULL,
              help = "The path to the output aligned fasta file.",
              metavar = "character")

)

## Read in command line arguments
option <- parse_args(OptionParser(option_list = option_list))

## Check if input path is supplied before proceeding
if (is.null(option$input)) {
  print_help(option_parser)
  stop("Input directory path must be supplied to --in flag.")
}

## Check if output path is supplied before proceeding
if (is.null(option$output)) {
  print_help(option_parser)
  stop("Output directory path must be supplied to --out flag.")
}

## Assign input and output to new variables
input <- option$input
output <- option$output


##################################################
### Multiple sequence alignment
##################################################

## Read in input fasta file
asv_seq <- readDNAStringSet(input)
asv_aln <- msa::msa(
                  asv_seq,
                  method = "ClustalW",
                  order = "input"
                ); asv_aln

writeXStringSet(
  DNAStringSet(asv_aln),
  filepath = output
)


##################################################
### Analysis complete
##################################################

print_message("Analysis Complete")
