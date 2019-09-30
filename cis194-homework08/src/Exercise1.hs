module Exercise1
    ( glCons
    ) where

import           Employee

glCons :: Employee -> GuestList -> GuestList
glCons _ gls = gls
