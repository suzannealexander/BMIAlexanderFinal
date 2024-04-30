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

  # Step 3: Send HTTP POST Request to RedCap
  response <- httr::POST(redcapUrl, body = formData, encode = "form")

  # Step 4: Handle Response
  redcap_data <- httr::content(response)

  # Step 5: Convert Response to Tibble
  redcap_tibble <- readr::read_csv(redcap_data)  # Assuming response content is CSV

  # Step 6: Return Tibble
  return(redcap_tibble)
}
