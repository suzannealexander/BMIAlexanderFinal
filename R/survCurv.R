#' Calculating & plotting survival curve
#'
#' This function takes in numercial vectors status and time to calculate the survival curve S(t), returning a plot of the survival curve
#' @details calculates and plots the survival curve S(t) given the numerical
#' vectors for status and time
#'
#' @param status numerical vector
#' @param time numerical vector
#' @return a plot of the survival curve S(t)
#' @examples
#' data <- read.csv('https://jlucasmckay.bmi.emory.edu/global/bmi510/Labs-Materials/survival.csv')
#'
#' survCurv(data$status, data$time)
#'
#' @export

survCurv <- function(status, time) {
  # Creating a dataframe with time and status
  data <- data.frame(time = time, status = status)
  # Sorting the dataframe by the 'time' column
  data <- data[order(data$time), ]

  # Getting the number of observations
  n <- nrow(data)
  # Extracting the time vector
  time <- data$time
  # Extracting the status vector
  status <- data$status
  # Initializing survival probability for all time points as 1
  survival_prob <- rep(1, n)

  # Calculating Kaplan-Meier estimates
  # starting from the second time point
  for (i in 2:n) {
    # checking if there was an event (status = 1) at the previous time point
    if (status[i - 1] == 1) {
      # Calculating the survival probability using the Kaplan-Meier estimator formula
      survival_prob[i] <- survival_prob[i - 1] * (n - i + 1) / (n - i + 2)
    } else {
      # If no event occurred at the previous time point, keeping the survival probability unchanged
      survival_prob[i] <- survival_prob[i - 1]
    }
  }

  # Plotting the Kaplan-Meier survival curve
  plot(time, survival_prob, type = 's', ylim = c(0, 1), xlab = 'Time', ylab = 'Survival Probability', main = 'Kaplan-Meier Survival Curve')
}


