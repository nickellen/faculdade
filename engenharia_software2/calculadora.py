# Implementar uma calculadora com as seguintes funcionalidades: adição, subtração, multiplicação, divisão, exponenciação e raiz quadrada.

# *  Especificar os casos de testes de unidade indicando:
#  - Estado inicial
#  - Entradas de teste
#  - Condições de execução
#  - Saídas esperadas.
import math
import os

def adicao(v1, v2):
    resultado = (v1 + v2)
    return f"{v1} + {v2} = {resultado}"

def subtracao(v1, v2):
    resultado = (v1 - v2)
    return f"{v1} - {v2} = {resultado}"

def multiplicacao(v1, v2):
    resultado = (v1 * v2)
    return f"{v1} * {v2} = {resultado}"

def divisao(v1, v2):
    if v2 == 0:
        return "Erro: divisão por 0."
    
    else:
        resultado = (v1 / v2)
        return f"{v1} / {v2} = {resultado}"

def exponenciacao(v1, v2):
    resultado = (v1 ** v2)
    return f"{v1} ** {v2} = {resultado}"
    
def raiz_quadrada(v1):
    if (v1<0):
        return "Erro: não existe dentro dos reais."
    
    else:
        resultado = (math.sqrt(v1))
        return f"√{v1} = {resultado}"

def main():
    valor1, valor2 = 0,0
    
    while True:
        
        os.system('clear')
        op = int(input("Operações disponíveis:\n\n1 - Adição\n2 - Subtração\n3 - Multiplicação\n4 - Divisão\n5 - Exponenciação\n6 - Raiz quadrada\n7 - Sair\n"))
        os.system('clear')
        
        if (1<=op<=5):
                
            print("Informe os valores: ")
            valor1 = int(input())
            valor2 = int(input())

            os.system('clear')
            
            match op:
                case 1:
                    print(adicao(valor1, valor2))
                case 2:
                    print(subtracao(valor1, valor2))
                case 3:
                    print(multiplicacao(valor1, valor2))
                case 4:
                    print(divisao(valor1, valor2))
                case 5:
                    print(exponenciacao(valor1, valor2))
            
            input("Digite enter para continuar...")
                    
        elif (op==6):
            print("Informe o valor: ", end="")
            valor = int(input())

            os.system('clear')
            print(raiz_quadrada(valor))
            input("Digite enter para continuar...")
            
        elif(op==7):
            break
        
        else:
            input("Operação inválida! Digite enter para continuar...")

main()