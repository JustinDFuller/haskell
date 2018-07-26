-- If you're following in order this file is a little bigger than some of the files you've seen so far
-- But it only contains very simple functions that will show how pattern matching works
-- For function arguments. It will include a few things used in previous files, but that's it!

-- Below we have a function called lucky
-- It accepts an "Integral (whole number) a". If a is equal to 7
-- You'll get a special message! Otherwise you get an unhappy message.
lucky :: (Integral a) => a -> String  
lucky 7 = "LUCKY NUMBER SEVEN!"  
lucky x = "Sorry, you're out of luck, pal!"  

-- Next, sayMe also accepts an "Integral a" argument
-- This time we match multiple arguments with different responses
-- We still have a catch-all response for any other numbers
sayMe :: (Integral a) => a -> String  
sayMe 1 = "One!"  
sayMe 2 = "Two!"  
sayMe 3 = "Three!"  
sayMe 4 = "Four!"  
sayMe 5 = "Five!"  
sayMe x = "Not between 1 and 5"  

-- Now we will look at how pattern matching can be used for recursion
-- Instead of something like "if (a === 0) return 1 .. else .."
-- We can pattern match for 0, which is a known value and return 1.
-- All other numbers will recurse negatively and work their way towards 0
factorial :: (Integral a) => a -> a  
factorial 0 = 1  
factorial n = n * factorial (n - 1)  
-- A very important thing to notice about factorial is the order
-- If 0 had not been matched first then factorial would recurse infinitely
-- So the order is very important. It matches starting at the top. 
-- Always put the catch-all match at the bottom!

-- Note that we are using do here to perform multiple operations (see ./do.hs)
main = do 
  putStrLn "What's your guess?"
  guess <- getLine
  putStrLn (lucky (read guess :: Int))
  -- When lucky is called it compares the argument to the pattern
  -- Starting top to bottom, the first match will be invoked
  putStrLn "Guess #2?"
  guessAgain <- getLine
  putStrLn (sayMe (read guessAgain :: Int))
  -- Respond with any number 1-5 to see the specified pattern results
  -- Response with any other number to see the catch-all

-- Pattern matching can also fail. If you define a pattern
-- But not a catch all pattern, an error will be thrown when to match is found.
-- To avoid this, ALWAYS define a catch-all pattern

-- You can also pattern match tuples
addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)  
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)  
-- You'll probably notice that this is more like destructuring
-- Because it's a catch-all pattern that allows you to name
-- The tuple indexes as variable names

-- This type of pattern matching makes it easier to mimic the "fst" and "snd"
-- Functions that haskell provides for tuples.. for other sizes as well!
first :: (a, b, c) -> a  
first (x, _, _) = x  
  
second :: (a, b, c) -> b  
second (_, y, _) = y  
  
third :: (a, b, c) -> c  
third (_, _, z) = z  
-- Again, it's still similar to destructuring, since it's a catch-all function.

-- Pattern matching works in list comprehensions too
-- let xs = [(1,3), (4,3), (2,4), (5,3), (5,6), (3,1)]  
-- [a+b | (a,b) <- xs] here we match against tuples (a,b)
-- If a match isn't found then it will filter that index out
-- But in this one we used a catch-all so nothing is filtered out

-- Pattern matching against lists

-- Remember that this is equal: [1,2,3] 1:2:3:[]
-- To get there first index we can do: (xs:_) which is the same as 1:[2,3]
-- So the variable 1 will be called xs in this scenario

-- To get the last index we can do (_:xs) which is the same as 1:2:[3]
-- So 3 will be placed into the variable xs in this scenario

-- These rules can be used to make head and length functions

head' :: [a] -> a  
head' [] = error "Head cannot be used on an empty list."  
head' (x:_) = x  

length' :: (Num b) => [a] -> b  
length' [] = 0  
length' (_:xs) = 1 + length' xs  

-- You can also specify that the variables are the ONLY ones in the list
-- By doing (a:[]) for one item in a list.. or (a:b:[]) for two items in a list, etc.

tell :: (Show a) => [a] -> String  
tell [] = "The list is empty"  
tell [x] = "The list has one element: " ++ show x  
tell [x,y] = "The list has two elements: " ++ show x ++ " and " ++ show y  
tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y 

-- A literal pattern was used above for [x] and [x,y], based on hlint suggestions
