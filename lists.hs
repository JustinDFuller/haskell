-- NOTE: this file is not meant to compile at this time..it demonstrates syntax

-- Lists are homogenous data structures.
-- They can only contain a single type

-- strings are lists
let stringList = "lists are strings"

-- You can add on to the string like this:
let anotherString = stringList ++ "Another string!"

-- be careful when using ++ because haskell iterates
-- The entire list on the LEFT side of ++

-- You can add a single character to the beginning of the list instead
let another = "!":anotherString

-- In haskell it is more performant to add to the beginning of a list than the end.
let numberList = [1,2,3,4,5] 
let zeroIndexedNumberList = 0:numberList

-- notice ":" takes a char on the left and a list on the right
-- While ++ takes a list on both sides

-- You can retrieve from a list with "list !! index" like this:
let five - numberList !! 4

-- Note that indexes start at zero because haskell is a sane language :)

-- Lists can also contain other lists
let listOfNumberLists = [numberList, [1,2,3]]

-- The inner lists can be different lengths but NOT different types

-- You can compare lists if they have comparable types

[3,2,1] > [2,1,0] -- true

[3,20,1] > [3,10,100] -- true, compares each element starting at 
-- index 0 until if finds a pair that are not equal

-- Standard list functions
head numberList -- 1
tail numberList -- [2,3,4,5]
last numberList -- 5
init NumberList -- [1,2,3,4]

-- beware calling the above functions on an empty list throws an error
-- below are some functions that can help guard against that exception

length numberList -- 5
length [] -- 0
null numberList -- false
null [] -- true

-- more useful list functions

reverse numberList -- [5,4,3,2,1]
take 1 numberList -- 1
drop 2 numberList -- [3,4,5]
maximum numberList -- 5
sum numberList -- 15
product numberList -- 120
elem 5 numberList -- true
elem 6 numberList -- false
