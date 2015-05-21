## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    
    ## using the example for makeVector as a guide, create the set and get functions  
    ## create a function set where the value will be cached. 
    ## matrix is created in setMatrixInverse
    ## changes made to cached matrix
    
    set <- function(y) {
        x <<- y
        
        ## change the value of the inverse of the matrix if the original matrix was changed
        ## create a value for an inverse matrix and set it to NULL
        
        matrixinverse <<- NULL
    }
    
    ## gets the value of the inverse
    
    get <- function() x
    
    ## calculates the inverse of matrix with the solve function
    
    setMatrixInverse <- function(solve) matrixinverse <<- solve
    
    ## creates and grabs the inverse
    
    getMatrixInverse <- function() matrixinverse
    
    ## passes the value of the makeCacheMatrix function and creates a list    
    
    list(set = set, get = get,
         setMatrixInverse = setMatrixInverse,
         getMatrixInverse = getMatrixInverse)
}

## create cacheSolve function to get the cache of the matrix
## similar to cacheMean function in course example

cacheSolve <- function(x, ...) {
    matrixinverse <- x$getMatrixInverse()
    
    ## Return a matrix that is the inverse of 'x'
    ## grab the inverse matrix if there is one
    
    if(!is.null(matrixinverse)) {
        message("getting cached data")
        return(matrixinverse)
    }
    
    ## if there isn't an inverse, create it and get it
    
    data <- x$getMatrixInverse()
    matrixinverse <- solve(data, ...)
    x$setMatrixInverse(matrixinverse)
    matrixinverse
}
