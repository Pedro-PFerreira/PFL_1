import AddPoly
import Norma
import MultiPoly
import DerivPoly
import Rev
import Parsing

-- Examples

poly1 = "2*x^2 + 3*y^3 + 4*z^1"
poly2 = "5*x^2 + 2*z^4"
{-
    result_add1 = "2*z^4 + 3*y^3 + 7*x^2 + 4*z^1"
    r_mul1 = "8*z^5 + 6*y^3*z^4 + 4*x^2*z^4 + 10*x^4 + 15*x^2*y^3 + 20*x^2*z^1"
    r_derv1 = "4*x^1" em ordem a x poly1
    r_derv2 =  "8*z^3" -- em ordem a z poly2
-}

poly3 = "2*x^2 + 4*z^1"
poly4 = "-4*z^1 + 3*y^3"
{-
    result_add2 = "3*y^3 + 2*x^2"
    r_mult2 = "6*x^2*y^3 + 12*y^3*z^1 - 8*x^2*z^1 - 16*z^2"
    r_derv3 = "-4" -- em ordem a z poly4
-}

poly5 = "2*x^(-6) + 7*y^3*x^1"
poly6 = "2*x^3 + 8*x^1*y^3"
{-
    result_add3 = "2*x^3 + 15*x^1*y^3 + 2*x^(-6)"
    r_mul3 = "56*x^2*y^6 + 14*x^4*y^3 + 16*x^(-5)*y^3 + 4*x^(-3)"
    r_derv4 = "7*y^3 - 12*x^(-7)" -- em ordem a x poly5
-}

poly7 = "2*x^1 + 1"
poly8 = "-2*x^1 - 1"
{-
    r_add4 = "" -- 0
    result_mul4 = "1*x^2 + 2*x + 1"
-}

poly9 = "4*x^2*z^4 + 3*y^3"
poly10 = "1*x^6 + 7 - 3*y^3"
{-
    result_add5 = "5*x^6 + 4*x^2*z^4 + 7"
    r_der5 = "16*x^2*z^3" -- em ordem a z poly9
-}

poly11 = "6*x^7 + 9*x^4 - 7*y^4"

poly12 = "0*x^2 + 2*y^1 + 5*z^1 + 6*y^1 + 7*y^2"
{-
    norm12 = "7*y^2 + 8*y^1 + 5*z^1"
-}

poly13 = "5*x^3 + 7*y^7 - 5*z^10"
{-
    norm13 = "-5*z^10 + 7*y^7 + 5*x^3" 
-}

poly14 = "6*x^(-10) + 4*z^2*d^4 - 78*k^3"
{-
    norm14 = "4*d^4*z^2 - 78*k^3 + 6*x^(-10)" 
-}

poly15 = "4*z^2*d^4 - 8*z^2*d^4 + 8*z^2*e^4"
{-
    norm15 = "8*e^4*z^2 -4*d^4*z^2" 
-}

poly16 = "23*z^3*d^4 - 8*d^4*z^3 + 95*z^3*d^4"
{-
    norm16 = "- 5*z^10 - 7*y^7 + 5*x^3" 
-}
{-
Esta função retorna a forma normalizada do polinómio de input.
-}
normalizacao :: String -> String
normalizacao s = finalForm (normalize (extractPolynom s))

{-
Esta função retorna a adição dos dois polinómios de input.
-}
adicao :: String -> String -> String
adicao s t = finalForm (normalize (addPolynom (normalize (extractPolynom s)) (normalize (extractPolynom t))))

{-
Esta função retorna a multiplicação dos dois polinómios de input.
-}
multiplicacao :: String -> String -> String
multiplicacao s t = finalForm (normalize (addPolynom' (normalize(multiPolynom (normalize (extractPolynom s)) (normalize (extractPolynom t))))))

{-
Esta função retorna a derivada do polinómio de input.
-}
derivacao :: String -> String -> String
derivacao c s = finalForm (normalize (derivatePoly c (normalize (extractPolynom s))))