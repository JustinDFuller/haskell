module LearningTests.Tuples ( tests ) where

import Test.Tasty
import Test.Tasty.HUnit

-- Tuples are like non-homogenous lists. They can contain a variety of types.
-- However, the types they contain are fixed

-- A tuple of just 2 items is a pair (8,10)

-- A list of tuples expects the same size and type of tuple
-- [(1,2),(3,4),(5,6)] If you tried to do (5,6,7) you would get an error

-- A list of people might look like this:
-- [("John","Doe",35),("Jane","Doe",30)] ("Jane","Doe") would throw an error since it's missing the age

-- Remember that strings are lists of characters, so this shows that tuples can contain any type of list!

tupleTests = testGroup "Basic Usage"
  [
    testCase "Get the first element of a tuple" $
      fst (8, 10) @?= 8,
    testCase "Get the second element of a tuple" $
      snd (8, 10) @?= 10,
    testCase "Combine lists into tuples" $
      zip [1..] ["one","two"] @?= [(1,"one"),(2,"two")],
      -- Note a few things here..
      -- zip creates a list of pairs (only pairs, not longer tuples)
      -- It can have different types in each of the two lists
      -- It will shorten the longer of the two lists (see the unlimited list as the first arg above),
    testCase "List comprehension with tuples" $
      -- Here's a contrived example.. looking for right triangles with the perimeter is 24
      [(a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c == 24] @?= [(6,8,10)]
      -- This shows that tuples can be used in list comprehensions!
  ]

tests :: TestTree
tests = testGroup "Tuples" [tupleTests]