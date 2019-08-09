module Exercise4 (runTests) where

import           Exercise1 (toDigitsRev)
import           Exercise2 (doubleEveryOther)
import           Exercise3 (sumDigits)

runTests :: IO ()
runTests = do
  print (validate 4012888888881881)
  print (validate 4012888888881882)

validate :: Integer -> Bool
validate = (== 0) . (`mod` 10) . sumDigits . doubleEveryOther . toDigitsRev
