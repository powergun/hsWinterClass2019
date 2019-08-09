module Exercise1
  ( runTests
  , toDigits
  , toDigitsRev ) where

runTests :: IO ()
runTests = do
  print $ toDigits (-1)
  print $ toDigitsRev 0
  print $ toDigits 123456789
  print $ toDigitsRev 123456789

toDigits :: Integer -> [Integer]
toDigitsRev :: Integer -> [Integer]

toDigitsRev x | x <= 0    = []
              | x > 0 && x < 10 = [x]
              | otherwise = (x `mod` 10 ): toDigitsRev (x `div` 10)
toDigits = reverse . toDigitsRev
