module AddPoly where 
import Data.List(delete)

type Coef = Integer
type Incognit = [(String, Integer)]

type Monom = (Coef, Incognit)

{-
Esta função verifica se de dois polinómios possuem as mesmas incógnitas.
-}
compareIncognit :: Monom -> Monom -> Bool
compareIncognit x y = snd x == snd y
{-
Esta função retorna o monómio que contém um determinado conjunto de incógnitas.
-}
findIncognit :: Monom -> [Monom] -> Monom
findIncognit x [] = (0, [("", 0)])
findIncognit x (y:ys) = if compareIncognit x y then y else findIncognit x ys

{-
Esta função retorna a adição dos dois monómios de input na representação interna.
-}
addMonom :: Monom -> Monom -> Monom
addMonom x y = (fst x + fst y, snd x)  

{-
Esta função retorna a adição dos dois polinómios de input na representação interna.
-}
addPolynom :: [Monom] -> [Monom] -> [Monom]
addPolynom [] y = y
addPolynom (x:xs) y = if findIncognit x y /= (0, [("", 0)]) then let z = addMonom x (findIncognit x y)
                                                                 in z : addPolynom xs (delete (findIncognit x y) y)
                                                            else
                                                                x : addPolynom xs y