import mysql.connector
import os

os.system("clear")
usuario = input("Digite o nome de usuário do banco de dados: ")
senha = input("Digite a senha do banco de dados: ")

# configurações
mydb = mysql.connector.connect(
  host="localhost",
  user= usuario,
  password=senha,
  database="teste"
)

# conexão
mycursor = mydb.cursor()

def grants():

    mycursor.execute("SHOW GRANTS FOR %s@'%';", (usuario,))
    resultado = mycursor.fetchall()
    print(len(resultado))
    if len(resultado)>4:
        return 1
    return 2
    

def logoff():
    
    mycursor.execute("SHOW STATUS LIKE 'Com_select';")
    select = mycursor.fetchall()

    mycursor.execute("SHOW STATUS LIKE 'Com_delete';")
    delete = mycursor.fetchall()

    mycursor.execute("SHOW STATUS LIKE 'Com_update';")
    update = mycursor.fetchall()

    info = (select[0][1], delete[0][1], update[0][1] )
    sql = "update controle_de_acesso set logout_ts = NOW(), qtd_select = %s, qtd_delete = %s, qtd_update = %s WHERE id_conexao = CONNECTION_ID();"
    mycursor.execute(sql, info)
    mydb.commit()
                     
def fim():
    input("Pressione Enter para continuar...")
    os.system("clear")

# Inserir livro na tabela
def inserir():

    isbn= str(input("Digite o codigo ISBN: "))
    nome= str(input("Digite o nome da obra:"))
    autor= str(input("Digite o nome do autor:"))
    genero= str(input("Digite o genero:"))

    mycursor.execute("insert into livro values (%s, %s, %s, %s)",(isbn, nome, autor, genero))
    mydb.commit()

    # Imprimir verificação
    print("\n============= Livro adicionado ==============\n")
    selecionar(isbn)

def selecionar(isbn = None):

    # imprimir dados da tabela
    if isbn!=None:
        sql = "SELECT * FROM livro WHERE isbn = %s"
        mycursor.execute(sql, (isbn,))
    else:
        mycursor.execute("select * from livro")

    rows=mycursor.fetchall()
    for row in rows:
        print("ISBN:", row[0], ", Título:", row[1], ", Autor:", row[2], ", Genero:", row[3])
    print ("\n==============================================")

def getLivro(isbn):

    sql = "SELECT * FROM livro WHERE isbn = %s"
    mycursor.execute(sql, (isbn,))

    result=mycursor.fetchall()
    
    return result[0]


def deletar():

    print ("===========Todos os dados da tabela=================\n")
    selecionar()

    del_isbn= input("Insira isbn do livro a deletar: ")
    sql = "delete from livro where isbn = %s"

    mycursor.execute(sql, (del_isbn,))
    mydb.commit()

    os.system("clear")
    # livro excluido da tabela de log
    print ("========= Livro excluido =====================\n")
    sql = "SELECT * FROM livro_log WHERE isbn = %s order by timestamp_column DESC limit 1"
    mycursor.execute(sql, (del_isbn,))

    rows=mycursor.fetchall()
    for row in rows:
        print("ISBN:", row[0], ", Título:", row[1], ", Autor:", row[2], ", Genero:", row[3])
    print ("\n==============================================")


def atualizacao():

    print ("===========Todos os dados da tabela=================\n")
    selecionar()

    print("(Informe os dados ou enter para continuar)\n")

    # isbn do livro para update
    isbn = input("Informe o isbn do livro para update: ")

    # livro antes das mudanças

    livro = getLivro(isbn)

    # mudanças livro
    lista = ["", "", "", ""]
    lista[0] = isbn
    lista[1] = input("Informe o nome: ")
    lista[2] = input("Informe o autor: ")
    lista[3] = input("Informe o genero: ")


    for i in range(len(livro)):
        if lista[i] == "":
            lista[i] = livro[i]

    update = "UPDATE livro SET nome=%s, autor=%s, genero=%s WHERE isbn=%s" 
    mycursor.execute(update, (lista[1], lista[2], lista[3], lista[0]))
    mydb.commit()

    os.system("clear")

    # imprimir versao antiga
    print ("========= Versao antiga =====================\n")

    sql = "SELECT * FROM livro_log WHERE isbn = %s order by timestamp_column DESC limit 1"
    mycursor.execute(sql, (lista[0],))

    rows = mycursor.fetchall()

    for row in rows:
        print("ISBN:", row[0], ", Título:", row[1], ", Autor:", row[2], ", Genero:", row[3])

    # imprimir versao nova

    print ("\n========= Versao atual =====================\n")
    selecionar(lista[0])


def administrador():

    while(True):
        print ("==============================================")
        print ("0. Fim")
        print ("1. Inserir")
        print ("2. Selecionar")
        print ("3. Deletar")
        print ("4. Fazer atualização")
        print ("==============================================")
        task= int(input("Insira uma opcao: "))
        os.system("clear")
        
        if(task==1):
            inserir()
        elif(task==2):
            print ("===========Todos os dados da tabela=================\n")
            selecionar()
        elif(task==3):
            deletar()
        elif(task==4):
           atualizacao()
        elif(task==0):
            break
        else:
            print ("Voce informou um número invalido\n")
        fim()

    mydb.commit()

    logoff()
    mydb.close()
    print ("Fim do programa!\n")

def consulta():

    while(True):
        print ("==============================================")
        print ("0. Fim")
        print ("1. Selecionar")
        print ("==============================================")
        task= int(input("Insira uma opcao: "))
        os.system("clear")
        
        if(task==1):
            selecionar()
        elif(task==0):
            break
        else:
            print ("Voce informou um número invalido\n")
        fim()

    mydb.commit()

    logoff()
    mydb.close()
    print ("Fim do programa!\n")

def main():

    if grants()==1:
        administrador()
    
    else:
        consulta()

if __name__ == '__main__':
    main()
