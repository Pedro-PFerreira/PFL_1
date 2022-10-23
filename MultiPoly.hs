module MultiPoly where

import AddPoly

{-
    Esta função multiplica os coeficientes dos dois monómios e aplica a função sumExp aos seus expoentes
-}
equalIncognit :: Monom -> Monom -> Monom
equalIncognit a b = (fst a * fst b, sumExp (snd a) (snd b))

{-
    Esta função soma os seus expoentes das incógnitas se forem iguais e caso não sejam adiciona à lista de incógnitas
-}
sumExp :: Incognit -> Incognit -> Incognit
sumExp a [] = a
sumExp [] a = a
sumExp a b = if fst (head a) == fst (head b) then (fst (head a), snd (head a) + snd (head b)) : sumExp (tail a) (tail b)
 else head a : sumExp (tail a) b

multiPolynom :: [Monom] -> [Monom] -> [Monom]
multiPolynom [] [] = []
multiPolynom x [] = []
multiPolynom [] _ = []
multiPolynom (x:xs) y = [equalIncognit x (head y)] ++ multiPolynom [x] (tail y) ++ multiPolynom xs y
