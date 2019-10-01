module Exercise3
  ( nextLevel
  ) where

import           Data.Tree

import           Employee
import           Exercise1
import           Exercise2

nextLevel :: Employee -> [(GuestList, GuestList)] -> (GuestList, GuestList)
nextLevel boss results = (withBoss, withoutBoss)
  where
    withoutBoss = foldMap (uncurry moreFun) results
    withBoss = glCons boss $ foldMap snd results

