module LearningTests.Ranges ( rangeTests ) where

import Test.Tasty
import Test.Tasty.HUnit

-- -- A range is a list that automatically is filled with certain values in a range
stringTests = testGroup "Strings"
  [
    testCase "Ranges can create a list of strings" $
      ['a'..'z'] @?= "abcdefghijklmnopqrstuvwxyz",
    testCase "You can specify a step by setting the first index" $
      ['a','c'..'z'] @?= "acegikmoqsuwy",
    testCase "Ranges work by finding the difference between index 0 and 1" $
      -- differences is -1  
      ['z','y'..'a'] @?= "zyxwvutsrqponmlkjihgfedcba",
    testCase "You can cycle a list of strings" $
      take 11 (cycle "hey ") @?= "hey hey hey",
    testCase "If you have one char use repeat" $
      take 3 (repeat 'a') @?= "aaa",
    testCase "Replicate is shorthand for taxe x (repeat x)" $
      replicate 3 'a' @?= "aaa"
  ]

numberTests = testGroup "Numbers"
  [
    testCase "Ranges can create a list of numbers" $
      [1..20] @?= [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20],
    testCase "You can specify a step by setting the first index" $
      [2,4..20] @?= [2,4,6,8,10,12,14,16,18,20],
    -- -- Ranges are limited to simple adding and subtracting
    testCase "Ranges work by finding the difference between index 0 and 1" $
      -- differences is -1  
      [20,19..1] @?= [20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1],
    -- Be REALLY careful with floating point ranges because of their precision (or lack of it)
    testCase "Ranges with floating points" $
      [0.1, 0.3 .. 1] @?= [0.1,0.3,0.5,0.7,0.8999999999999999,1.0999999999999999],
    -- Haskell is "lazy" and won't evaluate your list until it knows what you want out of it
    testCase "Unlimited Ranges are lazily evaluated" $
      take 4 [13,26..] @?= [13,26,39,52],
    -- Otherwise this infinite list would take up infinite space..
    testCase "There is a function to create an unlimited list (cycle)" $
      take 10 (cycle [1,2,3]) @?= [1,2,3,1,2,3,1,2,3,1],
    testCase "If you have one number use repeat" $
      take 3 (repeat 3) @?= [3,3,3],
    testCase "Replicate is shorthand for take x (repeat x)" $
      replicate 3 3 @?= [3,3,3]
  ]

rangeTests :: TestTree
rangeTests = testGroup "Ranges" [stringTests,numberTests]
