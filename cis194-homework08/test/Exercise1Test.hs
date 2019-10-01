module Exercise1Test (runTest) where

import           Test.Hspec

import           Employee
import           Exercise1

unitGls = GL [] 0

runTest :: IO ()
runTest = hspec $
  describe "Exercise 1" $ do
    it "add employee to a guest list, expect new fun score" $ do
      let em = Emp { empName = "doom", empFun = 1 }
      glCons em unitGls `shouldBe` GL [em] 1

    it "implement monoid instance for GuestList" $ do
      let em1 = Emp { empName = "doom", empFun = 1 }
          em2 = Emp { empName = "duke", empFun = 2 }
          gls' = glCons em1 unitGls <> glCons em2 unitGls
      names gls' `shouldBe` ["doom", "duke"]
      funs gls' `shouldBe` 3

    it "return the guest list that has more fun" $ do
      let em1 = Emp { empName = "doom", empFun = 1 }
          em2 = Emp { empName = "duke", empFun = 2 }
          gls1 = glCons em1 unitGls
          gls2 = glCons em2 unitGls
      moreFun gls1 gls2 `shouldBe` gls2


