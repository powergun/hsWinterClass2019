module Exercise5Test (runTest) where

import           Exercise1
import           Exercise2
import           Exercise3
import           Exercise4

import           Employee

formatGL :: GuestList -> String
formatGL (GL lst fun) = "Total fun: " ++ show fun ++ "\n" ++ unlines (empName <$> lst)

runTest = readFile "testdata/company.txt" >>= computeGuestList >>= putStr
  where
    computeGuestList = return . formatGL . maxFun . read
