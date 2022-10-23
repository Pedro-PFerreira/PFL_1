module MultiPoly where

import AddPoly


equalIncognit :: Monom -> Monom -> Monom
equalIncognit a b = (fst a * fst b, sumExp (snd a) (snd b))

-- Incognit = [(String, Integer)]
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
