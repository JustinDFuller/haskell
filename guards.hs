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

main = do
  putStrLn "What's your BMI?"
  bmi <- getLine
  putStrLn (bmiTell (read bmi :: Float))
