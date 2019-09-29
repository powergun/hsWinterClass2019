module Exercise2
  ( indexJ
  ,
  ) where

import           JoinList
import           Sized

indexJ :: (Sized b, Monoid b) => Int -> JoinList b a -> Maybe a
indexJ i (Single m x)
  | i == 0    = Just x
  | otherwise = Nothing
indexJ i (Append sz lhs rhs)
  | i <= sz'  = indexJ i lhs
  | otherwise = indexJ iNext rhs
  where
    sz' = getSize . size . tag $ lhs
    iNext = i - (getSize . size $ sz)
