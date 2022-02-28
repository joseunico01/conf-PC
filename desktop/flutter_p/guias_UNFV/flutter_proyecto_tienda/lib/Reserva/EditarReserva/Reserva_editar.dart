import 'package:flutter/material.dart';
import 'package:flutter_proyecto_tienda/MenuPrincipal/Menu_Page.dart';
import 'package:flutter_proyecto_tienda/Reserva/ListarReserva/Reserva_Lista.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class EditarReserva extends StatefulWidget {
  late String id;
  late String idusua;
  late String usua;
  late String tipo;
  late String can;
  late String fec;
  late String sto;
  late String preci;
  EditarReserva(
      {required this.id,
      required this.idusua,
      required this.usua,
      required this.tipo,
      required this.can,
      required this.fec,
      required this.sto,
      required this.preci});
  @override
  State<EditarReserva> createState() => _EditarReservaState();
}

class _EditarReservaState extends State<EditarReserva> {
  late DateTime _dateTime = DateTime.now();
  var fecha;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  late String cont;
  late String fech;

  late TextEditingController cantidad;
  late TextEditingController dia;

  Future _editar() async {
    var url = Uri.parse(
        'http://localhost/proyecto_flutter_prueba/CONTROLADOR/ReservaControlador.php?op=3');
    final response = await http.post(url, body: {
      "idReserva": widget.id,
      "Cantidad": cantidad.text,
      "Total": widget.preci,
      "Fecha": dia.text
    });

    return jsonDecode(response.body);
  }

  @override
  void initState() {
    cantidad = new TextEditingController(text: widget.can);
    dia = new TextEditingController(text: widget.fec);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Editar Reserva'),
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
                Text('NUEVA CANTIDAD DE PRODUCTOS',
                    style: TextStyle(color: Colors.green[900])),
                _cantidad(),
                Text('NUEVA FECHA DE RESERVA',
                    style: TextStyle(color: Colors.green[900])),
                _btnCalendario(),
                _fecha(),
                _btnEditar()
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
        hintText: 'Ingrese la cantidad',
      ),
      validator: (valor) {
        if (valor == null || valor.isEmpty)
          return 'Por favor ingrese la cantidad de la reserva';
        else if (valor.contains(RegExp(r'[a-z]')) ||
            valor.contains(RegExp(r'[A-Z]'))) {
          return 'Solo numeros';
        } else
          return null;
      },
      onSaved: (val) {
        cont = val.toString();
      },
    );
  }

  Widget _fecha() {
    fecha == null ? dia.text = widget.fec : dia.text = fecha.toString();
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

  Widget _btnEditar() {
    return RaisedButton.icon(
      color: Colors.green,
      shape: StadiumBorder(),
      textColor: Colors.white,
      icon: Icon(Icons.add_shopping_cart),
      onPressed: () {
        _validar();
      },
      label: Text('Editar'),
    );
  }

  void _validar() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      int s = int.parse(widget.sto);
      int ca = int.parse(widget.can);
      int cn = int.parse(cantidad.text);

      if (cn > (s + ca)) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Cantidad nueva no disponible"),
                  content: Text(
                      "La cantidad nueva a reservar sobrepasa el stock actual"),
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
        _editar();
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Reserva modificada"),
                  content: Text(
                      "Los datos de la reserva del producto han sido modificadas"),
                  actions: [
                    FlatButton(
                      child: Text("Ok"),
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return new MenuPrincipal(
                              id: widget.idusua,
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
