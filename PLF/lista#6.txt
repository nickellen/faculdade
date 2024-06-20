-- 1) Crie uma função para calcular a área de uma circunferência. Teste a função anterior utilizando let.) 
-- (A = π r²)

areaCircunferencia :: Float -> Float

areaCircunferencia x = pi * (x**2)

-- 2) Crie uma função que receba três medidas a, b e c, correspondentes aos lados de um triângulo, e imprima o tipo do triângulo (escaleno, isósceles ou equilátero) ou NAOTRI quando aquelas medidas não formam um triângulo.

tipoTriangulo :: Real a => a -> a -> a -> [Char]

tipoTriangulo x y z
          | x == y && x == z = "equilatero"
          | x /= y && y /= z && x/=z = "escaleno"
          | otherwise = "isoceles"
          
          
-- 3) Utilizando recursividade, crie a função multiplica x y.

multiplica :: Int -> Int -> Int

multiplica x y
         | y == 0 = 0
         | otherwise = x + multiplica x (y-1)


-- 4) E se você pudesse supor que x e y sempre serão naturais (não negativos)? Faça multiplicaNaturais x y, também recursiva.

multiplicaNatural :: Int -> Int -> Int

multiplicaNatural x y
         | y == 0 = 0
         | otherwise = x + multiplica x (y-1)

-- 5) Crie as funções menor e maior, que devem receber três valores e indicar menor e maior valor, respectivamente. (EXTRA) Defina a função maior utilizando a função menor, ou o contrário.

menor :: Real a => a -> a -> a -> a
maior :: Real a => a -> a -> a -> a

menor x y z
       | x < y && x<z = x
       | y < x && y<z = y
       | otherwise = z
       
maior x y z
       | x > y && x>z = x
       | y > x && y>z = y
       | otherwise = z

-- 6) Crie a função XOR (também conhecida como “ou exclusivo”). Esta função retorna True se duas expressões forem diferentes (uma True e a outra False).

xor a b 
       | a == False && b == True = True
       | a == True && b == False = True
       | otherwise = False

-- 7) Crie a função clonaNumeros, que deve receber uma lista e duplicar cada valor recebido nela. Ex: [1,2,3] deve retornar [1,1,2,2,3,3].

clonaNumeros [] = []
clonaNumeros (x:xs) = x:x:clonaNumeros xs


-- 8) Crie uma função que receba uma lista e some os dois primeiros valores da lista.

somaLista :: Real a=> [a] -> a

somaLista [] = error "Lista vazia"
somaLista (x:xs) = head xs + x

-- 9) Crie uma função que receba um número e crie uma lista de 0 até o valor absoluto deste número. Ex: -9 deve retornar [0,1,2,3,4,5,6,7,8,9], 0 deve retornar [0] e etc.


criaLista:: Int -> [Int]
criaLista x = if x<0 then [0..(-x)] else [0..x]

-- 10) Crie a função parOuImpar, que recebe uma lista de valores e retorna uma lista booleana com True quando o valor for par e False quando o valor for ímpar. Exemplo: [1, 2, 3] retorna [False, True, False].

parOuImpar::[Int] -> [Bool]
parOuImpar (x:xs) = [par x | x <- (x:xs)]

par::Int -> Bool
par x = if (mod x 2 == 0) then True else False


-- 11) Crie a função soPar, que remove todos os números ímpares da lista.

