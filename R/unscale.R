#' Unscaling Vectors
#'
#' This function reverses the transformations of scale() for a vector
#'
#' @details Reverses the centering/scaling of a vector applied by scale()
#'
#'
#' @param x a scaled vector
#' @return the original vector
#' @examples
#' # Example data
#' data <- c(1, 2, 3, 4, 5)
#'
#' # Apply scaling
#' scaled_data <- scale(data)
#'
#' # Reverse the scaling
#' unscale(scaled_data)
#' @export
unscale <- function(x){
  # Applying the function to each row of the scaled matrix
  unscaled <- t(apply(x, 1,
                      # Multiplying each value by the scale factor
                      function(r) r * attr(x, 'scaled:scale') +
                      # Adding back the centering value
                        attr(x, 'scaled:center')))
  # converting the unscaled matrix to a vector and returning it
  return(as.vector(unscaled))
}
