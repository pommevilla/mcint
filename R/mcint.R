#' Calculate Monte Carlo Integral
#'
#' Takes in any numeric value and squares it.
#' @param N the number of random points
#' @param x_l, x_u the lower and upper bounds on x, respectively
#' @param func the function whose integral we are estimating
#' @return Estimated integral given by Monte Carlo integration.
#' @export
calc_mcint <- function(N, x_l = 0, x_u = 1, func = function(x) x^2)
{

  # Find lower and upper limits for y
  y_l <- optimize(f, c(x_l, x_u))$objective
  y_u <- optimize(f, c(x_l, x_u), maximum = TRUE)$objective

  # Generate a N x 2 matrix of points drawn from uniform distributions based on
  # lower and upper limits on x and y.
  pts_x = matrix(runif(N, x_l, x_u))
  pts_y = matrix(runif(N, y_l, y_u))
  pts = cbind(pts_x, pts_y)

  # Find all the points in pts that are under the curve in question.
  pts_under = matrix(is_under(func, pts[, 1], pts[, 2]))

  # Create a new column to keep track of which points are under
  # pts = cbind(pts, pts_under)


  # Plot the points that are above the curve.
  plot(pts[!pts_under, 1], pts[!pts_under, 2], col = "blue", xlab = "x", ylab = "y")

  # Plot the points that are below the curve.
  points(pts[pts_under, 1], pts[pts_under, 2], col = "red")

  # Plot func.
  curve(func, x_l,x_u, ylim=c(y_l, y_u), col = "black", add = TRUE)

  mn <- mean(f(pts_x))

  # Find the area of the plotted curve.
  base = x_u - x_l
  height = y_u - y_l
  area = base * height

  return(mn * area)
}
