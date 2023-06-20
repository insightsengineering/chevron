ctc_dir <- read.csv("inst/extdata/ctcdir.csv")
ctcv4_dir <- subset(ctc_dir, CTCv == 4)
ctcv5_dir <- subset(ctc_dir, CTCv == 4)

mla_dir <- read.csv("inst/extdata/mladir.csv")

usethis::use_data(ctcv4_dir, ctcv5_dir, mla_dir, overwrite = TRUE)
