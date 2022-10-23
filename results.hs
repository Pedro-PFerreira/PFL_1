import AddPoly
import Norma
import MultiPoly
import DerivPoly
import Rev
import Parsing

-- Examples1
poly1 = "2*x^2 + 3*y^3 + 4*z^1"
poly2 = "5*x^2 + 2*z^4"

result_add1 = "2*z^4 + 3*y^3 + 7*x^2 + 4*z^1"
result_mul1 = "10*x^4 + 4*x^2*z^4 + 15*x^2*y^3 + 6*y^3*z^4 + 20*x^2*z^1 + 8*z^5"

poly3 = "2*x^2 + 4*z^1"
poly4 = "-4*z^1 + 3*y^3"

result_add2 = "3*y^3 + 2*x^2"
result_mul2 = "-8*x^2*z^1 + 6*x^2*y^3 - 16*z^2 + 12*y^3*z^1"

poly5 = "x^1 + 1"
poly6 = "x^1 + 1"
result_mul3 = "1*x^2 + 2*x + 1"

poly7 = "6*x^7 + 9*x^4 - 7*y^4"

normalizacao :: String -> String
normalizacao s = finalForm (normalize (extractPolynom s))

adicao :: String -> String -> String
adicao s t = finalForm (normalize (addPolynom (normalize (extractPolynom s)) (normalize (extractPolynom t))))

--adicaom :: String -> String
--adicaom s = finalForm (addPolynom1 (normalize (extractPolynom s)))

tu = multiPolynom (normalize (extractPolynom poly5)) (normalize (extractPolynom poly6))

multiplicacao :: String -> String -> String
multiplicacao s t = finalForm (normalize (addPolynom' (normalize(multiPolynom (normalize (extractPolynom s)) (normalize (extractPolynom t))))))

derivacao :: String -> String -> String
derivacao c s = finalForm (normalize (derivatePoly c (normalize (extractPolynom s))))