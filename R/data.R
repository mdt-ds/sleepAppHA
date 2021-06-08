#' experiment data for evaluating the best possible marketing message.
#'
#' data from a survey experiment that would display
#' a random combination of phrases
#' along with a price and the length of a subscription.
#' Each respondent saw 12 random permutations of the message. F
#' or each permutation, the respondent was asked to rate
#' "How likely are you to download this mobile app?".
#'
#' @format A data frame with 10704 rows and 9 variables:
#' \describe{
#'   \item{response_id}{identifier of the response}
#'   \item{task}{identifier of the 12 random permutation of the message}
#'   \item{duration}{duration of the subscription}
#'   \item{offer}{phrase explaining which is the offer}
#'   \item{outcome}{phrase expressin which is the result}
#'   \item{price}{price of the subscription}
#'   \item{rtb}{method used to achieve outcome}
#'   \item{social_proof}{proof by which is backed by}
#'   \item{answer}{overall likeliness to download}
#' }
#' @source data provided by Gradient Metrics for Homework Assignment
#' @usage data(experiment_data)
"experiment_data"


#' survey data associated with experiment data
#'
#' data from a regular survey with a set of questions related to
#' sleep and socio-demographic behavior
#'
#' @format A data frame with 892 rows and 100 variables
#'
#' @source data provided by Gradient Metrics for Homework Assignment
#' \url{https://docs.google.com/document/d/1NpkDqtKKxesKislnQuTwsdixwpic-REHmByeAeRFjhs/edit}
#' #' @usage data(survey_data)
"survey_data"
