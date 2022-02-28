import 'package:flutter/material.dart';
import 'package:flutter_proyecto_tienda/MenuPrincipal/Menu_Page.dart';
import 'package:flutter_proyecto_tienda/Usuario/ListarUsuario/Usuario_Lista.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class EditarUsuario extends StatefulWidget {
  late String id;
  late String usu;
  late String tipo;
  late String nam;
  late String ape;
  late String cor;
  late String eda;
  late String est;
  late String pes;
  EditarUsuario(
      {required this.id,
      required this.usu,
      required this.tipo,
      required this.nam,
      required this.ape,
      required this.cor,
      required this.eda,
      required this.est,
      required this.pes});
  @override
  State<EditarUsuario> createState() => _EditarUsuarioState();
}

class _EditarUsuarioState extends State<EditarUsuario> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  late String name;
  late String apelli;
  late String email;
  late String age;
  late String alt;
  late String anch;

  late TextEditingController nombre;
  late TextEditingController apellido;
  late TextEditingController correo;
  late TextEditingController edad;
  late TextEditingController estatura;
  late TextEditingController peso;

  Future _editar() async {
    var url = Uri.parse(
        'http://localhost/proyecto_flutter_prueba/CONTROLADOR/UsuarioControlador.php?op=3');
    final response = await http.post(url, body: {
      "idUsuario": widget.id,
      "Nombre": nombre.text,
      "Apellido": apellido.text,
      "Correo": correo.text,
      "Edad": edad.text,
      "Estatura": estatura.text,
      "Peso": peso.text
    });
    return jsonDecode(response.body);
  }

  @override
  void initState() {
    nombre = new TextEditingController(text: widget.nam);
    apellido = new TextEditingController(text: widget.ape);
    correo = new TextEditingController(text: widget.cor);
    edad = new TextEditingController(text: widget.eda);
    estatura = new TextEditingController(text: widget.est);
    peso = new TextEditingController(text: widget.pes);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Editar mi usuario'),
      ),
      backgroundColor: Colors.lightGreen[100],
      body: Container(
        color: Colors.lightGreen[100],
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(40.0),
          child: Form(
            key: _formKey,
            //autovalidate: _autoValidate,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('ACTUALIZAR NOMBRE',
                    style: TextStyle(color: Colors.green[900])),
                _nombre(),
                Text('\nACTUALIZAR APELLIDO',
                    style: TextStyle(color: Colors.green[900])),
                _apellido(),
                Text('\nACTUALIZAR CORREO',
                    style: TextStyle(color: Colors.green[900])),
                _correo(),
                Text('\nACTUALIZAR EDAD',
                    style: TextStyle(color: Colors.green[900])),
                _edad(),
                Text('\nACTUALIZAR ESTATURA (cm)',
                    style: TextStyle(color: Colors.green[900])),
                _estatura(),
                Text('\nACTUALIZAR PESO (kg)',
                    style: TextStyle(color: Colors.green[900])),
                _peso(),
                Text('\n'),
                _btnEditar()
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
        hintText: 'Ingrese su nombre',
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
        hintText: 'Ingrese su apellido',
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
        apelli = val.toString();
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
        age = val.toString();
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

  Widget _btnEditar() {
    return RaisedButton.icon(
      color: Colors.green,
      shape: StadiumBorder(),
      textColor: Colors.white,
      icon: Icon(Icons.edit_attributes_outlined),
      onPressed: () {
        _validar();
      },
      label: Text('Editar'),
    );
  }

  void _validar() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      print('USUARIO MODIFICADO EXITOSAMENTE');
      _editar();
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Usuario modificado"),
                content: Text("Los datos del usuario has sido modificados"),
                actions: [
                  FlatButton(
                    child: Text("Ok"),
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return new MenuPrincipal(
                            id: widget.id, usua: widget.usu, tipo: widget.tipo);
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
