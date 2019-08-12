
import           Exercise1
import           Exercise2
import           Exercise3
import qualified Log
import           Test.Hspec

runSpec :: IO ()
runSpec = hspec $ do
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
      logMessages <- Log.testParse parseMessages 9999 "testdata/error.log"
      length logMessages `shouldBe` 5523

  describe "Exercise 2" $
    it "insert log messages from sample.log, expect root node" $ do
      logMessages <- Log.testParse parseMessages 9999 "testdata/sample.log"
      let (Log.Node _ m _) = foldr insert Log.Leaf logMessages
      m `shouldBe` Log.LogMessage (Log.Error 99) 10 "Flange failed!"

  describe "Exercise 3" $
    it "insert log messages from error.log, expect root node" $ do
      logMessages <- Log.testParse parseMessages 9999 "testdata/error.log"
      let (Log.Node _ m _) = build logMessages
      m `shouldBe` Log.LogMessage Log.Info 3815 "about."

main :: IO ()
main = runSpec
