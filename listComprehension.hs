-- Note: This file is not meant to compile. At this point it only demonstrates syntax.

-- A basic comprehension for a set that contains the first ten even natural numbers is set notation 
let firstTenEvenNumbers = [x*2 | x <- [1..10]] -- [2,4,6,8,10,12,14,16,18,20]

-- The part before the pipe "|" is the output function
-- After the pipe, x is the variable retrieved from the list
-- And then of course we have the list

-- We can also add a predecate to further filter the result
let firstTenEvenNumbersGreaterThanTwelve = [x*2 | x <- [1..10], x*2 >= 12] -- [12,14,16,18,20]

-- The output function modifies the variable
-- The function retrieves the variable from the list
-- The predicate filters the output

-- Here's a simple filter function, keeping any number where x divided by 7, the remainder is 3
let divideBySevenRemainderThree = [ x | x <- [50..100], x `mod` 7 == 3]
-- [52,59,66,73,80,87,94] 

-- The output function is what many fp programmers would call a map
-- The predicate is what many fp programmers would call a fitler

-- You can have multiple filters
let notThirteenFifteenOrNineteen = [ x | x <- [10..20], x /= 13, x /= 15, x /= 19]  
-- [10,11,12,14,16,17,18,20]  
