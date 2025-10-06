# Michael Phommavong
# Assignment 6: Matrix Operations and Construction
# 10/5/25


# 1. Matrix Addition and Subtraction
A <- matrix(c(2, 0, 1, 3), ncol = 2) # Create matrix A
B <- matrix(c(5, 2, 4 ,-1), ncol = 2) # Create matrix B
A # Display matrix A
B # Display matrix B
A + B # Compute A + B and display the results
A - B # Compute A - B and display the results


# 2. Create a Diagonal Matrix
# Use diag() to build a 4 x 4 matrix with diagonal entries 4, 1, 2, 3:
D <- diag(c(4,1,2,3))
D # Display matrix D


# 3. Construct a Custom 5 x 5 Matrix
C <- cbind(
  c(3, 2, 2, 2, 2),              # set the first column
  diag(c(1, 3, 3, 3, 3))[ , -1]  # set diag for remaining columns
)
C[1, -1] <- 1                    # set the top row to 1 except for first element
C # Display matrix C
