module Exercise5
  ( getHighestFunScore
  ) where

import           Employee
import           Exercise4

funScore :: GuestList -> Fun
funScore (GL _ fun) = fun

getHighestFunScore :: String -> Fun
getHighestFunScore = funScore . maxFun . read
