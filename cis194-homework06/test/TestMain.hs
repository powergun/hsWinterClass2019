
import           Test.Hspec

import           Exercise1

main :: IO ()
main = hspec $ do
  describe "Exercise 1" $ do
    it "compute the first 30 fibonacci numbers" $ do
      -- first 30 fib numbers downloaded from
      -- http://www.maths.surrey.ac.uk/hosted-sites/R.Knott/Fibonacci/fibtable.html
      let expected = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89,
                      144, 233, 377, 610, 987, 1597, 2584, 4181,
                      6765, 10946, 17711, 28657, 46368, 75025,
                      121393, 196418, 317811, 514229, 832040]
      map fibs1 [0..30] `shouldBe` expected


