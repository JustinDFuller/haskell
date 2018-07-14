-- Note: This file is not meant to compile. Instead it's purpose is to show syntax.

-- Examples of types after running the ghci :t command (:: means "has type of"):
-- 'a' :: Char
-- "HELLO!" :: [Char]
-- True :: Bool
-- (True, 'a') :: (Bool, Char)

-- You can give functions explicit type declarations
-- Here's an example from a function created earlier:

removeNonUppercase :: [Char] -> [Char]  -- this is the same as: removeNonUppercase :: String -> String
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']] 

-- This says removeNonUppercase takes a list of Chars and returns a list of Chars

-- What if the function has multiple arguments?

addThree :: Int -> Int -> Int -> Int  
addThree x y z = x + y + z

-- Instead of having something line Int, Int, Int -> Int
-- We know the last type is the return type and the rest are arguments
-- This is because the function is curried (./functions.hs)

-- Common types:

-- Int, whole numbers between -2147483648 and 2147483647
-- Integer, less efficient Int but it is not limited at 2147483647
-- Float, number with decimals taking up to 32 bits
-- Double, number with decimals taking up to 64 bits
-- Bool, True or False
-- Char, a single letter
-- String, a list of characters
-- Tuple, dynamic type based on what it contains

-- Type variables

head :: [a] -> a  

-- Type variables are lowercase and mean that it can be any type
-- So head returns a single .. something.. from a list of .. somethings!



