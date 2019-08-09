module Exercise4 (runTests) where

import           Assert
import           Exercise1 (toDigitsRev)
import           Exercise2 (doubleEveryOther)
import           Exercise3 (sumDigits)

runTests :: IO ()
runTests = do
  assert "ex1.4 expect valid credit card num" $ validate 4012888888881881
  assert "ex1.4 expect invalid credit card num" $ not (validate 4012888888881882)

validate :: Integer -> Bool
validate = (== 0) . (`mod` 10) . sumDigits . doubleEveryOther . toDigitsRev
