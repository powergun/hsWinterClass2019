module Exercise2
  ( runTests
  , doubleEveryOther ) where

import           Assert

runTests :: IO ()
runTests = do
  assert "ex1.2 expect elem-1, 3 doubled" $ [8, 14, 6, 10] == doubleEveryOther [8, 7, 6, 5]
  assert "ex1.2 expect elem-1 doubled" $ [1, 4, 3] == doubleEveryOther [1, 2, 3]

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther []       = []
doubleEveryOther [x]      = [x]
doubleEveryOther (x:y:xs) = x : y * 2 : doubleEveryOther xs
