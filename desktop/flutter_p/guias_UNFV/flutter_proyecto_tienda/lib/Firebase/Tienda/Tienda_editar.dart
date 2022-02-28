import 'package:flutter/material.dart';
import 'package:flutter_proyecto_tienda/Firebase/Tienda/Clase_tienda.dart';
import 'package:flutter_proyecto_tienda/Firebase/Tienda/Tienda_models.dart';
import 'package:flutter_proyecto_tienda/MenuPrincipal/Menu_Page.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class EditarTienda extends StatefulWidget {
  late String id;
  late String usu;
  late String tipo;
  late String idt;
  late String nom;
  late String dir;
  late String dis;
  late String tel;
  late String dia;
  late String hor;
  EditarTienda(
      {required this.id,
      required this.usu,
      required this.tipo,
      required this.idt,
      required this.nom,
      required this.dir,
      required this.dis,
      required this.tel,
      required this.dia,
      required this.hor});
  @override
  State<EditarTienda> createState() => _EditarTiendaState();
}

class _EditarTiendaState extends State<EditarTienda> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  TiendaModel tienda = new TiendaModel(
      id: '',
      nombre: '',
      direccion: '',
      distrito: '',
      telefono: '',
      dia: '',
      hora: '');
  final objtienda = new Tienda();

  @override
  Widget build(BuildContext context) {
    tienda.id = widget.idt;
    tienda.nombre = widget.nom;
    tienda.direccion = widget.dir;
    tienda.distrito = widget.dis;
    tienda.telefono = widget.tel;
    tienda.dia = widget.dia;
    tienda.hora = widget.hor;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Editar datos de la Tienda'),
      ),
      backgroundColor: Colors.lightGreen[100],
      body: Container(
        color: Colors.lightGreen[100],
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(40.0),
          child: Form(
            key: _formKey,
            //autovalidate: _autoValidate,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('ACTUALIZAR NOMBRE',
                    style: TextStyle(color: Colors.green[900])),
                _nombre(),
                Text('\nACTUALIZAR DIRECCION',
                    style: TextStyle(color: Colors.green[900])),
                _direccion(),
                Text('\nACTUALIZAR DISTRITO',
                    style: TextStyle(color: Colors.green[900])),
                _distrito(),
                Text('\nACTUALIZAR TELEFONO',
                    style: TextStyle(color: Colors.green[900])),
                _telefono(),
                Text('\nACTUALIZAR DIA (Ejm: Lun-Vie)',
                    style: TextStyle(color: Colors.green[900])),
                _dia(),
                Text('\nACTUALIZAR HORA (Ejm: 9:00 AM/9:00 PM)',
                    style: TextStyle(color: Colors.green[900])),
                _hora(),
                Text('\n'),
                _btnGuardar()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _nombre() {
    return TextFormField(
      initialValue: tienda.nombre,
      decoration: InputDecoration(
        filled: true,
        hintStyle: TextStyle(color: Colors.white),
        fillColor: Colors.green[200],
        prefixIcon: Icon(Icons.store_outlined),
        border: OutlineInputBorder(),
        hintText: 'Ingrese el nombre de la tienda',
      ),
      validator: (valor) {
        if (valor == null || valor.isEmpty)
          return 'Por favor ingrese el nombre de la tienda';
        else
          return null;
      },
      onSaved: (val) {
        tienda.nombre = val.toString();
      },
    );
  }

  Widget _direccion() {
    return TextFormField(
      initialValue: tienda.direccion,
      decoration: InputDecoration(
        filled: true,
        hintStyle: TextStyle(color: Colors.white),
        fillColor: Colors.green[200],
        prefixIcon: Icon(Icons.location_on_outlined),
        border: OutlineInputBorder(),
        hintText: 'Ingrese la direccion de la tienda',
      ),
      validator: (valor) {
        if (valor == null || valor.isEmpty)
          return 'Por favor ingrese la direccion de la tienda';
        else
          return null;
      },
      onSaved: (val) {
        tienda.direccion = val.toString();
      },
    );
  }

  Widget _distrito() {
    return TextFormField(
      initialValue: tienda.distrito,
      decoration: InputDecoration(
        filled: true,
        hintStyle: TextStyle(color: Colors.white),
        fillColor: Colors.green[200],
        prefixIcon: Icon(Icons.location_on_outlined),
        border: OutlineInputBorder(),
        hintText: 'Ingrese el distrito de la tienda',
      ),
      validator: (valor) {
        if (valor == null || valor.isEmpty)
          return 'Por favor ingrese el distrito de la tienda';
        else if (valor.contains(RegExp(r'[0-9]'))) {
          return 'Solo letras';
        } else
          return null;
      },
      onSaved: (val) {
        tienda.distrito = val.toString();
      },
    );
  }

  Widget _telefono() {
    return TextFormField(
      keyboardType: TextInputType.number,
      maxLength: 9,
      textAlign: TextAlign.center,
      initialValue: tienda.telefono,
      decoration: InputDecoration(
        filled: true,
        hintStyle: TextStyle(color: Colors.white),
        fillColor: Colors.green[200],
        prefixIcon: Icon(Icons.phone_android_outlined),
        border: OutlineInputBorder(),
        hintText: 'Ingrese el telefono de la tienda',
      ),
      validator: (valor) {
        if (valor == null || valor.isEmpty || valor.length < 7)
          return 'Por favor ingrese el telefono de la tienda';
        else if (valor.contains(RegExp(r'[a-z]')) ||
            valor.contains(RegExp(r'[A-Z]'))) {
          return 'Solo numeros';
        } else
          return null;
      },
      onSaved: (val) {
        tienda.telefono = val.toString();
      },
    );
  }

  Widget _dia() {
    return TextFormField(
      textAlign: TextAlign.center,
      maxLength: 7,
      initialValue: tienda.dia,
      decoration: InputDecoration(
        filled: true,
        hintStyle: TextStyle(color: Colors.white),
        fillColor: Colors.green[200],
        prefixIcon: Icon(Icons.calendar_today_outlined),
        border: OutlineInputBorder(),
        hintText: 'Ingrese los dias de atencion de la tienda',
      ),
      validator: (valor) {
        if (valor == null || valor.isEmpty || valor.length < 7)
          return 'Por favor ingrese los dias de atencion de la tienda';
        else if (valor.contains(RegExp(r'[0-9]'))) {
          return 'Solo letras';
        } else
          return null;
      },
      onSaved: (val) {
        tienda.dia = val.toString();
      },
    );
  }

  Widget _hora() {
    return TextFormField(
      maxLength: 15,
      textAlign: TextAlign.center,
      initialValue: tienda.hora,
      decoration: InputDecoration(
        filled: true,
        hintStyle: TextStyle(color: Colors.white),
        fillColor: Colors.green[200],
        prefixIcon: Icon(Icons.access_time_filled_outlined),
        border: OutlineInputBorder(),
        hintText: 'Ingrese la hora de atencion de la tienda',
      ),
      validator: (valor) {
        if (valor == null || valor.isEmpty || valor.length < 13)
          return 'Por favor ingrese la hora de atencion de la tienda';
        else
          return null;
      },
      onSaved: (val) {
        tienda.hora = val.toString();
      },
    );
  }

  Widget _btnGuardar() {
    return RaisedButton.icon(
      color: Colors.green,
      shape: StadiumBorder(),
      textColor: Colors.white,
      icon: Icon(Icons.fact_check_outlined),
      onPressed: () {
        _validar();
      },
      label: Text('Guardar'),
    );
  }

  void _validar() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      print('TIENDA ACTUALIZADA EXITOSAMENTE');
      objtienda.EditarTienda(tienda);
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Tienda modificada"),
                content: Text("Los datos de la tienda han sido actualizadas"),
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

