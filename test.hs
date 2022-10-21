import Norma(g, normalize)

import AddPoly

xi = [(3, [("y", 2), ("x", 2)]), (4, [("z", 3)]), (5, [("y", 4)])]
yi = [(2, [("z", 1)]), (3, [("x", 3)]), (-3, [("y", 2), ("x", 2)])]

zi = [(5, [("y", 4)]), (3, [("x", 3)]), (4, [("z", 3)]), (2, [("z", 1)])]

testAddNormalPolynoms:: [Monom] -> [Monom] -> Bool
testAddNormalPolynoms x y = normalize (addPolynom (normalize x) (normalize y)) == zi