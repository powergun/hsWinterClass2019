module Checks (checks) where

import           Exercise1
import           Exercise2
import           Exercise3

import           Test.QuickCheck

exercise1Fun1 :: [Integer] -> Bool
exercise1Fun1 xs = fun1Original xs == fun1 xs

generatePositives :: Gen Integer
generatePositives = (arbitrary :: Gen Integer) `suchThat` (> 0)

exercise1Fun2 :: Integer -> Bool
exercise1Fun2 x = fun2Original x == fun2 x

exercise2TreeHeight :: [Integer] -> Bool
exercise2TreeHeight [] = True
exercise2TreeHeight ns =
  let logHeight    = ceiling . log . fromIntegral . toInteger . length $ ns
      actualHeight = height . foldTree $ ns
  in logHeight == actualHeight

exercise3foldAsMap :: [Integer] -> Bool
exercise3foldAsMap ns =
  let f :: Integer -> Integer
      f n = n ^ 2 + 4 * n + 16
      expected = map f ns
      actual   = map' f ns
  in expected == actual

exercise3foldl :: [Integer] -> Bool
exercise3foldl [] = True
exercise3foldl ns =
  myFoldl (+) 0 ns == foldl (+) 0 ns

checks :: IO ()
checks
 = do
  -- exercise 1
  quickCheck(exercise1Fun1 :: [Integer] -> Bool)
  quickCheck(forAll generatePositives (exercise1Fun2 :: Integer -> Bool))

  -- exercise 2
  print $ exercise2TreeHeight [1..15]

  -- exercise 3
  quickCheck(exercise3foldAsMap :: [Integer] -> Bool)
  quickCheck(exercise3foldl :: [Integer] -> Bool)

