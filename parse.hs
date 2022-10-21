import Data.List.Split

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

takeRest :: Char-> String -> String
takeRest target s = if head s == target then tail s else takeRest target (tail s)

getNum:: String -> String
getNum [] = []
getNum x = if head x /= '*' then head x : getNum (tail x) else []

toInt :: String -> Integer
toInt x = read (getNum x) :: Integer

extractCoef :: String -> Integer
extractCoef x = toInt (getNum x)

----
p = "z^2"

t = "x*y^2*z"

getSepString :: String -> [String]
getSepString = splitOn "*"

extractExp:: String -> String
extractExp [] = []
extractExp x = if head x == '^' then tail x else extractExp (tail x)

extractIncognit :: [String] -> Incognit
extractIncognit [] = []
extractIncognit list = if extractExp (head list) == "" then (head list, 1) : extractIncognit (tail list) else (extractVar(head list), toInt (takeRest '^' (head list))) : extractIncognit (tail list)

extractVar:: String -> String
extractVar [] = []
extractVar x = if head x /= '^' then head x : extractVar (tail x) else []


extractMonom :: String -> Monom
extractMonom x = if not (isDigit (head x)) then (1, extractIncognit (getSepString x)) else (extractCoef x, extractIncognit (getSepString (takeRest '*' x)))