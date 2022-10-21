module Norma where

import AddPoly

xi = [(3, [("y", 3), ("x", 2)]), (4, [("z", 3)]), (5, [("y", 4)])]


--Order by degree
orderIncognitbyDegree :: Incognit -> Incognit
orderIncognitbyDegree [] = []
orderIncognitbyDegree (x:xs) = orderIncognitbyDegree xs1 ++ [x] ++ orderIncognitbyDegree xs2
                                    where xs1 = [x1 | x1 <- xs, snd x1 >= snd x]
                                          xs2 = [x2 | x2 <- xs, snd x2 < snd x]

orderMonombyDegree :: Monom -> Monom
orderMonombyDegree x = (fst x, orderIncognitbyDegree (snd x))

orderPolynombyDegree :: [Monom] -> [Monom]
orderPolynombyDegree [] = []
orderPolynombyDegree (x:xs) = orderPolynombyDegree xs1 ++ [x] ++ orderPolynombyDegree xs2
                            where xs1 = [x1 | x1 <- xs, snd (head (snd x1)) >= snd (head (snd x))]
                                  xs2 = [x2 | x2 <- xs, snd (head (snd x2)) < snd (head (snd x))]
f :: [Monom] -> [Monom]
f l = orderPolynombyDegree (map orderMonombyDegree l)

----

--- Order aphabetically

def = [("", 0)]

orderIncognitAlphabetic :: Incognit -> Incognit
orderIncognitAlphabetic [] = []
orderIncognitAlphabetic (x:xs) = orderIncognitAlphabetic xs1 ++ [x] ++ orderIncognitAlphabetic xs2
                where xs1 = [x' | x' <- xs, fst x' <= fst x]
                      xs2 = [x' | x' <- xs, fst x' > fst x]


orderMonomAlphabetic :: Monom -> Monom
orderMonomAlphabetic x = (fst x, orderIncognitAlphabetic (snd x)) 


orderPolynomAlphabetic :: [Monom] -> [Monom]
orderPolynomAlphabetic = map (\ x -> (fst x, orderIncognitAlphabetic (snd x)))

g :: [Monom] -> [Monom]
g l = orderPolynomAlphabetic (orderPolynombyDegree (map orderMonombyDegree l))

{-
orderPolynomDegree :: [Monom] -> [Monom]
rderPolynomDegree [] = []
orderPolynomDegree (x:xs) = orderPolynomDegree xs1 ++ [x] ++ orderPolynomDegree xs2
                    where xs1 = [x' | x' <- orderPolynombyDegree xs, head (snd x') >= head (snd x)]
                          xs2 = [x' | x' <- orderPolynombyDegree xs, head (snd x') <  head (snd x)]
-}
