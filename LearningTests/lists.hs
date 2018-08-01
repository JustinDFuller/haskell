module LearningTests.Lists ( listTests ) where

  -- Tasty is a library for structuring unit tests
-- It provides assertions and output formatting
import Test.Tasty
import Test.Tasty.HUnit

-- @?= is essentially an "assertEquals" function
-- It expects the left and right hand arguments to be equal

-- The use of $ (the infix/application) operator
-- Avoids needing to wrap the assertions in brackets ()
-- The very first test does not use it in order to demonstrate the difference
-- All other tests will use it for now on

-- Read the tests from top to bottom to see how a list works
-- Assume all tests pass

-- -- Lists are homogenous data structures.
-- -- They can only contain a single type
stringTests = testGroup "Strings"
  [
  testCase "Strings are lists"
    ("strings" @?= ['s','t','r','i','n','g','s']),
  testCase "You can append two strings together" $
    -- be careful when using ++ because haskell iterates
    -- The entire list on the LEFT side of ++
    ("One string" ++ ", another string!") @?= "One string, another string!",
  testCase "You can prepend a character to a string" $
    -- notice ":" takes a char on the left and a list on the right
    -- While ++ takes a list on both sides
    ('!':"another string!") @?= "!another string!",
  testCase "Using double quotes is shorthand" $
    't':'e':'s':'t':[] @?= "test"
  ]

-- This list will be our example value below
numberList = [0,1,2,3,4,5]

numberTests = testGroup "Numbers"
 [
  testCase "You can prepend a number to a list" $
    -- In haskell it is more performant to add to the
    -- beginning of a list than the end.
    (0:[1,2,3,4,5]) @?= numberList,
  testCase "You can retrieve from a list with 'list !! index'" $
    -- Note that indexes start at zero because haskell is a sane language :)
    numberList !! 4 @?= 4,
  testCase "Lists can also contain other lists" $
    -- The inner lists can be different lengths but NOT different types
    numberList:[[1,2,3]]  @?= [numberList,[1,2,3]],
  testCase "You can compare lists if they have comparable types" $
    ([3,2,1] > [2,1,0]) @?= True,
  testCase "Comparisons walk through the list until non-equal values are found" $
    ([3,20,1] > [3,10,100]) @?= True
 ]

listFunctionTests = testGroup "List Functions"
 [
  -- beware calling these functions on an empty list throws an error 
  testCase "head retrieves the value at index 0" $
    head numberList @?= 0,
  testCase "tail retrieves all but the value at index 0" $
    tail numberList @?= [1,2,3,4,5],
  testCase "last retrieves the value at the highest index" $
    last numberList @?= 5,
  testCase "init retrieves all but the value at the highest index" $
    init numberList @?= [0,1,2,3,4],
  -- below are some functions that can help guard against empty list exceptions
  testCase "length returns the number of indexes in a list" $
    length numberList @?= 6,
  testCase "length returns 0 for an empty list" $
    -- hlint warning ignored for learning purposes
    length [] @?= 0,
  testCase "null evaluates if a list is empty" $
    null numberList @?= False,
  testCase "null returns true for an empty list" $
    null [] @?= True,
  -- Here are more useful list functions
  testCase "reverse returns a list with the values reversed" $
    reverse numberList @?= [5,4,3,2,1,0],
  testCase "take returns the list with only the first n indexes" $
    take 1 numberList @?= [0],
  testCase "returns the list with the first n indexes missing" $
    drop 2 numberList @?= [2,3,4,5],
  testCase "returns the highest value found in the list" $
    maximum numberList @?= 5,
  testCase "adds each value in the list" $
    sum numberList @?= 15,
  testCase "multiplies each value in the list" $
    product (drop 1 numberList) @?= 120,
  testCase "evaluates if the value is in the list" $
    elem 5 numberList @?= True,
  testCase "returns false if the value is not in the list" $
    elem 6 numberList @?= False
 ]

listTests :: TestTree
listTests = testGroup "Lists" [stringTests,numberTests,listFunctionTests]
