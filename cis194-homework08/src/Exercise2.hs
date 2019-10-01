module Exercise2
  ( treeFold
  , combineGLs
  ) where

import           Data.Tree

import           Employee
import           Exercise1

treeFold :: (a -> [b] -> b) -> Tree a -> b
treeFold combiner (Node root children) = combiner root (treeFold combiner <$> children)

combineGLs :: Employee -> [GuestList] -> GuestList
combineGLs emp gls = glCons emp $ mconcat gls
