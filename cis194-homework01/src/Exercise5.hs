module Exercise5 (runTests) where

import           Assert

runTests :: IO ()
runTests =
  assert "ex1.5 expect total num of moves" $ 2^15 - 1 == length (hanoi 15 "a" "b" "c")

type Peg = String
type Move = (Peg, Peg)

hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi 1 from to _    = [(from, to)]
hanoi n from to temp =
  hanoi (n - 1) from temp to ++
  hanoi 1 from to temp ++
  hanoi (n - 1) temp to from
