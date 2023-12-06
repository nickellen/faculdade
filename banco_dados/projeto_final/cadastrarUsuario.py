import mysql.connector
import os

#!!!!!!!!!!
# REMOVER COMENTARIOS caso for cadastrar usuário para realizar a extratégia de procedures/triggers

mydb = mysql.connector.connect(
  host="localhost",
  user= "root",
  password="Iamon_14",
  database="teste"
)

mycursor = mydb.cursor()

def getUsers():

    print ("\n=========== Usuario cadastrados =================\n")

    mycursor.execute("SELECT User FROM mysql.user where Host='%';")
    users =mycursor.fetchall()

    for user in users:
        print(user[0])


def verificarUser(usuario):

    mycursor.execute("SELECT User FROM mysql.user where Host='%';")
    users =mycursor.fetchall()

    for user in users:
        if usuario==user[0]:
            return True
    
    return False


def cadastro(mod):

    usuario = input("Digite o nome do novo usuario: ")

    if verificarUser(usuario):
        print("Usuario já cadastrado!")
        return False
    
    senha = input("Digite a senha: ")

    mycursor.execute("CREATE USER %s@'%' IDENTIFIED BY %s;", (usuario, senha))
    
    # mycursor.execute("GRANT EXECUTE ON PROCEDURE teste.login_trigger TO %s@'%';", (usuario,)) 
    mycursor.execute("GRANT UPDATE, SELECT, INSERT ON teste.controle_de_acesso TO %s@'%';", (usuario,))
    mycursor.execute("FLUSH PRIVILEGES;")

    if mod==1:

        mycursor.execute("GRANT UPDATE, INSERT, DELETE, SELECT ON teste.livro TO %s@'%';", (usuario,))
    else:

        mycursor.execute("GRANT SELECT ON teste.livro TO %s@'%';", (usuario,))

    return True

def relatorio():

    os.system("clear")

    print ("\n===========Cadastrar novo usuario=================\n")

    print ("1. Administrador")
    print ("2. Consulta")
    task= int(input("Insira uma opcao: "))
    os.system("clear")
    
    if(task==1):
        op = cadastro(1)
    elif(task==2):
        op =cadastro(2)
    else:
        op = False
        print ("Voce informou um número invalido\n")

    if op:
        os.system("clear")
        getUsers()

        mydb.commit()
        mydb.close()
    
    print ("\n==================================================")

relatorio()
