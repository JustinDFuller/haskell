import Test.Tasty
import LearningTests.Lists
import LearningTests.Ranges

tests :: TestTree
tests = testGroup "Learning Tests" [rangeTests,listTests]

main = defaultMain tests
