#ejemplo de socket
import socket

mysocket =socket.socket(socket.AF_INET, socket.SOCK_STREAM)
mysocket.connect(('text.files.com',80))

cmd= 'GET http://textfiles.com/adventure/adventure.txt HTTP/1.0 \r\n\r\n'.encode()
mysocket.send(cmd)

while True:
    data =mysocket.recv(512)
    if len(data) <1:
        break
    print(data.decode(), end='')

mysocket.close()

