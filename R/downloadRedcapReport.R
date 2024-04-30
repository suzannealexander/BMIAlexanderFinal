#' Downloading Redcap Report
#'
#' This function reads in an API token, url and report id from Redcap, downloading the report and returning the contents as a tibble
#'
#' @details Reads in Recap API token, queries redcapUrl to return the Redcap Report, returning the contents as a tibble
#'
#' @param redcapTokenName User's RedCap API token name in their .REnviron file
#' @param redcapUrl URL to be queried
#' @param redcapReportId specifies the ID for the Redcap Report to be returned
#' @return A Redcap Report in the form of a tibble
#'
#' @export

downloadRedcapReport <- function(redcapTokenName, redcapUrl, redcapReportId){
  # Reading in the API token from the .Renviron file
  api_token <- Sys.getenv(redcapTokenName)

  # gathering the form data required for the API post request
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

  # sending a post request to the RedCap API
  response <- httr::POST(redcapUrl, body = formData, encode = "form")

  # extracting the content of the response as text
  redcap_data <- httr::content(response, as = "text")

  # converting the CSV response into a tibble
  redcap_tibble <- readr::read_csv(redcap_data, show_col_types = FALSE)

  return(redcap_tibble)
}

