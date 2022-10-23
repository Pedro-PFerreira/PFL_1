module DerivPoly where

import AddPoly

findvar::String-> Incognit -> Incognit
findvar x = filter (\n->fst n == x)

findVars :: String -> Monom -> Monom
findVars x y= (fst y, findvar x (snd y))

findOthervar::String-> Incognit -> Incognit
findOthervar x = filter (\n->fst n /= x)

derivate::String -> Monom-> Monom
derivate target x = if null (snd (findVars target x)) then (0, []) else (fst y * snd (head (snd y)), (fst (head (snd y)), snd (head (snd y)) - 1) : findOthervar target (snd x))
        where y = findVars target x

derivatePoly::String -> [Monom] -> [Monom]
derivatePoly x y = [derivate x z | z <- y]