import AddPoly

{-
type Coef = Integer
type Incognit = [(String, Integer)]

type Monom = (Coef, Incognit)
-}

findvar::String-> Incognit -> Incognit
findvar x = filter (\n->fst n == x)

findvar'::String-> [Monom] -> [Monom]
findvar' x [] = []
findvar' x (y:ys) = if findvar x (snd y) /= [] then [y] else findvar' x ys

y = [(4, [("x", 2)]), (5, [("z", 3)]), (5, [("y", 3)])]


derivate::Monom->Monom
derivate x = (fst x * snd (head (snd x)), [(fst (head (snd x)), snd (head (snd x)) - 1)])

derivatePoly::String -> [Monom] -> [Monom]
derivatePoly x y = [derivate z | z <- findvar' x y]