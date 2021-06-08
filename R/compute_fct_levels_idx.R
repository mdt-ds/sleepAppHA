#' Computing factor level index in respect to another factor
#'
#' for a given variable,
#' calculates the index of a level included in this variable
#' in contrast to groups provided by levels of another variable
#'
#' @param tbl input data set
#' @param idx_var index variable name (unquoted)
#' @param grouping_var grouping variable name (unquoted)
#'
#' @return a tibble with 3 columns:
#' the first column contains the grouping factor levels,
#' the second column contains the index variable levels
#' and the third column contains the computed index
#' @export
#'
#' @importFrom rlang .data
#'
#' @examples
#' compute_fct_levels_idx(tbl = survey_data, idx_var = s_age, grouping_var = s_gender)
compute_fct_levels_idx <- function(tbl, idx_var, grouping_var){
  tbl %>%
    dplyr::group_by({{grouping_var}}, {{idx_var}}) %>%
    dplyr::summarise(g_count=dplyr::n()) %>%
    dplyr::group_by({{grouping_var}}) %>%
    dplyr::mutate(g_dist = .data$g_count/sum(.data$g_count)) %>%
    dplyr::select(-.data$g_count) %>%
    dplyr::left_join(
      tbl %>%
        dplyr::group_by({{idx_var}}) %>%
        dplyr::summarise(t_count=dplyr::n()) %>%
        dplyr::mutate(t_dist = .data$t_count/sum(.data$t_count)) %>%
        dplyr::select(-.data$t_count),
      by = rlang::as_label(rlang::enquo(idx_var))
    ) %>%
    dplyr::mutate(index = .data$g_dist/.data$t_dist) %>%
    dplyr::select(-c(.data$g_dist, .data$t_dist)) %>%
    dplyr::ungroup()
}
