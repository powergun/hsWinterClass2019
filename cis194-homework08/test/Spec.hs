import           Test.Hspec

import           Employee
import           Exercise1

main :: IO ()
main = hspec $ do
  describe "Exercise 1" $ do
    it "can add employees to a guest list" $ do
      let gls = GL [] 1
          em = Emp { empName = "doom", empFun = 1 }
      glCons em gls `shouldBe` gls

