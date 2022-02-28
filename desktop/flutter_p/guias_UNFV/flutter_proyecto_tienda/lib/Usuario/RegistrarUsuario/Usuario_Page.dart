import 'package:flutter/material.dart';
import 'package:flutter_proyecto_tienda/Usuario/RegistrarUsuario/RegistrarUsuario.dart';
import 'package:flutter_proyecto_tienda/login.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class Usuario extends StatefulWidget {
  @override
  State<Usuario> createState() => _UsuarioState();
}

class _UsuarioState extends State<Usuario> {
  bool seguridad = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  late String user;
  late String password;

  TextEditingController usuario = new TextEditingController();
  TextEditingController contra = new TextEditingController();

  Future<List> _existe() async {
    var url = Uri.parse(
        'http://localhost/proyecto_flutter_prueba/CONTROLADOR/UsuarioControlador.php/?op=6');
    final response = await http.post(url, body: {
      "Usuario": usuario.text,
    });
    var data = json.decode(response.body);
    if (data.length > 0) {
      print('NOMBRE DE USUARIO YA ESTA REGISTRADO');

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("El usuario ya existe"),
                content: Text(
                    "Nombre de usuario ya existe, por favor ingrese otro nombre de usuario o inicie sesion"),
                actions: [
                  FlatButton(
                    child: Text("Ok"),
                    onPressed: () {
                      Navigator.of(context).pop("Ok");
                    },
                  )
                ],
              ));
    } else {
      print('NOMBRE DE USUARIO NUEVO');

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Usuario nuevo"),
                content: Text(
                    "El nombre de usuario y contraseña son validos, por favor continuar con el registro de la cuenta para poder iniciar sesion"),
                actions: [
                  FlatButton(
                    child: Text("Continuar"),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => conocerte(
                              usuario: usuario.text, contra: contra.text)));
                    },
                  )
                ],
              ));
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Registro de Usuario'),
      ),
      body: Container(
        color: Colors.lightGreen[100],
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Form(
            key: _formKey,
            //autovalidate: _autoValidate,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'imagenes/logo.png',
                  width: 200,
                ),
                Text('NOMBRE DE USUARIO',
                    style: TextStyle(color: Colors.green[900])),
                _usuario(),
                Text('CONTRASEÑA DE USUARIO',
                    style: TextStyle(color: Colors.green[900])),
                _contra(),
                _btnContinuar()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _usuario() {
    return TextFormField(
      controller: usuario,
      decoration: InputDecoration(
        filled: true,
        hintStyle: TextStyle(color: Colors.white),
        fillColor: Colors.green[200],
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(),
        hintText: 'Ingrese nombre de usuario nuevo',
      ),
      validator: (valor) {
        if (valor == null || valor.isEmpty)
          return 'Por favor ingrese el nombre de usuario nuevo';
        else
          return null;
      },
      onSaved: (val) {
        user = val.toString();
      },
    );
  }

  Widget _contra() {
    return TextFormField(
      controller: contra,
      decoration: InputDecoration(
        filled: true,
        hintStyle: TextStyle(color: Colors.white),
        fillColor: Colors.green[200],
        prefixIcon: Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(seguridad ? Icons.remove_red_eye : Icons.security),
          onPressed: () {
            setState(() {
              seguridad = !seguridad;
            });
          },
        ),
        border: OutlineInputBorder(),
        hintText: 'Ingrese su contraseña nueva',
      ),
      validator: (valor) {
        if (valor == null || valor.isEmpty)
          return 'Por favor ingrese su contraseña nueva';
        else
          return null;
      },
      onSaved: (val) {
        password = val.toString();
      },
      obscureText: seguridad,
    );
  }

  Widget _btnContinuar() {
    return RaisedButton.icon(
      color: Colors.green,
      shape: StadiumBorder(),
      textColor: Colors.white,
      icon: Icon(Icons.arrow_forward),
      onPressed: () {
        _validar();
      },
      label: Text('Continuar'),
    );
  }

  void _validar() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      _existe();
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}

//------------------------------------Conocerte-------------------------------------------------------

class conocerte extends StatefulWidget {
  late String usuario;
  late String contra;
  conocerte({required this.usuario, required this.contra});
  @override
  State<conocerte> createState() => _conocerteState();
}

class _conocerteState extends State<conocerte> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  late String name;
  late String ape;
  late String email;

  TextEditingController nombre = new TextEditingController();
  TextEditingController apellido = new TextEditingController();
  TextEditingController correo = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Queremos conocerte mejor'),
      ),
      backgroundColor: Colors.lightGreen[100],
      body: Container(
        color: Colors.lightGreen[100],
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Form(
            key: _formKey,
            //autovalidate: _autoValidate,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('NOMBRE', style: TextStyle(color: Colors.green[900])),
                _nombre(),
                Text('APELLIDO', style: TextStyle(color: Colors.green[900])),
                _apellido(),
                Text('CORREO', style: TextStyle(color: Colors.green[900])),
                _correo(),
                _btnSiguiente()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _nombre() {
    return TextFormField(
      controller: nombre,
      decoration: InputDecoration(
        filled: true,
        hintStyle: TextStyle(color: Colors.white),
        fillColor: Colors.green[200],
        prefixIcon: Icon(Icons.speaker_notes),
        border: OutlineInputBorder(),
        hintText: 'Ingrese su nombre completo',
      ),
      validator: (valor) {
        if (valor == null || valor.isEmpty)
          return 'Por favor ingrese su nombre';
        else if (valor.contains(RegExp(r'[0-9]'))) {
          return 'Solo letras';
        } else
          return null;
      },
      onSaved: (val) {
        name = val.toString();
      },
    );
  }

  Widget _apellido() {
    return TextFormField(
      controller: apellido,
      decoration: InputDecoration(
        filled: true,
        hintStyle: TextStyle(color: Colors.white),
        fillColor: Colors.green[200],
        prefixIcon: Icon(Icons.speaker_notes),
        border: OutlineInputBorder(),
        hintText: 'Ingrese sus apellidos completos',
      ),
      validator: (valor) {
        if (valor == null || valor.isEmpty)
          return 'Por favor ingrese su apellido';
        else if (valor.contains(RegExp(r'[0-9]'))) {
          return 'Solo letras';
        } else
          return null;
      },
      onSaved: (val) {
        ape = val.toString();
      },
    );
  }

  Widget _correo() {
    return TextFormField(
      controller: correo,
      decoration: InputDecoration(
        filled: true,
        hintStyle: TextStyle(color: Colors.white),
        fillColor: Colors.green[200],
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(),
        hintText: 'Ingrese su correo',
      ),
      validator: (valor) {
        if (valor == null || valor.isEmpty || !valor.contains('@'))
          return 'Por favor ingrese su correo';
        else
          return null;
      },
      onSaved: (val) {
        email = val.toString();
      },
    );
  }

  Widget _btnSiguiente() {
    return RaisedButton.icon(
      color: Colors.green,
      shape: StadiumBorder(),
      textColor: Colors.white,
      icon: Icon(Icons.navigate_next),
      onPressed: () {
        _validar();
      },
      label: Text('Siguiente'),
    );
  }

  void _validar() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => datos(
              usuario: widget.usuario,
              contra: widget.contra,
              nombre: nombre.text,
              apellido: apellido.text,
              correo: correo.text)));
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}

//------------------------------------Datos-------------------------------------------------------

class datos extends StatefulWidget {
  late String usuario;
  late String contra;
  late String nombre;
  late String apellido;
  late String correo;
  datos(
      {required this.usuario,
      required this.contra,
      required this.nombre,
      required this.apellido,
      required this.correo});
  @override
  State<datos> createState() => _datosState();
}

class _datosState extends State<datos> {
  final usuarionew = new UsuarioNew();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  late String year;
  late String alt;
  late String anch;

  TextEditingController edad = new TextEditingController();
  TextEditingController estatura = new TextEditingController();
  TextEditingController peso = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Datos'),
      ),
      body: Container(
        color: Colors.lightGreen[100],
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Form(
            key: _formKey,
            //autovalidate: _autoValidate,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('EDAD (Años)', style: TextStyle(color: Colors.green[900])),
                _edad(),
                Text('ESTATURA (cm)',
                    style: TextStyle(color: Colors.green[900])),
                _estatura(),
                Text('PESO (kg)', style: TextStyle(color: Colors.green[900])),
                _peso(),
                _btnRegistrar()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _edad() {
    return TextFormField(
      keyboardType: TextInputType.number,
      maxLength: 2,
      textAlign: TextAlign.center,
      controller: edad,
      decoration: InputDecoration(
        filled: true,
        hintStyle: TextStyle(color: Colors.white),
        fillColor: Colors.green[200],
        prefixIcon: Icon(Icons.assignment),
        border: OutlineInputBorder(),
        hintText: 'Ingrese su edad',
      ),
      validator: (valor) {
        if (valor == null || valor.isEmpty)
          return 'Por favor ingrese su edad';
        else if (valor.contains(RegExp(r'[a-z]')) ||
            valor.contains(RegExp(r'[A-Z]'))) {
          return 'Solo numeros';
        } else
          return null;
      },
      onSaved: (val) {
        year = val.toString();
      },
    );
  }

  Widget _estatura() {
    return TextFormField(
      keyboardType: TextInputType.number,
      maxLength: 3,
      textAlign: TextAlign.center,
      controller: estatura,
      decoration: InputDecoration(
        filled: true,
        hintStyle: TextStyle(color: Colors.white),
        fillColor: Colors.green[200],
        prefixIcon: Icon(Icons.accessibility),
        border: OutlineInputBorder(),
        hintText: 'Ingrese su estatura',
      ),
      validator: (valor) {
        if (valor == null || valor.isEmpty)
          return 'Por favor ingrese su estatura';
        else if (valor.contains(RegExp(r'[a-z]')) ||
            valor.contains(RegExp(r'[A-Z]'))) {
          return 'Solo numeros';
        } else
          return null;
      },
      onSaved: (val) {
        alt = val.toString();
      },
    );
  }

  Widget _peso() {
    return TextFormField(
      keyboardType: TextInputType.number,
      maxLength: 3,
      textAlign: TextAlign.center,
      controller: peso,
      decoration: InputDecoration(
        filled: true,
        hintStyle: TextStyle(color: Colors.white),
        fillColor: Colors.green[200],
        prefixIcon: Icon(Icons.accessibility),
        border: OutlineInputBorder(),
        hintText: 'Ingrese su peso',
      ),
      validator: (valor) {
        if (valor == null || valor.isEmpty)
          return 'Por favor ingrese su peso';
        else if (valor.contains(RegExp(r'[a-z]')) ||
            valor.contains(RegExp(r'[A-Z]'))) {
          return 'Solo numeros';
        } else
          return null;
      },
      onSaved: (val) {
        anch = val.toString();
      },
    );
  }

  Widget _btnRegistrar() {
    return RaisedButton.icon(
      color: Colors.green,
      shape: StadiumBorder(),
      textColor: Colors.white,
      icon: Icon(Icons.save),
      onPressed: () {
        _validar();
      },
      label: Text('Registrar'),
    );
  }

  void _validar() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      usuarionew.agregarUsuario(widget.usuario, widget.contra, widget.nombre,
          widget.apellido, widget.correo, edad.text, estatura.text, peso.text);

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Usuario registrado"),
                content: Text(
                    "Se registro el los datos del usuario exitosamente, dirigirse a iniciar sesion"),
                actions: [
                  FlatButton(
                    child: Text("Aceptar"),
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return new Login();
                      }), (Route route) => false);
                    },
                  )
                ],
              ));
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}
