module Specs (specs) where

import           Test.Hspec

import           Exercise4

specs :: IO ()
specs = hspec $ do
  describe "Exercise 4" $ do
    it "performs integer arithmetic" $ do
      testInteger `shouldBe` Just (-7)
    it "performs boolean arithmetic" $ do
      testBool `shouldBe` Just True
    it "performs MinMax arithmetic" $ do
      testMM `shouldBe` Just (MinMax 5)
    it "performs Mod7 arithmetic" $ do
      testSat `shouldBe` Just (Mod7 0)
