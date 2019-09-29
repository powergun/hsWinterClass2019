
import           Test.Hspec

import           JoinList

main :: IO ()
main = hspec $
  describe "JoinList API" $ do
    it "can create an empty list" $ do
      let em = Empty
      tag em `shouldBe` ""
    it "creates a join list with tag" $ do
      let a = Single "A" ""
      tag a `shouldBe` "A"
    it "creates a join list by appending two child lists" $ do
      let a = Single "A" ""
      let b = Single "B" ""
      let c = Append "C" a b
      tag c `shouldBe` "AB"

