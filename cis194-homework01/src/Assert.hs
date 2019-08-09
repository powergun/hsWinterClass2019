module Assert (assert) where

assert :: String -> Bool -> IO ()
assert msg expr =
  if expr
  then putStrLn (msg ++ " : passed")
  else error    (msg ++ " : failed")

