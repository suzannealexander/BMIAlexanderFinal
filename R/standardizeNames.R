#' Standardize Variable Names
#'
#' This function standardizes the variable names in a tibble data to "small camel case".
#'
#' @param data A tibble
#'
#'
#' @examples
#' library(dplyr)
#' library(janitor)
#' data <- tibble::tibble(First_Name = c(1, 2, 3), Last_Name = c(4, 5, 6))
#' standardizeNames(data)
#'
#' @export
standardizeNames <- function(data) {
  # updating data dataframe with standardized column names
  data <- data %>%
    # renaming columns using make_clean_names() and rename_with()
    rename_with(~ janitor::make_clean_names(.x))

  # Returning the dataframe with standardized column names
  return(data)
  }


