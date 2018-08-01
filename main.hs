import Test.Tasty
import LearningTests.Lists
import LearningTests.Ranges

tests :: TestTree
tests = testGroup "Learning Tests" [rangeTests,listTests]

-- runhaskell main.hs to run all tests
main = defaultMain tests
