# Implementar uma calculadora com as seguintes funcionalidades: adição, subtração, multiplicação, divisão, exponenciação e raiz quadrada.

# *  Especificar os casos de testes de unidade indicando:
#  - Estado inicial
#  - Entradas de teste
#  - Condições de execução
#  - Saídas esperadas.

import math
import os
import unittest

class Calculadora:

    def adicao(self, v1, v2):
        resultado = (v1 + v2)
        return resultado

    def subtracao(self, v1, v2):
        resultado = (v1 - v2)
        return resultado

    def multiplicacao(self, v1, v2):
        resultado = (v1 * v2)
        return resultado

    def divisao(self, v1, v2):
        if v2 == 0:
            return "Erro: divisão por 0."
        
        else:
            resultado = (v1 / v2)
            return round(resultado,2)

    def exponenciacao(self, v1, v2):
        resultado = (v1 ** v2)
        return round(resultado,2)
        
    def raiz_quadrada(self, v1):
        if (v1<0):
            return "Erro: não existe dentro dos reais."
        
        else:
            resultado = (math.sqrt(v1))
            return round(resultado,2)
    

class TestClass(unittest.TestCase):

    def test_soma(self):
        calculadora = Calculadora()

        self.assertEqual(calculadora.adicao(4, 1), 5, "Erro de adicao")
        self.assertEqual(calculadora.adicao(-4, -1), -5, "Erro de adicao")
        self.assertEqual(calculadora.adicao(4, -1), 3, "Erro de adicao.")
        self.assertEqual(calculadora.adicao(-4, 1), -3, "Erro de adicao.")

    def test_divisao(self):
        calculadora = Calculadora()
        
        self.assertEqual(calculadora.divisao(5, 0),"Erro: divisão por 0." , "Erro: divisão por 0.")
        self.assertEqual(calculadora.divisao(510, 2),255, "Erro de divisao.")
        self.assertEqual(calculadora.divisao(-10, 2),-5, "Erro de divisao.")
        self.assertEqual(calculadora.divisao(-5, -3),1.67, "Erro de divisao.")

    def test_subtracao(self):
        calculadora = Calculadora()
        
        self.assertEqual(calculadora.subtracao(5, 0),5 , "Erro de subtracao.")
        self.assertEqual(calculadora.subtracao(-510, 2),-512, "Erro de subtracao.")
        self.assertEqual(calculadora.subtracao(-10, -2),-8, "Erro de subtracao.")

    def test_multiplicacao(self):
        calculadora = Calculadora()

        self.assertEqual(calculadora.multiplicacao(5, 0),0 , "Erro de multiplicacao.")
        self.assertEqual(calculadora.multiplicacao(-510, 2),-1020, "Erro de multiplicacao.")
        self.assertEqual(calculadora.multiplicacao(-1, 0.2),-0.2, "Erro de multiplicacao.")

    def test_exponenciacao(self):
        calculadora = Calculadora()

        self.assertEqual(calculadora.exponenciacao(5, 0),1 , "Erro de exponenciacao.")
        self.assertEqual(calculadora.exponenciacao(-2, -2),0.25, "Erro de exponenciacao.")
        self.assertEqual(calculadora.exponenciacao(5, -3),0.01, "Erro de exponenciacao.")

    def test_raiz_quadrada(self):

        calculadora = Calculadora()

        self.assertEqual(calculadora.raiz_quadrada(-5), "Erro: não existe dentro dos reais.", "Erro: não existe dentro dos reais.")

        self.assertEqual(calculadora.raiz_quadrada(89), 9.43, "Erro de raiz.")
        self.assertEqual(calculadora.raiz_quadrada(0.5),0.71, "Erro de raiz.")


unittest.main()