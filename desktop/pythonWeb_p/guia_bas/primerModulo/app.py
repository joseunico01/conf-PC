from logging import debug
from flask import Flask

app= Flask(__name__)

@app.route('/')
def index():
    return 'Hello Word!'

@app.route('/hola')
def hola():
    return 'Hola'

@app.route('/user/<string:user>')
def user(user):
    return 'Hola '+user

@app.route('/numero/<int:n>')
def numero(n):
    return 'Numero: {}'.format(n)

@app.route('/user/<int:id>/<string:username>')
def username(id, username):
    return 'Id: {}, Nombre de usuario: {}'.format(id, username)

@app.route('/suma/<float:n1>/<float:n2>')
def suma(n1,n2):
    return 'La suma es: {}'.format(n1+n2)

@app.route('/default/')
@app.route('/default/<string:dtf>')
def dtf(dtf= 'XD'):
    return 'El valor de dtf es: '+dtf


if __name__ == "__main__":
    app.run(debug=True)
    #app.run(debug=True, port=3000, host="0.0.0.0")
