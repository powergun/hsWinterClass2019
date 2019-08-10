module Exercise3 ( sumDigits ) where

sumDigits :: [Integer] -> Integer
sumDigits = foldr sumTwoNums 0

sumTwoNums :: Integer -> Integer -> Integer
sumTwoNums x y | x > 9     = (x `div` 10) + sumTwoNums (x `mod` 10) y
               | otherwise = x + y
