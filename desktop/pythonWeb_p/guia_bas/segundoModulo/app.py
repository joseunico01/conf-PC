from logging import debug
from flask import Flask
from flask.templating import render_template

app=Flask(__name__)

#Cada vez que retornemos hay q eviar los parametros en nuestros parametros
@app.route('/')
def index():
    titulo = 'Home!'
    Lista=['Header', 'Home', 'footer']
    return render_template('index.html', titulo=titulo, Lista=Lista)

if __name__ == "__main__":
    app.run(debug=True)
