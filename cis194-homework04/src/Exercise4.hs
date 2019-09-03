module Exercise4 (sieveSundaram) where

sieveSundaram :: Integer -> [Integer]
sieveSundaram n = 2 : [ 2 * x + 1 | x <- [1..n], not (x `elem` (sSundDelete n)) ]

sSundDelete :: Integer -> [Integer]
sSundDelete n = [ i + j + 2 * i * j | i <- [1..n], j <- [i..n] ]
