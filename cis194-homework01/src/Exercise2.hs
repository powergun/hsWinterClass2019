module Exercise2
  ( runTests
  , doubleEveryOther ) where

runTests :: IO ()
runTests = do
  print $ doubleEveryOther [8, 7, 6, 5]
  print $ doubleEveryOther [1, 2, 3]

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther []       = []
doubleEveryOther [x]      = [x]
doubleEveryOther (x:y:xs) = x : y * 2 : doubleEveryOther xs
