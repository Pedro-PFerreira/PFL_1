import AddPoly

--TODO
orderMonom :: Monom -> Monom
orderMonom x = x

orderPolynom :: [Monom] -> [Monom]
orderPolynom [] = []
orderPolynom (x:xs) = orderMonom x : orderPolynom xs

elimZerosPolynom :: [Monom] -> [Monom]
elimZerosPolynom (x:xs) | fst x == 0 = elimZeros xs
                        | otherwise = x : elimZeros xs

elimIncognitPolynom :: [Monom] -> [Monom]
elimIncognitPolynom (x:xs) | snd snd x == 0 = (x, [("", 0)]) : elimIncognitPolynom xs
                           | otherwise = x : elimZero

--TODO
normalizePolynom :: [Monom] -> [Monom]
normalizePolynom x = x