module Exercise5 (runTests) where

runTests :: IO ()
runTests =
  print (length (hanoi 15 "a" "b" "c"))

type Peg = String
type Move = (Peg, Peg)

hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi 1 from to _    = [(from, to)]
hanoi n from to temp =
  hanoi (n - 1) from temp to ++
  hanoi 1 from to temp ++
  hanoi (n - 1) temp to from
