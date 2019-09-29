
import           Test.Hspec

import           JoinList
import           Sized
import           Utilities

import           Exercise2

main :: IO ()
main = hspec $ do
  describe "Exercise 1: JoinList API" $ do
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
      tag c `shouldBe` "C"
    it "provides the join operator (+++)" $ do
      let a = Single "A" ""
      let b = Single "B" ""
      let c = a +++ b
      tag c `shouldBe` "AB"
    it "creates deeply nested join list" $ do
      let a = Single "A" ""
      let b = Single "B" ""
      let c = (a +++ b) +++ (a +++ b)
      tag c `shouldBe` "ABAB"

  describe "Exercise 2: indexJ (fast indexing)" $ do
    it "has the same behavior as list safe-index" $ do
      let a = Single (Size 1) "A"
          b = Single (Size 1) "B"
          c = Single (Size 1) "C"
          d = a +++ b +++ c
      (indexJ (-1) d) `shouldBe` Nothing
      (indexJ (-1) d) `shouldBe` (jlToList d !!? (-1))
      (indexJ (3) d) `shouldBe` (jlToList d !!? 3)

      -- (indexJ 0 d) `shouldBe` Just "A"
      -- (indexJ 0 d) `shouldBe` (jlToList d !!? 0)
      -- (indexJ 2 d) `shouldBe` Just "B"
      -- (indexJ 2 d) `shouldBe` (jlToList d !!? 2)
      -- (indexJ 60 d) `shouldBe` Just "C"
      -- (indexJ 2 d) `shouldBe` (jlToList d !!? 2)

