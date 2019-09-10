module Checks (checks) where

import           Text.Printf

import           Test.QuickCheck

import           Exercise1
import           Exercise2
import           ExprT

-- given a, b, c
-- verify Mul (Add (Lit a) (Lit b)) (Lit c) === (a + b) * c
exercise1Eval :: Integer -> Integer -> Integer -> Bool
exercise1Eval a b c =
  let expr = Mul (Add (Lit a) (Lit b)) (Lit c)
  in eval expr == (a + b) * c

-- given a, b, c
-- verify evalStr "(a + b) * c" === Just (a + b) * c
-- verify evalStr "a + b * c" === Just (a + b * c)
-- verify evalStr "a + b*" === Nothing
expr1 = printf "(%d + %d) * %d"
expr2 = printf "%d + %d * %d"
expr3 = printf "%d + %d*"
exercise2EvalStr :: Integer -> Integer -> Integer -> Bool
exercise2EvalStr a b c =
  let result1 = evalStr (expr1 a b c) == Just ((a + b) * c)
      result2 = evalStr (expr2 a b c) == Just (a + b * c)
      result3 = evalStr (expr3 a b) == Nothing
  in result1 && result2 && result3

checks :: IO ()
checks = do
  -- exercise 1, eval
  quickCheck(exercise1Eval :: Integer -> Integer -> Integer -> Bool)

  -- exercise 2, evalStr
  quickCheck(exercise2EvalStr :: Integer -> Integer -> Integer -> Bool)

