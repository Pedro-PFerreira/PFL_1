import AddPoly

{-
type Coef = Integer
type Incognit = [(String, Integer)]

type Monom = (Coef, Incognit)
-}

def = [("", 0)]

orderIncognitAlphabetic :: Incognit -> Incognit
orderIncognitAlphabetic [] = []
orderIncognitAlphabetic (x:xs) = orderIncognitAlphabetic xs1 ++ [x] ++ orderIncognitAlphabetic xs2
                where xs1 = [x' | x' <- xs, fst x' <= fst x]
                      xs2 = [x' | x' <- xs, fst x' > fst x]

orderIncognitbyDegree :: Incognit -> Incognit
orderIncognitbyDegree [] = []
orderIncognitbyDegree (x:xs) = orderIncognitbyDegree xs1 ++ [x] ++ orderIncognitbyDegree xs2
                where xs1 = [x' | x' <- xs, snd x' >= snd x]
                      xs2 = [x' | x' <- xs, snd x' < snd x]


orderPolynomAlphabetic :: [Monom] -> [Monom]
orderPolynomAlphabetic = map (\ x -> (fst x, orderIncognitAlphabetic (snd x)))

orderPolynomIncognitDegree :: [Monom] -> [Monom]
orderPolynomIncognitDegree = map (\ x -> (fst x, orderIncognitbyDegree (snd x)))


orderPolynomDegree :: [Monom] -> [Monom]
orderPolynomDegree [] = []
orderPolynomDegree (x:xs) = orderPolynomDegree xs1 ++ [x] ++ orderPolynomDegree xs2
                    where xs1 = [x' | x' <- orderPolynomIncognitDegree xs, head (snd x') >= head (snd x)]
                          xs2 = [x' | x' <- orderPolynomIncognitDegree xs, head (snd x') <  head (snd x)]


elimZerosPolynom :: [Monom] -> [Monom]
elimZerosPolynom = filter (\n -> fst n /= 0)


verifyIncognitExist :: Incognit -> Incognit
verifyIncognitExist [] = []
verifyIncognitExist (x:xs) = if snd x == 0 then def ++ verifyIncognitExist xs else x : verifyIncognitExist xs

elimIncognitPolynom :: [Monom] -> [Monom]
elimIncognitPolynom = map (\ x -> (fst x, verifyIncognitExist (snd x)))
t = [(3,[("x", 3)]), (5,[("y", 0)])]


orderGeneralPolynom :: [Monom] -> [Monom]
orderGeneralPolynom x = orderPolynomAlphabetic (orderPolynomDegree (elimIncognitPolynom (elimZerosPolynom x)))

x = [(3, [("y", 2), ("x", 3)]), (4, [("x", 1), ("y", 2), ("z", 5)]), (0, [("x", 3)]), (1,[("x", 0)])]

y = [("t", 3), ("y", 6)]

--x = [(3, [("x", 2), ("y", 0)]), (6, [("t", 4)])]


--y = [(6, [("y", 0)])]

--TODO
--normalizePolynom :: [Monom] -> [Monom]
--normalizePolynom x = x
