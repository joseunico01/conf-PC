from flask import Flask

app=Flask(__name__)

@app.route('/')
def introduccion():
    return 'Hola te saludo mi flask'


# ingresando los datos como un login basico
@app.route('/ingreso/<usuario>/<passw>')
def ingreso(usuario, passw):
    name='Brian'
    user=usuario
    password=passw

    if user ==name and password =='123':
        return 'Inicio Exitosos'
    else: 
        return 'Error con los datos'

@app.route('/suma/<n1>/<n2>')
def sumar(n1,n2):
    suma= int(n1) + int(n2)
    resultado=str(suma)
    return 'La suma de {} y {} es igual a: {}'.format(n1, n2, suma)


if __name__ == "__main__":
    app.run(debug=True)
