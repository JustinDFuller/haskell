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
let divideBySevenRemainderThree = [x | x <- [50..100], x `mod` 7 == 3]
-- [52,59,66,73,80,87,94] 

-- The output function is what many fp programmers would call a map
-- The predicate is what many fp programmers would call a filter

-- You can have multiple predicates
let notThirteenFifteenOrNineteen = [x | x <- [10..20], x /= 13, x /= 15, x /= 19]  
-- [10,11,12,14,16,17,18,20]  

-- A list comprehension can have multiple lists, and all possible combinations
-- Will be given to the output function
let twoListComprehension = [x*y | x <- [2,5,10], y <- [8,10,11]] 
-- [16,20,22,40,50,55,80,100,110] 

-- You can see 2 was multiplied by 8, 10, and 11. The same goes for 5 and 10.

-- You can still filter with a predicate, just as before
let twoListCompWithFilter = [x*y | x <- [2,5,10], y <- [8,10,11], x*y > 50]
-- [55,80,100,110]

-- As you guessed, comprehensions are not limited to numbers
let nouns = ["hobo","frog","pope"]
let adjectives = ["lazy","grouchy","scheming"]
let nounAdjectiveCombos = [adjective ++ " " ++ noun | adjective <- adjectives, noun <- nouns]
-- ["lazy hobo","lazy frog","lazy pope","grouchy hobo","grouchy frog",  
-- "grouchy pope","scheming hobo","scheming frog","scheming pope"] 

-- Example uses

-- Get the length of a list
listLength = xs = sum [1 | _ <- xs] -- convert every index to the number 1, and then sum the list of 1s
-- the "_" means that we are not drawing a variable

-- Remove anything that is not an uppercase letter
removeNonUppercase st = [c | c <- st, c `elem` ['A'..'Z']]   

-- What if the list contains other lists?
let xxs = [[1,3,5,2,3,1,2,4,5],[1,2,3,4,5,6,7,8,9],[1,2,4,2,1,6,3,1,3,2,3,6]] 
let onlyEvenLists = [[x | x <- xs, even x] | xs <- xxs] -- [[2,2,4],[2,4,6,8],[2,4,2,6,2,6]] 
-- Here we have two list comprehensions, one inside another!
-- The outer list comprehension pulls out each nested list as the variable "xs"
-- Then the inner list comprehension pulls out each index from "xs" as "x"
-- And finally the predicate of the inner comprehension filters out any numbers that are not even

