import Data.List

a = [(("+", 3), [("x", 2)]), (("+", 6), [("y", 1), ("z", 1)])]

type Coef = Integer
type Incognit = [(String, Integer)]

type Monom = (Coef, Incognit)

compareIncognit :: Monom -> Monom -> Bool
compareIncognit x y = snd x == snd y


findIncognit :: Monom -> [Monom] -> Monom
findIncognit x [] = (0, [("", 0)])
findIncognit x (y:ys) = if compareIncognit x y then y else findIncognit x ys

addMonom :: Monom -> Monom -> Monom
addMonom x y = (fst x + fst y, snd x)  


addPolynom :: [Monom] -> [Monom] -> [Monom]
addPolynom [] y = y
addPolynom (x:xs) y = if findIncognit x y /= (0, [("", 0)]) then let z = addMonom x (findIncognit x y)
                                                                 in z : addPolynom xs (delete (findIncognit x y) y)
                                                            else
                                                                x : addPolynom xs y

x = (2, [("x", 2), ("y", 3)])

y = [(7, [("y", 4)]),(-3, [("x", 2), ("y", 3)])]

z= [(7, [("y", 4)])]

test= findIncognit x y

test1 = findIncognit x z


whatif = addPolynom [x] y