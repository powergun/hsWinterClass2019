
import           Control.Monad      (when)
import           System.Environment (getArgs)
import           System.Exit        (ExitCode (..), exitWith)
import           System.IO

import           Exercise1
import           Exercise3
import           Exercise4
import           Exercise5
import qualified Log

main :: IO ()
main = do
  args <- getArgs
  when (length args /= 1) $ do
    putStrLn " -- Mustard Log Wrangler --\n"
    putStrLn "Usage: mustard <log filename> <message type>"
    putStrLn "message type:"
    putStrLn "  i: info"
    putStrLn "  w: warning"
    putStrLn "  eXX: error, with critial level XX (an Integer from 1 to 100)"
    exitWith $ ExitFailure 1
  -- content <- readFile (head args)
  -- let messages = inOrder . build . parseMessages $ content
  print (head args)

