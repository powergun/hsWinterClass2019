module Exercise1
    ( fun1Original
    , fun1
    , fun2Original
    , fun2
    ) where

fun1Original :: [Integer] -> Integer
fun1Original [] = 1
fun1Original (x:xs)
    | even x = (x - 2) * fun1Original xs
    | otherwise = fun1Original xs

fun1 :: [Integer] -> Integer
fun1 = (foldr (*) 1) . (map (\x -> if even x then x - 2 else 1))

fun2Original :: Integer -> Integer
fun2Original 1 = 0
fun2Original n | even n    = n + fun2Original (n `div` 2)
               | otherwise = fun2Original (3 * n + 1)

fun2 :: Integer -> Integer
fun2 _ = 1
