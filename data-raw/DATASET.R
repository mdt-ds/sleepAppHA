## libraries
library(haven)
library(labelled)
library(dplyr)
library(forcats)

## experiment data
experiment_data <-
  read_sav('inst/extdata/experiment_data.sav') %>%
  remove_attributes(attributes = "format.spss") %>%
  mutate(across(.cols = -response_id, .fns = as.factor))

usethis::use_data(experiment_data, overwrite = TRUE)

## survey data
survey_data <-
  read_sav('inst/extdata/survey_data.sav') %>%
  unlabelled() %>%
  mutate(across( where(is.character),
                 .fns = as.factor)) %>%
  remove_attributes(attributes = c("format.spss","label")) %>%
  mutate(across( where(is.factor),
                 .fns = fct_explicit_na,
                 na_level = "not-answered"))

usethis::use_data(survey_data, overwrite = TRUE)
