
import           Exercise1
import qualified Log
import           Test.Hspec

main :: IO ()
main = hspec $
  describe "Exercise 1" $ do
    it "individual message: expect error level-2" $
      parseMessage "E 2 562 help help\n" `shouldBe` Log.LogMessage (Log.Error 2) 562 "help help"
    it "individual message: expect info" $
      parseMessage "I 29 la la la\n" `shouldBe` Log.LogMessage Log.Info 29 "la la la"
    it "individual message: expect unknown (invalid format)" $
      parseMessage "This is not in the right format" `shouldBe` Log.Unknown "This is not in the right format"
    it "individual message: expect info without message body" $
      parseMessage "I 4993\n" `shouldBe` Log.LogMessage Log.Info 4993 ""
    it "expect 2 messages parsed" $
      parseMessages "I 4993\nI 4993\n" `shouldBe` [Log.LogMessage Log.Info 4993 "", Log.LogMessage Log.Info 4993 ""]
    it "parse whole file: expect 11 log messages (sample.log)" $ do
      logMessages <- Log.testParse parseMessages 9999 "testdata/sample.log"
      length logMessages `shouldBe` 11
    it "parse whole file: expect 5523 log messages (error.log)" $ do
      logMessages <- Log.testParse parseMessages 5523 "testdata/error.log"
      length logMessages `shouldBe` 5523
