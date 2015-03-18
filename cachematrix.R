## Put comments here that give an overall description of what your
## functions do

## computing inverse of a matrix is a memory intensive and time consuming process.
## Hence caching the inverse of a matrix will greatly improve the performance of the
## the code/logic to be used, and there is no need to repeatedly compute the inverse.
## the following 2 functions demostrate the usage of caching.

## Write a short comment describing this function

# makeCacheMatrix creates a list containing a function to
# 1. setting the value of the matrix
# 2. getting the value of the matrix
# 3. setting the value of inverse of the matrix
# 4. gettting the value of inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) m <<- inverse
    getinverse <- function() m
    list(set = set, get = get,
    setinverse = setinverse,
    getinverse = getinverse)
    
}


## Write a short comment describing this function

## the following function returns the inverse of a matrix.
## This function fist checks if the value is already computed
## if it is not computed, the solve() function, computes and returns the inverse.
## If it is already computed, then the value is taken from the cache.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
}
