module Exercise5
  ( nats
  , ruler
  ) where

import           Exercise4
import           Stream

nats :: Stream Integer
nats = streamFromSeed (+ 1) 0

{-
the n-th element in the stream is the largest power of 2 which
evenly divides n
(assuming the first element corresponds to n=1)
example:
n 1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16
  0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 4
-}
ruler :: Stream Integer
ruler = streamMap f . streamFromSeed (+ 1) $ 1
    where
      f :: Integer -> Integer
      f n = 1
