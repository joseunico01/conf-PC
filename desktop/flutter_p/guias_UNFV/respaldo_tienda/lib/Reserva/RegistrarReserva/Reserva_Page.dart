import 'package:flutter/material.dart';
import 'package:flutter_proyecto_tienda/MenuPrincipal/Menu_Page.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class Reserva extends StatefulWidget {
  late String id;
  late String usua;
  late String tipo;
  late String sto;
  late List list;
  late int index;
  Reserva(
      {required this.id,
      required this.usua,
      required this.tipo,
      required this.sto,
      required this.list,
      required this.index});
  @override
  State<Reserva> createState() => _ReservaState();
}

class _ReservaState extends State<Reserva> {
  late DateTime _dateTime = DateTime.now();
  var fecha;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  late String cant;
  late String fech;

  TextEditingController cantidad = new TextEditingController();
  TextEditingController dia = new TextEditingController();

  Future _reservar() async {
    var url = Uri.parse(
        'http://localhost/proyecto_flutter_prueba/CONTROLADOR/ReservaControlador.php?op=1');
    final response = await http.post(url, body: {
      "idUsuario": widget.id,
      "idProducto": widget.list[widget.index]['ID'],
      "Cantidad": cantidad.text,
      "Total": widget.list[widget.index]['Precio'],
      "Fecha": dia.text,
    });

    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Registro de Reserva'),
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
                Text('CANTIDAD DE PRODUCTOS',
                    style: TextStyle(color: Colors.green[900])),
                _cantidad(),
                Text('FECHA DE RESERVA',
                    style: TextStyle(color: Colors.green[900])),
                _btnCalendario(),
                _fecha(),
                _btnReservar()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _cantidad() {
    return TextFormField(
      keyboardType: TextInputType.number,
      maxLength: 2,
      textAlign: TextAlign.center,
      controller: cantidad,
      decoration: InputDecoration(
        filled: true,
        hintStyle: TextStyle(color: Colors.white),
        fillColor: Colors.green[200],
        prefixIcon: Icon(Icons.shopping_cart),
        border: OutlineInputBorder(),
        hintText: 'Ingrese cantidad de reserva',
      ),
      validator: (valor) {
        if (valor == null || valor.isEmpty)
          return 'Por favor ingrese la cantidad a reservar';
        else if (valor.contains(RegExp(r'[a-z]')) ||
            valor.contains(RegExp(r'[A-Z]'))) {
          return 'Solo numeros';
        } else
          return null;
      },
      onSaved: (val) {
        cant = val.toString();
      },
    );
  }

  Widget _fecha() {
    fecha == null ? dia.text = '' : dia.text = fecha.toString();
    return TextFormField(
      enabled: false,
      textAlign: TextAlign.center,
      controller: dia,
      decoration: InputDecoration(
        filled: true,
        hintStyle: TextStyle(color: Colors.white),
        fillColor: Colors.green[200],
        prefixIcon: Icon(Icons.calendar_today_rounded),
        border: OutlineInputBorder(),
        hintText: 'Fecha de reserva',
      ),
      onSaved: (val) {
        fech = val.toString();
      },
    );
  }

  Widget _btnCalendario() {
    return RaisedButton.icon(
      color: Colors.green,
      shape: StadiumBorder(),
      textColor: Colors.white,
      icon: Icon(Icons.calendar_today_outlined),
      onPressed: () {
        showDatePicker(
                context: context,
                initialDate: _dateTime,
                firstDate: DateTime.now(),
                lastDate: DateTime.utc(2023))
            .then((value) {
          setState(() {
            _dateTime = value!;
            var year = _dateTime.year;
            var mes = _dateTime.month;
            var dia = _dateTime.day;
            fecha = ("$year-$mes-$dia");
            print(fecha);
          });
        });
      },
      label: Text('Seleccionar fecha'),
    );
  }

  Widget _btnReservar() {
    return RaisedButton.icon(
      color: Colors.green,
      shape: StadiumBorder(),
      textColor: Colors.white,
      icon: Icon(Icons.add_shopping_cart),
      onPressed: () {
        _validar();
      },
      label: Text('Reservar'),
    );
  }

  void _validar() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      int c = int.parse(cantidad.text);
      int s = int.parse(widget.sto);

      if (c > s) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Cantidad no disponible"),
                  content: Text("La cantidad reservada sobrepasa el stock"),
                  actions: [
                    FlatButton(
                      child: Text("Ok"),
                      onPressed: () {
                        Navigator.of(context).pop("Ok");
                      },
                    )
                  ],
                ));
      } else if (dia.text == '') {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Seleccionar fecha"),
                  content: Text(
                      "Por favor seleccione la fecha de reserva para poder reservar el producto"),
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
        _reservar();

        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Reserva registrada"),
                  content: Text(
                      "Dirigirse a mis reservas para visualizar sus productos reservados"),
                  actions: [
                    FlatButton(
                      child: Text("Ok"),
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return new MenuPrincipal(
                              id: widget.id,
                              usua: widget.usua,
                              tipo: widget.tipo);
                        }), (Route route) => false);
                      },
                    )
                  ],
                ));
      }
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}
