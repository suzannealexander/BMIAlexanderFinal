#' Downloading Redcap Report
#'
#' This function reads in an API token, url and report id from Redcap, downloading the report and returning the contents as a tibble
#'
#' @details Reads in Recap API token, queries redcapUrl to return the Redcap Report, returning the contents as a tibble
#'
#' @param redcapTokenName User's RedCap API token in their .REnviron file
#' @param redcapUrl URL to be queried
#' @param redcapReportId specifies the ID for the Redcap Report to be returned
#' @return A Redcap Report in the form of a tibble
#'
#' @export

downloadRedcapReport <- function(redcapTokenName, redcapUrl, redcapReportId){
  api_token <- Sys.getenv(redcapTokenName)
  formData <- list(
    "token" = api_token,
    "content" = "report",
    "format" = "csv",
    "report_id" = redcapReportId,
    "csvDelimiter" = "",
    "rawOrLabel" = "raw",
    "rawOrLabelHeaders" = "raw",
    "exportCheckboxLabel" = "false",
    "returnFormat" = "csv"
  )

  response <- httr::POST(redcapUrl, body = formData, encode = "form")

  redcap_data <- httr::content(response, as = "text")

  redcap_tibble <- readr::read_csv(redcap_data, show_col_types = FALSE)

  return(redcap_tibble)
}

