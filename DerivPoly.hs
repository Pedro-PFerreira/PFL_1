module DerivPoly where

import AddPoly

findvar::String-> Incognit -> Incognit
findvar x = filter (\n->fst n == x)

findvar'::String-> [Monom] -> [Monom]
findvar' x [] = []
findvar' x (y:ys) = if findvar x (snd y) /= [] then [(fst y,findvar x (snd y))] else findvar' x ys

findOthervar::String-> Incognit -> Incognit
findOthervar x = filter (\n->fst n /= x)

y = [(4, [("x", 2)]), (5, [("z", 3)]), (5, [("y", 3)])]

z =[(4, [("xy", 2)])]

x = [(1, [("x", 1)]), (1, [("y", 1)])] -- x + y

xy = [(1, [("x",1), ("y", 1)])] --xy

xy' = (1, [("x",1), ("y", 1)])

incog = [("x",1), ("y", 1)]

derivate::Monom->Monom
derivate x = (fst x * snd (head (snd x)), (fst (head (snd x)), snd (head (snd x)) - 1) : findOthervar (fst (head (snd x))) (snd x))

derivatePoly::String -> [Monom] -> [Monom]
derivatePoly x y = [derivate z | z <- y]