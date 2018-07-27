-- Note: This file is not meant to compile. It is intended to demonstrate syntax.

-- Tuples are like non-homogenous lists. They can contain a variety of types.
-- However, the types they contain are fixed

-- A tuple of just 2 items is a pair
let tuple = (8,10)

-- A list of tuples expects the same size and type of tuple
let listOfTuples = [(1,2),(3,4),(5,6)] -- If you tried to do (5,6,7) you would get an error

-- A list of people might look like this:
let listOfPeople = [("John","Doe",35),("Jane","Doe",30)] -- ("Jane","Doe") would throw an error since it's missing the age

-- Remember that strings are lists of characters, so this shows that tuples can contain any type of list!

-- Standard pair functions (only works on tuples with length of 2)

fst (8, 10) -- 8
snd (8, 10) -- 10
zip [1..] ["one","two"] -- [(1,"one"),(2,"two")]

-- Note a few things here..
-- zip creates a list of pairs (only pairs, not longer tuples)
-- It can have different types in each of the two lists
-- It will shorten the longer of the two lists (see the unlimited list as the first arg above)

-- Here's a contrived example.. looking for right triangles with the perimeter is 24
let rightTrianglesEqualToTwentyFour = [(a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c == 24]
-- [(6,8,10)]

-- This shows that tuples can be used in list comprehensions!
