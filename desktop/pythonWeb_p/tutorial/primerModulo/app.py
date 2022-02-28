from types import MethodType
from flask import Flask, render_template, request

app= Flask(__name__)

@app.route('/')
def index():
    nombre ='youtuber'
    n=1
    lista=[1,2,3,4,5,6,7,8,9]
    return render_template('index.html', nombre=nombre, n=n, lista=lista)

@app.route('/contacto', methods=['POST'])
def contacto():
    nombre= request.form.get('nombre')
    return render_template('contacto.html', nombre=nombre)

if __name__ == "__main__":
    app.run(debug=True)

