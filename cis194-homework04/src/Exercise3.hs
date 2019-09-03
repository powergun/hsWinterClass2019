module Exercise3
  ( xor

  ) where

xor :: [Bool] -> Bool
xor bs = foldr (==) True bs
