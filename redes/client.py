import shutil
import threading
import socket

payload = 2048

def main():
  
    # crua um socket TCP
    cliente = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    try:
        cliente.connect(('localhost', 8082)) 
    except:
        return print('\nNão foi possível se conectar ao servidor!\n')


    # usuário deve informar um nick
    nick = input('Informe o nome de usuário:  ')
    print('Usuário conectado.\n')


    # cria threads para lidar com o envio e recebimento de mensagens simultaneamente
    thread_recebe = threading.Thread(target=recebeMensagem, args=[cliente])
    thread_envio = threading.Thread(target=enviaMensagem, args=[cliente, nick])

    thread_recebe.start()
    thread_envio.start()

def recebeMensagem(cliente):
  while True:
      try:
          # decodifica uma mensagem recebida do servidor
          msg = cliente.recv(payload).decode('utf-8')

          # alinha a mensagem para a direita do terminal
          msg = f"{msg}"
          cols = shutil.get_terminal_size()[0]
          spaces = cols - len(msg) - 1
          print(f'{" " * spaces}{msg}')

      except:
          print('\nNão foi possível permanecer conectado no servidor!\n')
          cliente.close()
          break

def enviaMensagem(cliente, nick):
  while True:
      try:
          msg = input('')

          # envia o conteúdo do input codificado para o servidor
          cliente.send(f'{nick}: {msg}'.encode('utf-8'))
      except:
          return

main()