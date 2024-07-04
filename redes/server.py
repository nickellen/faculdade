import socket
import threading

clientes = []
payload = 2048  # tam máximo das mensagens

# recebe a mensagem do cliente, e a envia para todos os demais
def handle_client(cliente):
    while True:
        try:
            mensagem = cliente.recv(payload)
            if not mensagem:
                break
            broadcast(mensagem, cliente)
        except:
            clientes.remove(cliente)
            cliente.close()
            break

# para cada cliente da lista de clientes:
# envia a mensagem caso o cliente não seja o próprio remetente
def broadcast(mensagem, remetente):
  for cliente in clientes:
      if cliente != remetente:
          try:
            cliente.send(mensagem)
          except:
              clientes.remove(cliente)
              cliente.close()

def main(host = 'localhost', port=8082):

    try:
        endereco = (host, port)
        servidor= socket.socket(socket.AF_INET,  socket.SOCK_STREAM)
        print (f"Iniciando servidor em {host} porta {port}.\n")

        try:
            servidor.bind(endereco)     # liga o servidor ao endereço e porta
            servidor.listen() 
        except:
            return print("Não foi possível iniciar o servidor.")
        
        while True: 
            cliente, endereco = servidor.accept()
            clientes.append(cliente)
            print(f"Cliente conectado com sucesso. IP: ", endereco)

            # cria uma nova thread para o novo cliente conectado
            thread = threading.Thread(target=handle_client, args=(cliente,))
            thread.start()   
    
    except KeyboardInterrupt:

        #encerra todos os sockets dos clientes e fecha o servidor
        for cliente in clientes:
            cliente.close()
        servidor.close()
        print("Servidor fechado.")

main()