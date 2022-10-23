module Rev where

import Data.List.Split

import Data.Char

import Data.List

import AddPoly

{-
    Esta função faz a conversão de um número para uma string
-}
toString :: Integer -> String
toString s | s < 0 = "(-" ++ show (s * (-1)) ++ ")"
           | otherwise = show s

{-
    Esta função permite para a junção da incógnita com o seu respetivo expoente
-}
joinIncognit :: Incognit -> [String]
joinIncognit [] = []
joinIncognit (x:xs) | snd x == 0 = " " : joinIncognit xs
                    | otherwise = (fst x ++ "^" ++ toString(snd x)) : joinIncognit xs

{-
    Esta função faz a junção de todos os termos dependentes (incógnita e expoente) da lista de incógnitas
-}
strIncognit :: [String] -> String
strIncognit [] = []
strIncognit (x:xs) | head x == '-' = "(" ++ x ++ ")" ++ strIncognit xs
                   | head x == ' ' = strIncognit xs
                   | null xs= x
                   | otherwise = x ++ "*" ++ strIncognit xs

{-
    Esta função juntar o coeficiente de um monómio ao respetivo termo dependente
-}
joinCoef :: (Integer, String) -> String
joinCoef x | snd x /= "" = toStringCoef (fst x) ++ "*" ++ snd x
           | otherwise = toStringCoef (fst x)

{-
    Esta função faz a conversão de um número para uma string, tendo em conta o seu sinal
-}
toStringCoef :: Integer -> String
toStringCoef s | s < 0 && s /= -1 = " - " ++ show (s * (-1))
               | otherwise = " + " ++ show s

{-
    Esta função faz a junção de todas as funções que permitem que a representação interna do monómio passe a string
-}
toStringMonom :: Monom -> String
toStringMonom x = joinCoef (fst x, strIncognit (joinIncognit (snd x)))

{-
    Esta função permite transformar todos os monómios do polinómio em string e junta-os
-}
toStringPolynom :: [Monom] -> String
toStringPolynom [] = []
toStringPolynom x = toStringMonom (head x) ++ toStringPolynom (tail x)

{-
    Esta função remove carateres ' ' que estejam a mais
-}
removeExtras :: [Monom] -> String
removeExtras x = dropWhile (== ' ') (toStringPolynom x)

{-
    Esta função apresenta o polinómio como uma string
-}
finalForm :: [Monom] -> String
finalForm [] = ""
finalForm x = if fst (head x) > 0 then drop 1 (dropWhile (== '+') (removeExtras x)) else dropWhile (== '+') (removeExtras x)