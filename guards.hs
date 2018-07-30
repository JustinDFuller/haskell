-- Guards are similar to pattern matching
-- They take an expression, that inspects the value
-- To determine if that expression is true or false
-- And it returns the version of the function 
-- where the expression evaluates to true

-- FYI: The responses here are copied directly from the book...
-- At least he insults EVERYONE :)
bmiTell :: (RealFloat a) => a -> String  
bmiTell bmi  
    -- Notice the pipe "|" operator, that's how you indicate
    -- That the next expression is a guard
    | bmi <= 18.5 = "You're underweight, you emo, you!"  
    | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"  
    | otherwise   = "You're a whale, congratulations!"  
-- When you tell your BMI it will compare it to these values
-- The last line is a catch-all for any value that doesn't evaluate
-- to true in any of the other guards

-- Not everyone knows how to calculate their BMI, so instead we can use guards
-- To calculate it for us
bmiTell' :: (RealFloat a) => a -> a -> String  
bmiTell' weight height  
    | weight / height ^ 2 <= 18.5 = "You're underweight, you emo, you!"  
    | weight / height ^ 2 <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | weight / height ^ 2 <= 30.0 = "You're fat! Lose some weight, fatty!"  
    | otherwise                 = "You're a whale, congratulations!" 
-- This shows the guards can use more than one argument in their expressions

-- When using guards the = goes after the pipe "|" and the expression

-- Guards in general avoid if statements
max' :: (Ord a) => a -> a -> a  
max' a b   
    | a > b     = a  
    | otherwise = b  

-- Guards can be written in one line, 
-- but in general it's a bad practice for readability
-- max' a b | a > b = a | otherwise = b  

-- In bmiTell` above, there is repetition " weight / height ^ 2"
-- We can avoid that with a "where" clause after the otherwise
bmiTellWhere :: (RealFloat a) => a -> a -> String  
bmiTellWhere weight height  
    -- Now we can use the variable "bmi" instead of calculating it every time
    | bmi <= skinny = "You're underweight, you emo, you!"  
    | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | bmi <= fat = "You're fat! Lose some weight, fatty!"  
    | otherwise   = "You're a whale, congratulations!"
    -- You can define many names or functions in a where clause
    where bmi = weight / height ^ 2  
        -- It's important to align the names, otherwise haskell will
        -- Interpret it incorrectly
          skinny = 18.5  
          normal = 25.0  
          fat = 30.0  
    -- All variables created in a where clause are only available
    -- To the function they were declared for.

-- Where clauses can work with pattern matching:
initials :: String -> String -> String  
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."  
    where (f:_) = firstname  
          (l:_) = lastname  

main = do
  putStrLn "What's your BMI?"
  bmi <- getLine
  putStrLn (bmiTell (read bmi :: Float))
  putStrLn "What's your weight (in kg)?"
  weight <- getLine
  putStrLn "What's your height (in meters)?"
  height <- getLine
  putStrLn (bmiTellWhere (read weight :: Float) (read height :: Float))
  putStrLn "Find the max, number one:"
  num1 <- getLine
  putStrLn "Find the max, number two:"
  num2 <- getLine
  putStrLn "The bigger number is: " ++ show (max' (read num1 :: Int) (read num2 :: Int))
  putStrLn "What's your first name?"
  firstname <- getLine
  putStrLn "What's your last name?"
  lastname <- getLine
  putStrLn (initials firstname lastname)

