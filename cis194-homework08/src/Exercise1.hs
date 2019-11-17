module Exercise1
    ( glCons
    , names
    , funs
    , moreFun
    ) where

import           Data.Bool

import           Employee

names :: GuestList -> [String]
names (GL ems _) = map empName ems

funs :: GuestList -> Fun
funs (GL _ funs) = funs

glCons :: Employee -> GuestList -> GuestList
glCons em@(Emp _ fun) gls@(GL ems funs) = GL (ems ++ [em]) (fun + funs)

instance Semigroup GuestList where
    (<>) lhs@(GL lem lfun) rhs@(GL rem rfun) = GL (lem ++ rem) (lfun + rfun)

instance Monoid GuestList where
    mappend = (<>)
    mempty = GL [] 0

moreFun :: GuestList -> GuestList -> GuestList
moreFun = max

