module Exercise4
  ( maxFun
  ) where

import           Data.Tree
import           Employee
import           Exercise1
import           Exercise2
import           Exercise3

maxFun :: Tree Employee -> GuestList
maxFun = uncurry moreFun . treeFold nextLevel
