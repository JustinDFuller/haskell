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
-- To get the first index we can do: (xs:_) which is the same as 1:[2,3]
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

-- A function that sums a list of numbers can be created by
-- using pattern matching and recursion.
sum' :: (Num a) => [a] -> a  
sum' [] = 0  
sum' (x:xs) = x + sum' xs  
-- the (x) take the first element off of the array, creating a ne array, xs
-- xs is given to sum, and repeated all the way down until it's an empty array
-- Eventually it adds them all together: sum1 [1,2,3] = 1 + 2 + 3 = 6

-- If you have hlint installed you'll see the it says we shouldn't
-- Implement sum like this. The problem is that if the xs array is too big
-- It can potentially cause a stack overflow. Because the + function requires
-- Both sides to be fully evaluated before it evaluates. 
-- This means that if xs is 1 million numbers, there will be 1 million calls
-- To sum' and 1 million arrays created before any addition is evaluated.

-- I'm jumping ahead now, but instead sum' can be implemented like this:
sumFoldr :: (Num a) => [a] -> a  
sumFoldr xs = foldr (+) 0 xs

-- foldr is like reduce
-- foldr :: (a -> b -> b) -> b -> [a] -> b
-- It accepts a function, an initializer, and a list
-- It applies the function to each element in the list
-- With the starting value as the initializer

-- Jumping even more ahead to currying, it can be implemented like this:
sumFoldrCurried :: (Num a) => [a] -> a  
sumFoldrCurried foldr (+) 0
-- foldr is curried, so it will wait for the "[a]" array before executing

-- Sometimes you'll need to retain a refrence to the whole list
-- You can do that by using "@"
capital :: String -> String  
capital "" = "Empty string, whoops!"  
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x] 
-- x:xs is still applied like normal, but the whole array is also
-- Bound to a variable called "all"
-- Otherwise you'd have to do: "The first letter of " ++ x:xs ++ " is "
-- This is a great way to avoid repetition which keeps things DRY
