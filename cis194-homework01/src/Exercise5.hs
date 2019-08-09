module Exercise5 (runTests) where

import           HanoiLib

runTests :: IO ()
runTests = testMoveSheet

type Peg = String
type Move = (Peg, Peg)
-- hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
