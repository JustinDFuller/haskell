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
-- The last type is always the return type 
-- and anything before that is an argument.
-- This is because the function is curried (more on that later!)

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

fst :: (a, b) -> a 

-- The function fst (from the tuples file) accepts a tuple, and returns the first element, no matter what type.

-- Typeclasses

-- Sometimes a function can accept any type as long as it meets certain requirements
-- Typeclasses accept any variable that implements a certain class

-- == :: (Eq a) => a -> a -> Bool  

-- The above defines a function (==) that accepts two arguments of the same type, and returns a bool
-- The arguments must implement the class Eq, which is used to compare for equality.

-- Common Typeclasses and functions that implement them

-- Eq: == and \= (Are the values equal or not equal)
-- Ord: >, <, >=, <=, and compare (Is a value greater than, less than, or equal to)
-- Show: show (Convert to string 3 -> "3")

-- Enum: succ, pred (get successor and predecessor in the enumeration, IE. Get what came after and before)
-- Anything that implements Enum can be used in a list range.

-- Read: read (Convert from string "3" -> 3)
-- read is interesting because it needs more information about what to return
read "5" - 2 -- 7
read "5" :: Int -- 5

-- If you do not do something with the result of read you get an error because the 
-- Compiler does not know how to "read" the argument.

-- Bounded: minBound, maxBound (get the lowest and highest possible value)
-- If you call one of those functions on a tuple you'll get the result for each value in the tuple
-- maxBound :: (Bool, Int, Char) shows (True,2147483647,'\1114111')

-- Num: *, +, - and other math operators
-- Num also has a dependency on Show and Eq typeclasses, meaning that if you are Num you are also Show and Eq

-- Integral: includes Int and Integer, only whole numbers.
