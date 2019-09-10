module Exercise2 (evalStr) where

import           ExprT
import           Parser

import           Exercise1

evalStr :: String -> Maybe Integer
evalStr s = eval <$> (parseExp Lit Add Mul s)
