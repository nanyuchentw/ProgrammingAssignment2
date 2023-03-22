## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        r_m <- NULL
        set <- function(y) {
            x <<- y
            r_m <<- NULL
        }
        get <- function() x
        setResult <- function (r_m) m <<- r_m 
        getResult <- function () r_m
        list(set= set, get= get, setResult=setResult, getResult=getResult)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        y <- solve(x)
}

test_M <-matrix(c(3, 5, 4, 3,1,6,7,3,2), nrow = 3)
test_M
r_M <- solve(test_M)
r_M