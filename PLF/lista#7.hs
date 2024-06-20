-- 1) Descubra o que faz a função show.
-- Função show converte um argumento para string

import Data.Char

-- 2) Declare uma função que retorne os n últimos elementos de uma lista.

takeLast :: Int -> [a] -> [a]
takeLast n xs = drop (length xs - n) xs

-- 3) Declare uma função que retorne a interseção entre duas listas sem os elementos repetidos.

intersect xs ys = filter (\x -> elem x xs) ys

-- 4) Declare uma função que receba um inteiro e converta para binário. Utilize String para representar o binário.

intBin :: Int -> [Char]

intBin a
     | a<0 = "-" ++ intBin (-(a))
     | a==0 = "0"
     | otherwise = reverse(func3 a)

func3 a
    | a == 0 = ""
    | otherwise = show (mod a 2 ) ++ func3 (div a 2)
    
    
-- 5) Declare uma função que receba como argumento uma lista de duplas e retorne uma lista contendo as duplas cujo primeiro elemento é um número par.

func4 :: (Integral a) => [(a, b)] -> [(a, b)]

func4 xs = filter (\(a,_) -> even a) xs 

-- 6) Utilizando filter, declare um comando que receba uma String e elimine os caracteres que representam dígitos.

func5 str = filter (\x -> not(isDigit x)) str

-- 7) Declare uma função que receba uma lista de String e concatene cada String com o próprio tamanho. Ex: entrada [“Joao”, “Maria”, “oi”] → saída [“Joao4”, “Maria5”, “oi2”]. (EXTRA) Resolver utilizando zipWith.


func7 :: [[Char]] -> [[Char]] 
func7 lista = map (\x -> x ++ (aux x)) lista

aux x = show (length x)

func8 :: [[Char]] -> [[Char]]
func8 lista = zipWith (++) lista (aux2 lista)
















