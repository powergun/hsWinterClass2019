module Exercise2Test (runTest) where

import           Data.Tree
import           Test.Hspec

import           Employee
import           Exercise2

funs :: GuestList -> Fun
funs (GL _ fun) = fun

runTest :: IO ()
runTest = hspec $
  describe "Exercise 2" $ do
    it "compute the best guest list (testCompany), expect fun score (46)" $ do
      let gl = treeFold combineGLs testCompany
      funs gl `shouldBe` 46

    it "compute the best guest list (testCompany1), expect fun score (47)" $ do
      let gl = treeFold combineGLs testCompany2
      funs gl `shouldBe` 47


