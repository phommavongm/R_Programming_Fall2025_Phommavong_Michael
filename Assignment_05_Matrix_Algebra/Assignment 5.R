# Michael Phommavong
# LIS 4270
# Assignment 5 - Matrix Algebra in R

# Create the matrices
A <- matrix(1:100,  nrow = 10)
B <- matrix(1:1000, nrow = 10)

# Inspect dimensions
dim(A)  # should be 10 x 10
dim(B)  # 10 x 100  - not square

# For A
invA <- solve(A)
detA <- det(A)

# For B, use tryCatch to capture errors
invB <- tryCatch(solve(B), error = function(e) e)
detB <- tryCatch(det(B),   error = function(e) e)

# Additional examples to try

# Transpose (flip rows/columns)
A_t <- t(A)
B_t <- t(B)

# Multiply matrix by a vector
v <- 1:10
A_multiplied <- A %*% v

# Multiply two matrices (key step)
C <- A %*% B
dim(C)   # [1] 10 100
