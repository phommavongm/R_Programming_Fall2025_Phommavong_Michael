# Michael Phommavong
# Assignment 11: Debugging and Defensive Programming in R

# Objectives:
# Learn to reproduce and interpret error messages in R
# Practice identifying and fixing logical vs. element-wise operations
# Document a defensive programming workflow

# Background and Buggy Code (Hint: The line with && may be incorrect. Maybe?)
# Helper: Identify outliers in one column using Tukey’s rule
tukey.outlier <- function(x) {
  q1 <- quantile(x, 0.25, na.rm = TRUE)
  q3 <- quantile(x, 0.75, na.rm = TRUE)
  iqr <- q3 - q1
  lower <- q1 - 1.5 * iqr
  upper <- q3 + 1.5 * iqr
  x < lower | x > upper
}

tukey_multiple <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in 1:ncol(x)) {
    outliers[, j] <- outliers[, j] && tukey.outlier(x[, j])
  }
  outlier.vec <- vector("logical", length = nrow(x))
  for (i in 1:nrow(x)) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  return(outlier.vec)
}

# Tasks:
# 1. Reproduce the Error
# Start by creating a test matrix and run the function:
set.seed(123)
test_mat <- matrix(rnorm(50), nrow = 10)
tukey_multiple(test_mat)

# 2. Diagnose the Bug
# Reflect on why using && inside the loop causes the failure. 
# (Recall that && only returns a single TRUE/FALSE for the first element, 
# whereas you need element‑wise comparison.)

# 3. Fix the Code
# Corrected inside the loop:
# outliers[, j] <- outliers[, j] & tukey.outlier(x[, j])
corrected_tukey <- function(x) {
  # Defensive check
  if (!is.matrix(x) || !is.numeric(x)) {
    stop("Input must be a numeric matrix.")
  }
  
  outliers <- array(TRUE, dim = dim(x))
  for (j in seq_len(ncol(x))) {
    outliers[, j] <- outliers[, j] & tukey.outlier(x[, j])
  }
  
  outlier.vec <- logical(nrow(x))
  for (i in seq_len(nrow(x))) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  outlier.vec
}

# 4. Validate Your Fix
corrected_tukey(test_mat)
