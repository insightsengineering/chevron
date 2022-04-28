std_study_object <- yaml::read_yaml(system.file("extdata", "std_study_object.yaml", package = "chevron"))

usethis::use_data(std_study_object)
