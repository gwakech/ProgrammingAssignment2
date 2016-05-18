## Use of the inverse of a matrix is considered a better alternative to the costly repeated Matrix inversion

## The function makeCacheMatrix creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) 
{
>source("cachematrix.R")
>my_matrix<-makeCacheMatrix(matrix(1:4,2,2))
>my_matrix$get()
## Here is the output when  the function runs in Rstudio
##      [,1] [,2]
##[1,]    1    3
##[2,]    2    4
>my_matrix$getInverse()
## Here is the output when the function runs in Rstudio 
## NULL
>my_matrix$set(matrix(c(2,2,1,4),2,2))
>my_matrix$get()
## Here is the output when the function runs in Rstudio
##      [,1] [,2]
##[1,]    2    1
##[2,]    2    4
>my_matrix$getInverse()
##  Here is the output when the function runs in Rstudio 
## NULL
}

## The function CacheSolve computes the inverse of the special "matrix" created by the function makeCacheMatrix above.
## Notice that if the inverse has already been computed and the matrix has not changed), then it retrieves the inverse from the cache. 

cacheSolve <- function(x, ...)
{
        ## Return a matrix that is the inverse of 'x'
>cacheSolve(my_matrix)
## Here is the output when the function runs in Rstudio
##      [,1] [,2]
##[1,]   -2  1.5
##[2,]    1 -0.5
>cacheSolve(my_matrix)
## Here is the output when the function runs in Rstudio
##getting cached data
##      [,1] [,2]
##[1,]   -2  1.5
##[2,]    1 -0.5
>my_matrix$getInverse()
## Here is the output when the function runs in Rstudio
##      [,1] [,2]
##[1,]   -2  1.5
##[2,]    1 -0.5
>cacheSolve(my_matrix)
##Here is the output when the function runs in Rstudio
##       [,1]       [,2]
##[1,]  0.6666667 -0.1666667
##[2,] -0.3333333  0.3333333
>cacheSolve(my_matrix)
##Here is the output when the function runs in Rstudio
##getting cached data
##      [,1]       [,2]
##[1,]  0.6666667 -0.1666667
##[2,] -0.3333333  0.3333333
>my_matrix$getInverse()
##Here is the output when the function runs in Rstudio
##      [,1]       [,2]
##[1,]  0.6666667 -0.1666667
##[2,] -0.3333333  0.3333333
>my_matrix$setInverse(matrix(c(2,2,1,4),2,2))
>my_matrix$getInverse()
## Here is the output when the function runs in Rstudio
##       [,1] [,2]
##[1,]    2    1
##[2,]    2    4
>my_matrix$getInverse()
## Here is the output when the function runs in Rstudio
##      [,1] [,2]
##[1,]    2    1
##[2,]    2    4
>cacheSolve(my_matrix)
##Here is the output when the function runs in Rstudio
##getting cached data
##      [,1] [,2]
##[1,]    2    1
##[2,]    2    4

}
