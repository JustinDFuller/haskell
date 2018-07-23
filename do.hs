-- Normally main is a function that expects a return value of 
-- "IO SOME_TYPE".. This is a problem if you need to have
-- More than one IO action in your program

-- The do syntax allows us to perform several IO functions
-- And "string" them together to get a result.

-- Below we've written a question to stdout
-- And are now going to wait on a response with getLine
-- getLine :: IO String
-- By using the "<-" operator the resulting String is
-- Exctracted from getLine and put into the variable "name"

-- You may recognize <- from list comprehensions
-- It's used in almost the same way here.. extracting a variable!

-- Remember that you can only use <- inside of an IO function!
-- This is how Haskell separates impure from non-impure.

main = do  
  putStrLn "Hello, what's your name?"  
  name <- getLine  
  putStrLn ("Hey " ++ name ++ ", you rock!")  