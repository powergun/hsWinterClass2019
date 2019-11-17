module Exercise5Test (runTest) where

import           Test.Hspec

import           Exercise5


runTest :: IO ()
runTest = hspec $
  describe "Exercise 5" $ do
    it "expect the highest fun score (33200)" $ do
      contents <- readFile "testdata/company.txt"
      let gl = getHighestFunScore contents
      putStrLn . show $ gl
      gl `shouldBe` 33200
