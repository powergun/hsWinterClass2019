import           Exercise1
import           Exercise2

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

main :: IO ()
main = do
  -- exercise 1
  quickCheck(exercise1Fun1 :: [Integer] -> Bool)
  quickCheck(forAll generatePositives (exercise1Fun2 :: Integer -> Bool))

  -- exercise 2
  print $ exercise2TreeHeight [1..15]


