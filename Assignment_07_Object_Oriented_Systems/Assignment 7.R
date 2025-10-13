# Michael Phommavong
# Assignment 7: Object Oriented Systems S3 and S4


# 1. Choose and load dataset
data(mtcars) # Load dataset mtcars into R
head(mtcars) # View first few rows
str(mtcars)  # View structure


# 2. Test generic functions (e.g. print, summary, plot)
print(mtcars)   # test print function
summary(mtcars) # test summary function


# 3.  Explore S3 vs. S4

# Create an S3 object example
s3_obj <- list(name = "Myself", age = 29, GPA = 3.5)
class(s3_obj) <- "student_s3"


# Print method for S3 object
print.Person <- function(x) {
  cat("Name:", x$name, "\nAge:", x$age, "\n")
}

# Test
print(person)


# Create an S4 class
setClass("student_s4",
         slots = c(name = "character", age = "numeric", GPA = "numeric"))

# Create an S4 object
s4_obj <- new("student_s4", name = "Myself", age = 29, GPA = 3.5)

# Define a 'show' method for the class
setMethod("show", "student_s4",
          function(object) {
            cat("Student Information:\n")
            cat("Name:", object@name, "\n")
            cat("Age:", object@age, "\n")
            cat("GPA:", object@GPA, "\n")
          })

# Test
s4_obj