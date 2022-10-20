import AddPoly

equalIncognit :: Monom -> Monom -> Monom
equalIncognit a b = (fst a * fst b, sumExp (snd a) (snd b))

-- Incognit = [(String, Integer)]
sumExp :: Incognit -> Incognit -> Incognit
sumExp a [] = a
sumExp [] a = a
sumExp a b = if fst (head a) == fst (head b) then (fst (head a), snd (head a) + snd (head b)) : sumExp (tail a) (tail b)
 else head a : sumExp (tail a) b

{- 
sumExp (a:as) (b:bs) = if (fst a == fst b) then [(fst a, snd a + snd b)] ++ sumExp as bs else
    [(fst a, snd a), (fst b, snd b)] ++ sumExp as bs
-}

t = [("x", 2), ("y", 3)]
w = [("x", 4),("y", 3), ("z", 4)]

x = [(3, [("x", 2), ("y", 3)]), (6, [("t", 2)])]

y = [(4, [("x", 2)]), (5, [("z", 3)]), (5, [("y", 3)])]

{-
z = [(12, [("x", 4), ("y", 3)]), 
(15, [("x", 2), ("y", 3), ("z", 3)]), 
(15, [("x", 2), ("y", 6)]),
(24, [("t", 2), ("x", 2)]),
(30, [("t", 2), ("z", 3)]),
(30, [("t", 2), ("y", 3)]) 
-}


{-- se forem iguais, multiplicam-se os coeficiente, mantem-se a incógnita (primeiro
--}

{-- se forem diferentes, multiplicam-se os coeficientes e adicionam-se a incógnita
--}

multiPolynom :: [Monom] -> [Monom] -> [Monom]
multiPolynom [] [] = []
multiPolynom x [] = []
multiPolynom [] _ = []
multiPolynom (x:xs) y = [equalIncognit x (head y)] ++ multiPolynom [x] (tail y) ++ multiPolynom xs y -- ++ multiPolynom xs (tail y)