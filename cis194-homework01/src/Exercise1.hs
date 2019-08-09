module Exercise1
  ( runTests
  , toDigits
  , toDigitsRev ) where

import           Assert

runTests :: IO ()
runTests = do
  assert "ex1.1 given -1, expect empty list" $ null (toDigits (-1))
  assert "ex1.1 given 0, expect empty list" $ null (toDigitsRev 0)
  assert "ex1.1 given num, expect list" $ [1..9] == toDigits 123456789
  assert "ex1.1 given num, expect reverse list" $ reverse [1..9] == toDigitsRev 123456789

toDigits :: Integer -> [Integer]
toDigitsRev :: Integer -> [Integer]

toDigitsRev x | x <= 0    = []
              | x > 0 && x < 10 = [x]
              | otherwise = (x `mod` 10 ): toDigitsRev (x `div` 10)
toDigits = reverse . toDigitsRev
