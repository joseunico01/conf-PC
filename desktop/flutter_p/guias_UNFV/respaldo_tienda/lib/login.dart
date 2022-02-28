import 'package:flutter/material.dart';
import 'package:flutter_proyecto_tienda/Usuario/RegistrarUsuario/Usuario_Page.dart';
import 'package:flutter_proyecto_tienda/MenuPrincipal/Menu_Page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool seguridad = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  late String user;
  late String password;

  TextEditingController usuario = new TextEditingController();
  TextEditingController contra = new TextEditingController();

  Future<List> _existe() async {
    var url = Uri.parse(
        'http://localhost/proyecto_flutter_prueba/CONTROLADOR/UsuarioControlador.php/?op=2');
    final response = await http.post(url, body: {
      "Usuario": usuario.text,
      "Contraseña": contra.text,
    });
    var data = json.decode(response.body);
    if (data.length == 0) {
      print('NO EXISTE USUARIO');

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Error de validacion"),
                content: Text(
                    "Usuario o contraseña incorrectas por favor intente de nuevo o registrarse"),
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
      print('BIENVENIDO: ' + data[0]['Usuario']);
      String id = data[0]['idUsuario'];
      String usu = data[0]['Usuario'];
      String tip = data[0]['Tipo'];

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Usuario validado"),
                content: Text("Bienvenido " +
                    data[0]['Usuario'] +
                    " a la aplicacion movil"),
                actions: [
                  FlatButton(
                    child: Text("Aceptar"),
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return new MenuPrincipal(id: id, usua: usu, tipo: tip);
                      }), (Route route) => false);
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
        title: Text('Iniciar sesion'),
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
                Image.asset(
                  'imagenes/logo.png',
                  width: 200,
                ),
                Text('¡Bienvenido!',
                    style: TextStyle(color: Colors.green[900])),
                Text('USUARIO', style: TextStyle(color: Colors.green[900])),
                _usuario(),
                Text('CONTRASEÑA', style: TextStyle(color: Colors.green[900])),
                _contra(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [_btnIngresar(), _btnRegistrar()],
                ),
                _recuperarContra()
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
        prefixIcon: Icon(Icons.person_outline),
        border: OutlineInputBorder(),
        hintText: 'Ingrese nombre de usuario',
      ),
      validator: (valor) {
        if (valor == null || valor.isEmpty)
          return 'Por favor ingrese el nombre de usuario';
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
        prefixIcon: Icon(Icons.lock_outline),
        suffixIcon: IconButton(
          icon: Icon(seguridad ? Icons.remove_red_eye : Icons.security),
          onPressed: () {
            setState(() {
              seguridad = !seguridad;
            });
          },
        ),
        border: OutlineInputBorder(),
        hintText: 'Ingrese su contraseña',
      ),
      validator: (valor) {
        if (valor == null || valor.isEmpty)
          return 'Por favor ingrese su contraseña';
        else
          return null;
      },
      onSaved: (val) {
        password = val.toString();
      },
      obscureText: seguridad,
    );
  }

  Widget _btnIngresar() {
    return RaisedButton.icon(
      color: Colors.green,
      shape: StadiumBorder(),
      textColor: Colors.white,
      icon: Icon(Icons.input),
      onPressed: () {
        _validar();
      },
      label: Text('Ingresar'),
    );
  }

  Widget _btnRegistrar() {
    return RaisedButton.icon(
      color: Colors.green,
      shape: StadiumBorder(),
      textColor: Colors.white,
      icon: Icon(Icons.person_add),
      onPressed: () {
        _register();
      },
      label: Text('Registrarse'),
    );
  }

  Widget _recuperarContra() {
    return FlatButton(
        textColor: Colors.green[900],
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => Contrasena()));
        },
        child: Text('Recuperar contraseña'));
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

  void _register() {
    /*
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) => Usuario()));
        */
  }
}

//------------------------------------Recuperacion Contraseña-------------------------------------------------------

class Contrasena extends StatefulWidget {
  @override
  State<Contrasena> createState() => _ContrasenaState();
}

class _ContrasenaState extends State<Contrasena> {
  bool seguridad = true;
  bool vista = false;
  bool enable = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  late String user;
  late String password;

  TextEditingController usuario = new TextEditingController();
  TextEditingController contra = new TextEditingController();

  Future<List> _existe() async {
    var url = Uri.parse(
        'http://localhost/AppFlutter/proyecto_flutter_prueba/CONTROLADOR/UsuarioControlador.php/?op=6');
    final response = await http.post(url, body: {
      "Usuario": usuario.text,
    });
    var data = json.decode(response.body);
    if (data.length > 0) {
      setState(() {
        vista = true;
        enable = false;
      });
    } else {
      print('NOMBRE DE USUARIO NO SE ENCUENTRA REGISTRADO');
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("El usuario no existe"),
                content: Text(
                    "Nombre de usuario no existe, por favor ingrese otro nombre de usuario para recuperar su contraseña"),
                actions: [
                  FlatButton(
                    child: Text("Ok"),
                    onPressed: () {
                      Navigator.of(context).pop("Ok");
                    },
                  )
                ],
              ));
    }
    return data;
  }

  Future _actualizar() async {
    var url = Uri.parse(
        'http://localhost/proyecto_flutter_prueba/CONTROLADOR/UsuarioControlador.php?op=7');
    final response = await http
        .post(url, body: {"Usuario": usuario.text, "Contraseña": contra.text});
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Recuperacion de contraseña'),
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
                Text('USUARIO', style: TextStyle(color: Colors.green[900])),
                _usuario(),
                Visibility(
                    visible: vista,
                    child: Text('CONTRASEÑA DE USUARIO',
                        style: TextStyle(color: Colors.green[900]))),
                Visibility(visible: vista, child: _contra()),
                Visibility(visible: vista, child: _btnGuardar()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _usuario() {
    return TextFormField(
      enabled: enable,
      controller: usuario,
      decoration: InputDecoration(
        filled: true,
        hintStyle: TextStyle(color: Colors.white),
        fillColor: Colors.green[200],
        prefixIcon: Icon(Icons.person_outline),
        suffixIcon: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            setState(() {
              _validar1();
            });
          },
        ),
        border: OutlineInputBorder(),
        hintText: 'Ingrese nombre de usuario',
      ),
      validator: (valor) {
        if (valor == null || valor.isEmpty)
          return 'Por favor ingrese el nombre de usuario';
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

  Widget _btnGuardar() {
    return RaisedButton.icon(
      color: Colors.green,
      shape: StadiumBorder(),
      textColor: Colors.white,
      icon: Icon(Icons.save),
      onPressed: () {
        _validar2();
      },
      label: Text('Guardar'),
    );
  }

  void _validar1() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      _existe();
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  void _validar2() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      _actualizar();
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Contraseña modificada"),
                content: Text("La contraseña del usuario ha sido modificada"),
                actions: [
                  FlatButton(
                    child: Text("Ok"),
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
