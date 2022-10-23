module Parsing where

import Data.List.Split
import Data.List

import Data.Char

import AddPoly(Monom, Incognit, Coef)

def = [("", 0)]

{-
Esta função retorna a lista de monómios de um polinómio.
-}
elimSpaces :: String -> String -> [String]
elimSpaces = splitOn

{-
Esta função retorna a lista de monómios sem os sinais '+'.
-}
removePlus :: String -> [String]
removePlus list = filter (/= "+") (elimSpaces " " list)

{-
Esta função retorna a lista de monómios com os sinais '-' junto ao coeficiente.
-}
concatMinus' :: [String] -> [String]
concatMinus' [] = []
concatMinus' x = if head x == "-" then ("-" ++ head (tail x)) : concatMinus' (tail (tail x)) else head x : concatMinus' (tail x)

{-
Esta função retorna a lista de monómios com os respetivos juntos ao coeficiente.
-}
extractSignal :: String -> [String]
extractSignal x = concatMinus' (removePlus x)

{-
Esta função retorna o que resta de um monómio em string de acordo com o símbolo pretendido ('^' ou '*').
-}
takeRest :: Char -> String -> String
takeRest target s | null s = ""
                  | head s == target = tail s
                  | otherwise = takeRest target (tail s)

{-
Esta função retorna o coeficiente de um monómio, sob a forma de string.
-}
getNum:: String -> String
getNum [] = []
getNum x = if head x /= '*' then head x : getNum (tail x) else []

{-
Função auxiliar para converter o coeficiente em inteiro.
-}
toInt :: String -> Integer
toInt x = read (getNum x) :: Integer


{-
Esta função retorna o coeficiente de um monómio, sob a forma de um inteiro.
-}

extractCoef :: String -> Integer
extractCoef x = toInt (getNum x)

{-
Esta função divide os diversos componentes de um monómio.
-}
getSepString :: String -> [String]
getSepString x | x == "" = ["?"]
               | otherwise = splitOn "*" x

{-
Esta função retorna o expoente de um monómio.
-}
extractExp:: String -> String
extractExp [] = []
extractExp x = if head x == '^' then tail x else extractExp (tail x)


{-
Esta função retorna a incógnita (variável e expoente) de um monómio.
-}

extractIncognit :: [String] -> Incognit
extractIncognit [] = []
extractIncognit list | head list == "?" = def ++ extractIncognit (tail list)
                     | otherwise = (extractVar(head list), toInt (takeRest '^' (head list))) : extractIncognit (tail list)

{-
Esta função retorna a variável de um monómio.
-}
extractVar:: String -> String
extractVar [] = []
extractVar x = if head x /= '^' then head x : extractVar (tail x) else []

{-
Esta função retorna o monómio na representação interna.
-}
extractMonom :: String -> Monom
extractMonom x = if not (isDigit (head x)) && head x /= '-' then (1, extractIncognit (getSepString x)) else (extractCoef x, extractIncognit (getSepString (takeRest '*' x)))

{-
Esta função retorna o polinómio na representação interna.
-}
extractPolynom :: String -> [Monom]
extractPolynom x = [extractMonom y | y <- extractSignal x]