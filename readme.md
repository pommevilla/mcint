# MCInt

A basic R code implementing a Monte Carlo integral simulation.

## Description

There are two functions in `mcint`: `calc_mcint` and `is_under`.  `calc_mcint` calculates a Monte Carlo integral of a provided function with a provided number of trials.  `is_under` is an internal helper function called in `calc_mcint` that determines if a given point is under the function in question.

## Usage

```
calc_mcint = function(N = 100, x_l = 0, x_u = 1, func = function(x) x^2)
```

## Arguments

```
N - the number of trials to be run
x_l - the lower bound of the integral
x_u - the upper bound of the integral
func - the function whose integral is to be approximated 
```

## Example

```
> f = function(x) sin(2 * pi * x)
> calc_mcint(10000, x_u = 1, f)
[1] -0.01235271
```

![Accompanying plot for example input][mc_int_sample]

[mc_int_sample]: https://github.com/pommevilla/mcint/blob/master/mc_int_sample.png


## Details

In addition to returning the estimated integral value, `calc_mcint` plots the curve and the randomly generated points.  The points are colored red if they are beneath the curve (here, beneath means between the curve and the x-axis), and blue otherwise.  

Note that `calc_mcint` approximates the integral value of the function, not the absolute value of the area.  Hence, areas beneath the x-axis have a negative value.  

## Contact

Send questions, comments, hate mail to pvillanueva13 at gmail dot com




