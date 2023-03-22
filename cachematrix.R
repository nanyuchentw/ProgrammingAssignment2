## These are two functions (makeCacheMatrix and cacheSolve). 
## makeCacheMatrix is the function that offers the "parent " environment for cacheSolve

## The makeCacheMatrix function takes a matrix as argument then creates a list that contains 4 functions (get, set, setResult and getResult)
## The set() and setResult() function in makeCacheMatrix are used to set the stored(cached) matrix and the inverted matrix, respectively
## The get() and getResult () function in makeCacheMatrix are used for getting the stored(cached) matrix and the inverted matrix, respectively

makeCacheMatrix <- function(x = matrix()) {
        r_m <- NULL                               ## r_m which is used for storing the inverted matrix and is set to NULL at the beginning
        set <- function(y) {                      ## the set() function can be used to set any arbitrary matrix to cache
            x <<- y                               
            r_m <<- NULL                          ## if an arbitrary matrix is set to cache, the inverted matrix (i.e. r_m) is set to NULL
        }
        get <- function() x                       ## get() is used to get the cached matrix
        setResult <- function (z) r_m <<- z       ## setResult() is used to set an arbitrary matrix as the result inverted matrix
        getResult <- function () r_m              ## getResult() is used to get the cached inverted matrix: r_m
        list(set= set, get= get, setResult=setResult, getResult=getResult)    #The makeCacheMatrix contain the above 4 functions and make them into a list
}


## The cacheSolve function take a list as the argument. It uses the $get() function in its parent environment (makeCacheMatrix) to get the stored (cached) matrix in the list
## Then it uses the solve() function to have the inverted matrix, named r_m here
## The r_m is then used as the argument for $setResult() to set the stored inverted matrix

cacheSolve <- function(x, ...) {
        r_m <- x$getResult()
        if (!is.null(r_m)) {                  ## check if the same inverted matrix has been calculated 
            print("getting cache data")
            r_m
        } else {
            r_m <- solve(x$get())
            x$setResult (r_m)
            r_m                               ## Return a matrix r_m that is the inverse of 'x'
        }                                     
}

## Try these with a test matrix: test_M
#  test_M <-matrix(c(3, 5, 4, 3,1,6,7,3,2), nrow = 3)
#  x <- makeCacheMatrix(test_M)
## x$get() we can see the stored test_M matrix
## x$getResult() the result is still NULL as we have not calculated the inverted matrix

## Now, put the x (i.e. makeCacheMatrix(test_M)) into cacheSolve()
## cacheSolve(x)
## Then we get the inverted matrix (r_m) of our input matrix test_M by solve() 
## The cacheSolve() also takes this resulted matrix r_m to setResult() the cached matrix x
## Now we can see there is an inverted matrix in x$getResult()
#  x$getResult()
