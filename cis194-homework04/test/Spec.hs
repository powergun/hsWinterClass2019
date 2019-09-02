import           Exercise1

import           Test.QuickCheck

exercise1Fun1 :: [Integer] -> Bool
exercise1Fun1 xs = fun1Original xs == fun1 xs

generatePositives :: Gen Integer
generatePositives = (arbitrary :: Gen Integer) `suchThat` (> 0)

exercise1Fun2 :: Integer -> Bool
exercise1Fun2 x = fun2Original x == fun2 x

main :: IO ()
main = do
  quickCheck(exercise1Fun1 :: [Integer] -> Bool)
  quickCheck(forAll generatePositives (exercise1Fun2 :: Integer -> Bool))

