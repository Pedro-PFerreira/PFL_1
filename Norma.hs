module Norma where

import AddPoly

import Data.List(delete)

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

-- Removes monómios with coeficient zero
elimZerosPolynom :: [Monom] -> [Monom]
elimZerosPolynom = filter (\n -> fst n /= 0)

-- Removes incognit and expoent if it is power of 0
verifyIncognitExist :: Incognit -> Incognit
verifyIncognitExist [] = []
verifyIncognitExist (x:xs) = if snd x == 0 then def ++ verifyIncognitExist xs else x : verifyIncognitExist xs

elimIncognitPolynom :: [Monom] -> [Monom]
elimIncognitPolynom = map (\ x -> (fst x, verifyIncognitExist (snd x)))

normalize :: [Monom] -> [Monom]
normalize x = g (elimZerosPolynom (elimIncognitPolynom x))

yi = [(3, [("y", 3), ("x", 2)]), (4, [("z", 3)]), (5, [("y", 4)]), (0, [("y", 5)]), (3, [("z", 0)])]


adicaomom :: [Monom]-> [Monom]
adicaomom [] = []
adicaomom (x:xs) | snd x == snd (head xs) = (fst x + fst (head xs), snd x) : adicaomom xs
                 | otherwise = x : adicaomom xs

addPolynom' :: [Monom] -> [Monom]
addPolynom' [] = []
addPolynom' (x:xs) = if findIncognit x xs /= (0, [("", 0)]) then let z = addMonom x (findIncognit x xs)
                                                                 in z : addPolynom' (delete (findIncognit x xs) xs)
                                                            else
                                                                x : addPolynom' xs
