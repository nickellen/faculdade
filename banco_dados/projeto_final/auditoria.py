import mysql.connector
import os

# configurações
mydb = mysql.connector.connect(
  host="localhost",
  user= "root",
  password="Iamon_14",
  database="teste"
)

# conexão
mycursor = mydb.cursor()

def relatorio():

    print ("===========Todos os dados da tabela=================\n")

    # imprimir dados da tabela
    mycursor.execute("select * from controle_de_acesso")

    rows=mycursor.fetchall()

    for row in rows:
        print("ID_CONEXAO:", row[1], ", USER:", row[2], ", LOGIN_TS:", row[3], ", LOGOUT_TS:", row[4], ", QTD_SELECT:", row[5], ", QTD_INSERT:", row[6], ", QTD_DELETE:", row[7], ", QTD_UPDATE:", row[8])
        print("")

    print ("\n====================================================")

def main():

    relatorio()
    mydb.commit()
    mydb.close()
    
main()
