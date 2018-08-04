import Test.Tasty
import qualified LearningTests.Lists as Lists
import qualified LearningTests.Ranges as Ranges
import qualified LearningTests.ListComprehensions as ListComprehensions
import qualified LearningTests.Tuples as Tuples
import qualified LearningTests.Types as Types

tests :: TestTree
tests = testGroup "Learning Tests" [
    Lists.tests,
    Ranges.tests,
    ListComprehensions.tests,
    Tuples.tests,
    Types.tests
  ]

-- runhaskell main.hs to run all tests
main = defaultMain tests
