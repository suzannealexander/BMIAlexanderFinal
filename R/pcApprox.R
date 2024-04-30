#' Approximate Data using Principal Components
#'
#' This function returns an approximation to the data \code{x} based on the specified number of principal components (\code{npc}).
#'
#' @param x A numeric matrix or data frame representing the data to be approximated.
#' @param npc An integer specifying the number of principal components to use for approximation.
#'
#' @return A matrix representing the approximation to the original data based on the specified number of principal components.
#'
#' @details This function performs principal component analysis (PCA) on the input data \code{x} and uses the selected principal components to approximate the original data. The approximation is rescaled and centered to match the original data.
#'
#' @examples
#' # Generate sample data
#' set.seed(123)
#' x <- matrix(rnorm(100), ncol = 5)
#'
#' # Approximate data using 3 principal components
#' pcApprox(x, 3)
#'
#' @export
pcApprox <- function(x, npc) {
  # Performing PCA on the data
  pca_result <- prcomp(x, scale. = TRUE, center = TRUE)

  # Extracting the mean vector of the data
  mean_vec <- pca_result$center
  # Extracting the principal components of the data
  pcs <- pca_result$rotation

  # Selecting the first 'npc' principal components
  pcs <- pcs[, 1:npc]

  # Compute the approximation using the selected principal components
  approx_x <- pcs %*% t(pcs) %*% t(x - mean_vec)

  # Calculating mean of each column of the original data
  mean_x <- apply(x, 2, mean)
  # Calculating standard deviation of each column of the original data
  sd_x <- apply(x, 2, sd)

  # Rescaling the approximation using the original standard deviation and center using the original mean
  approx_x <- approx_x * sd_x + mean_x

  # Returning the PCA-based approximation of the data
  return(approx_x)
}

