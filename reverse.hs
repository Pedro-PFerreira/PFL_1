import Data.List.Split

import Data.Char

import Data.List

import AddPoly(Monom, Incognit, Coef)

{-

type Coef = Integer
type Incognit = [(String, Integer)]

type Monom = (Coef, Incognit)
-}

k = [(3,[("x",2)]),(2,[("y",1)]),(5,[("z",1)]),(1,[("y",1)]),(-7,[("y",2)]),(4,[("x",1),("y",2)])]

l = (4, [("x", 3), ("y", -3), ("t", 5)])

toString :: Integer -> String
toString s | s < 0 = "(-" ++ show (s * (-1)) ++ ")"
           | otherwise = show s

joinIncognit :: Incognit -> [String]
joinIncognit x = [fst y ++ "^" ++ toString(snd y) | y <- x]

strIncognit :: [String] -> String
strIncognit [] = []
strIncognit (x:xs) | head x == '-' = "(" ++ x ++ ")" ++ strIncognit xs
                   | otherwise = x ++ "*" ++ strIncognit xs

joinCoef :: (Integer, String) -> String
joinCoef x = toStringCoef (fst x) ++ "*" ++ snd x 

toStringCoef :: Integer -> String
toStringCoef s | s < 0 = " -" ++ show (s * (-1))
           | otherwise = " +" ++ show s

g = joinCoef (fst l, strIncognit (joinIncognit (snd l)))

toStringMonom :: (Integer, Incognit) -> String
toStringMonom x = joinCoef (fst x, strIncognit (joinIncognit (snd x)))