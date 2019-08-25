import           Test.Hspec

import           Golf

runSpec :: IO ()
runSpec = hspec $ do
  describe "Exercise 1" $ do
    it "skips" $ do
      skips "ABCD" `shouldBe` ["ABCD", "BD", "C", "D"]
      skips "hello!" `shouldBe` ["hello!", "el!", "l!", "l", "o", "!"]
      skips [1] `shouldBe` [[1]]
      skips [True, False] `shouldBe` [[True, False], [False]]
      skips "" `shouldBe` ([] :: [String])

main :: IO ()
main = do
  runSpec
