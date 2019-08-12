
import           Exercise1
import           Log
import           Test.Hspec

main :: IO ()
main = hspec $
  describe "Exercise 1" $ do
    it "expect error level-2" $
      parseMessage "E 2 562 help help" `shouldBe` LogMessage (Error 2) 562 "help help"
    it "expect info" $
      parseMessage "I 29 la la la" `shouldBe` LogMessage Info 29 "la la la"
    it "expect unknown (invalid format)" $
      parseMessage "This is not in the right format" `shouldBe` Unknown "This is not in the right format"
