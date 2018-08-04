import Test.Tasty
import LearningTests.Lists
import LearningTests.Ranges
import LearningTests.ListComprehensions

tests :: TestTree
tests = testGroup "Learning Tests" [listTests,rangeTests,listComprehensionTests]

-- runhaskell main.hs to run all tests
main = defaultMain tests
