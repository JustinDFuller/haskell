-- This is the first file that is meant to compile!
-- It will simply print a string to the console.

-- putStrLn :: String -> IO ()  
-- We use putStrLn to print a string to stdout
-- It's a function that take a String and returns
-- An IO that has an empty result type of ()

-- main always has a type of "main :: IO something"
-- Where something is a real type

-- IO functions can only be used inside other IO functions
-- This is limiting, but it helps to keep programs pure
-- And the dirty IO is limited to very few locations

main = putStrLn "Hello, world!"