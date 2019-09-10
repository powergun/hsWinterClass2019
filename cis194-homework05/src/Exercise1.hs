module Exercise1
    ( ExprT(..)
    , eval
    ) where

data ExprT  = Lit Integer
            | Add ExprT ExprT
            | Mul ExprT ExprT
            deriving (Show, Eq)

eval :: ExprT -> Integer
eval (Lit n)       = n
eval (Add lhs rhs) = eval lhs + eval rhs
eval (Mul lhs rhs) = eval lhs * eval rhs
