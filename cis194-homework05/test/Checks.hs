module Checks (checks) where

import           Test.QuickCheck

import           Exercise1

-- given a, b, c
-- verify Mul (Add (Lit a) (Lit b)) (Lit c) === (a + b) x c
exercise1Eval :: Integer -> Integer -> Integer -> Bool
exercise1Eval a b c =
  let expr = Mul (Add (Lit a) (Lit b)) (Lit c)
  in eval expr == (a + b) * c


checks :: IO ()
checks =
  quickCheck(exercise1Eval :: Integer -> Integer -> Integer -> Bool)
