-- NOTE: this file is not meant to compile at this time..it demonstrates syntax

-- A range is a list that automatically is filled with certain values in a range

let oneThroughTwenty = [1..20]
-- [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

let aThroughZ = ['a'..'z']
-- "abcdefghijklmnopqrstuvwxyz"

-- You can specify a step by setting the first index
let twoThroughTwenty = [2,4..20]
-- [2,4,6,8,10,12,14,16,18,20]

-- Ranges work by finding the difference between index 0 and 1
let twentyThroughOne = [20,19..1] -- differences is -1
-- [20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]

-- Ranges are limited to simple adding and subtracting

-- Be REALLY careful with floating point ranges because of their precision (or lack of it)
let floatingPointRange = [0.1, 0.3 .. 1]
-- [0.1,0.3,0.5,0.7,0.8999999999999999,1.0999999999999999]\

-- Haskell is "lazy" and won't evaluate your list until it knows what you want out of it
let infiniteList = [13,26..] -- produces an unlimited list because of no upper bound
let firstFour = take 4 infiniteList
-- [13,26,39,52]

-- There is a function to create an unlimited list
let oneTwoThreeForever = cycle [1,2,3]
let tenOneTwoThrees = take 10 oneTwoThreeForever
-- [1,2,3,1,2,3,1,2,3,1]  