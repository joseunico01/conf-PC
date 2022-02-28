from flask import Flask, render_template

app=Flask(__name__)

@app.route('/')
def index():
    name='Barni'
    edad=44
    ap='Vasquez'
    return render_template('index.html', nombre=name, apellido=ap, años=edad)


@app.route('/diccionario')
def diccionario():
    dic ={'nombre': 'Juan', 'edad': '22', 'pais':'Mexico'}
    return render_template('index.html', dic=dic)


@app.route('/listaPersona')
def listaPersona():
    personas = ['Martin', 'Carla','Pedro','Barnie']
    return render_template('bucle.html', personas=personas)


@app.route('/saludo/<saludo>')
def saludar(saludo):
    return render_template('condicion.html', saludo=saludo)


@app.route('/perfil')
def perfil():
    return render_template('perfil.html')


@app.route('/blog')
def blog():
    render_template('blog.html')




if __name__ == "__main__":
    app.run(debug=True)
