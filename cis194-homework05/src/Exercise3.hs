module Exercise3
  ( Expr(..)
  , retify
  ) where

import           ExprT

class Expr a where
  add :: a -> a -> a
  mul :: a -> a -> a
  lit :: Integer -> a

instance Expr ExprT where
  lit = Lit
  add = Add
  mul = Mul

retify :: ExprT -> ExprT
retify = id
