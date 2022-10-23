module Rev where

import Data.List.Split

import Data.Char

import Data.List

import AddPoly
{-

type Coef = Integer
type Incognit = [(String, Integer)]

type Monom = (Coef, Incognit)
-}

k = [(-3,[("x",2)]),(2,[("y",1)]),(5,[("z",1)]),(1,[("y",1)]),(-7,[("y",2)]),(4,[("x",1),("y",2)])]

l = (4, [("x", 3), ("y", -3), ("t", 5)])

toString :: Integer -> String
toString s | s < 0 = "(-" ++ show (s * (-1)) ++ ")"
           | otherwise = show s

joinIncognit :: Incognit -> [String]
joinIncognit [] = []
joinIncognit (x:xs) | snd x == 0 = " " : joinIncognit xs
                    | otherwise = (fst x ++ "^" ++ toString(snd x)) : joinIncognit xs

strIncognit :: [String] -> String
strIncognit [] = []
strIncognit (x:xs) | head x == '-' = "(" ++ x ++ ")" ++ strIncognit xs
                   | head x == ' ' = strIncognit xs
                   | null xs= x
                   | otherwise = x ++ "*" ++ strIncognit xs

joinCoef :: (Integer, String) -> String
joinCoef x = if snd x /= "" then toStringCoef (fst x) ++ "*" ++ snd x else toStringCoef (fst x)
           
toStringCoef :: Integer -> String
toStringCoef s | s < 0 = " - " ++ show (s * (-1))
                | otherwise = " + " ++ show s

g = joinCoef (fst l, strIncognit (joinIncognit (snd l)))

toStringMonom :: Monom -> String
toStringMonom x = joinCoef (fst x, strIncognit (joinIncognit (snd x)))

toStringPolynom :: [Monom] -> String
toStringPolynom [] = []
toStringPolynom x = toStringMonom (head x) ++ toStringPolynom (tail x)

removeExtras :: [Monom] -> String
removeExtras x = dropWhile (== ' ') (toStringPolynom x)

finalForm :: [Monom] -> String
finalForm x = if fst (head x) > 0 then drop 1 (dropWhile (== '+') (removeExtras x)) else dropWhile (== '+') (removeExtras x)