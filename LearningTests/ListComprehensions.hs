module LearningTests.ListComprehensions ( listComprehensionTests ) where

import Test.Tasty
import Test.Tasty.HUnit

tests = testGroup "Basic Usage"
  [
    testCase "Mapping with an output function" $
      [x*2 | x <- [1..10]] @?= [2,4,6,8,10,12,14,16,18,20],
      -- The part before the pipe "|" is the output function
      -- After the pipe, x is the variable retrieved from the list
      -- And then of course there is the list
    testCase "Filtering with a predicate" $
      [x*2 | x <- [1..10], x*2 >= 12] @?= [12,14,16,18,20],
      -- The output function modifies the variable
      -- The function retrieves the variable from the list
      -- The predicate filters the output
    testCase "Filtering without mapping" $
      [x | x <- [50..100], x `mod` 7 == 3] @?= [52,59,66,73,80,87,94],
    testCase "Multiple Predicates (filters)" $
      [x | x <- [10..20], x /= 13, x /= 15, x /= 19] @?= [10,11,12,14,16,17,18,20],
    testCase "Mapping over multiple lists" $
      [x*y | x <- [2,5,10], y <- [8,10,11]] @?= [16,20,22,40,50,55,80,100,110],
    testCase "Mapping and filtering multiple lists" $
      [x*y | x <- [2,5,10], y <- [8,10,11], x*y > 50] @?= [55,80,100,110],
    testCase "Mapping multiple lists of strings" $
      [
        adjective ++ " " ++ noun | 
        adjective <- ["lazy","grouchy","scheming"], 
        noun <- ["hobo","frog","pope"]
      ] @?= [
        "lazy hobo","lazy frog","lazy pope","grouchy hobo","grouchy frog", 
        "grouchy pope","scheming hobo","scheming frog","scheming pope"
      ],
    testCase "Get the length of a list" $
      sum [1 | _ <- [1,2,3,4,5]] @?= 5,
      -- the "_" means that the function is not returning a variable
    testCase "Filtering out anything that is not an uppercase letter" $
      [c | c <- "THIS not this WILL SHOW 5", c `elem` ['A'..'Z']] @?= "THISWILLSHOW",
    testCase "Lists of lists" $
      -- Here there are two list comprehensions, one inside another!
      -- The outer list comprehension pulls out each nested list as the variable "xs"
      -- Then the inner list comprehension pulls out each index from "xs" as "x"
      -- And finally the predicate of the inner comprehension filters out any numbers that are not even
      [
        [x | x <- xs, even x] | 
        xs <- [[1,3,5,2,3,1,2,4,5],[1,2,3,4,5,6,7,8,9],[1,2,4,2,1,6,3,1,3,2,3,6]] 
      ] @?= [[2,2,4],[2,4,6,8],[2,4,2,6,2,6]] 
  ]


listComprehensionTests :: TestTree
listComprehensionTests = testGroup "List Comprehensions" [tests]
