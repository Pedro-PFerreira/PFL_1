module Parsing where

import Data.List.Split
import Data.List

import Data.Char

import AddPoly(Monom, Incognit, Coef)
k = "3*x^2 + 2*y + 5*z + y - 7*y^2 + 4*x*y^2"


{-
type Coef = Integer
type Incognit = [(String, Integer)]

type Monom = (Coef, Incognit)

-}

elimSpaces :: String -> String -> [String]
elimSpaces = splitOn

z = "42*z^2"

y = "4*x*y^2"

l = filter  (/= "+") (elimSpaces " " k)

removePlus :: String -> [String]
removePlus list = filter (/= "+") (elimSpaces " " list)

concatMinus' :: [String] -> [String]
concatMinus' [] = []
concatMinus' x = if head x == "-" then ("-" ++ head (tail x)) : concatMinus' (tail (tail x)) else head x : concatMinus' (tail x)

extractSignal :: String -> [String]
extractSignal x = concatMinus' (removePlus x)


----
takeRest :: Char -> String -> String
takeRest target s | null s = ""
                  | head s == target = tail s
                  | otherwise = takeRest target (tail s)

getNum:: String -> String
getNum [] = []
getNum x = if head x /= '*' then head x : getNum (tail x) else []

toInt :: String -> Integer
toInt x = read (getNum x) :: Integer

extractCoef :: String -> Integer
extractCoef x = toInt (getNum x)

----
p = "-32*z^2"

t = "-34*x*y^24*z^(-23)"

getSepString :: String -> [String]
getSepString x | x == "" = ["?"]
               | otherwise = splitOn "*" x

p' = "3*z^2*y^2"

p'' = "7"

def = [("", 0)]

extractExp:: String -> String
extractExp [] = []
extractExp x = if head x == '^' then tail x else extractExp (tail x)

extractIncognit :: [String] -> Incognit
extractIncognit [] = []
extractIncognit list | (head list) == "?" = def ++ extractIncognit (tail list)
                     | otherwise = (extractVar(head list), toInt (takeRest '^' (head list))) : extractIncognit (tail list)

extractVar:: String -> String
extractVar [] = []
extractVar x = if head x /= '^' then head x : extractVar (tail x) else []

extractMonom :: String -> Monom
extractMonom x = if not (isDigit (head x)) && head x /= '-' then (1, extractIncognit (getSepString x)) else (extractCoef x, extractIncognit (getSepString (takeRest '*' x)))

extractPolynom :: String -> [Monom]
extractPolynom x = [extractMonom y | y <- extractSignal x]