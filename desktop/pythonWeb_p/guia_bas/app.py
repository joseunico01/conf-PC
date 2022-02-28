from flask import Flask
from flask.templating import render_template

import forms

app=Flask(__name__)

@app.route('/')
def hello_word():
    titulo='mi titulo'
    return render_template('index.html', titulo=titulo)

if __name__ == "__main__":
    app.run(debug=True)

