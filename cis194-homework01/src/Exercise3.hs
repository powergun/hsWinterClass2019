module Exercise3
  ( runTests
  , sumDigits ) where

runTests :: IO ()
runTests =
  print (sumDigits [16, 7, 12, 5])

sumDigits :: [Integer] -> Integer
sumDigits = foldr sumTwoNums 0

sumTwoNums :: Integer -> Integer -> Integer
sumTwoNums x y =
  if x > 9
  then (x `div` 10) + sumTwoNums (x `mod` 10) y
  else x + y
