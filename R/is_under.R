#' Calculates if a point is under a curve
#'
#' The point (x, y) is under a curve func(x) if y <= func(x)
#' @param func the function of interest
#' @param x, y the coordinates of the point of interest
#' @return The boolean (x, y) <= (x, func(x))
is_under <- function(func, x, y)
{

  # To see if a point is under a curve for a Monte Carlo integral, we only want to
  # count the points that are between the curve and the x-axis.
  # This is why the second part of the boolean expressions check against 0.
  under = ifelse(func(x) < 0, func(x) <= y & y <= 0, func(x) >= y & y >= 0)

  return(under)
}

