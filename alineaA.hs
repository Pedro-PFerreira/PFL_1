import AddPoly

--TODO
--orderMonom :: Monom -> Monom
--orderMonom x = x

--orderPolynom :: [Monom] -> [Monom]
--orderPolynom [] = []
--orderPolynom (x:xs) = orderMonom x : orderPolynom xs

elimZerosPolynom :: [Monom] -> [Monom]
elimZerosPolynom [] = []
elimZerosPolynom (x:xs) | fst x == 0 = elimZerosPolynom xs
                        | otherwise = x : elimZerosPolynom xs

x = [(3, [("x", 2), ("y", 0)]), (6, [("t", 4)])]

verifyIncognitExist :: Incognit -> Incognit
verifyIncognitExist [] = []
verifyIncognitExist (x:xs) = if (snd x == 0) then verifyIncognitExist xs else x : verifyIncognitExist xs

elimIncognitPolynom :: [Monom] -> [Monom]
elimIncognitPolynom [] = []
elimIncognitPolynom (x:xs) = (fst x, verifyIncognitExist (snd x)) : elimIncognitPolynom xs


--TODO
--normalizePolynom :: [Monom] -> [Monom]
--normalizePolynom x = x
