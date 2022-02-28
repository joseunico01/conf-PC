import 'package:flutter/material.dart';
import 'package:flutter_proyecto_tienda/MenuPrincipal/Menu_Page.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class Producto extends StatefulWidget {
  late String id;
  late String usua;
  late String tipo;
  late String idpro;
  late String nompro;
  late String despro;
  late String stopro;
  late String prepro;
  Producto(
      {required this.id,
      required this.usua,
      required this.tipo,
      required this.idpro,
      required this.nompro,
      required this.despro,
      required this.stopro,
      required this.prepro});
  @override
  State<Producto> createState() => _ProductoState();
}

class _ProductoState extends State<Producto> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  late String nom;
  late String des;
  late String sto;
  late String pre;

  late TextEditingController nomprod;
  late TextEditingController descrip;
  late TextEditingController stock;
  late TextEditingController preci;

  Future _agregar() async {
    var url = Uri.parse(
        'http://localhost/proyecto_flutter_prueba/CONTROLADOR/ProductoControlador.php?op=1');
    final response = await http.post(url, body: {
      "Nombre": nomprod.text,
      "Descripcion": descrip.text,
      "Stock": stock.text,
      "Precio": preci.text,
    });
    return jsonDecode(response.body);
  }

  Future _editar() async {
    var url = Uri.parse(
        'http://localhost/proyecto_flutter_prueba/CONTROLADOR/ProductoControlador.php?op=3');
    final response = await http.post(url, body: {
      "idProducto": widget.idpro,
      "Nombre": nomprod.text,
      "Descripcion": descrip.text,
      "Stock": stock.text,
      "Precio": preci.text
    });

    return jsonDecode(response.body);
  }

  @override
  void initState() {
    nomprod = new TextEditingController(text: widget.nompro);
    descrip = new TextEditingController(text: widget.despro);
    stock = new TextEditingController(text: widget.stopro);
    preci = new TextEditingController(text: widget.prepro);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
            widget.idpro == '' ? 'Registro de Producto' : 'Editar Producto'),
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
                Text(
                    widget.nompro == ''
                        ? 'NOMBRE DEL PRODUCTO'
                        : 'NUEVO NOMBRE DEL PRODUCTO',
                    style: TextStyle(color: Colors.green[900], fontSize: 12.5)),
                _nombre(),
                Text(
                    widget.despro == ''
                        ? 'DESCRIPCION DEL PRODUCTO'
                        : 'NUEVA DESCRIPCION DEL PRODUCTO',
                    style: TextStyle(color: Colors.green[900], fontSize: 12.5)),
                _descripcion(),
                Text(
                    widget.stopro == ''
                        ? 'STOCK DEL PRODUCTO'
                        : 'NUEVO STOCK DEL PRODUCTO',
                    style: TextStyle(color: Colors.green[900], fontSize: 12.5)),
                _stock(),
                Text(
                    widget.prepro == ''
                        ? 'PRECIO DEL PRODUCTO'
                        : 'NUEVO PRECIO DEL PRODUCTO',
                    style: TextStyle(color: Colors.green[900], fontSize: 12.5)),
                _precio(),
                widget.idpro == '' ? _btnAgregar() : _btnEditar()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _nombre() {
    return TextFormField(
      controller: nomprod,
      decoration: InputDecoration(
        filled: true,
        hintStyle: TextStyle(color: Colors.white),
        fillColor: Colors.green[200],
        prefixIcon: Icon(Icons.content_paste),
        border: OutlineInputBorder(),
        hintText: 'Ingrese el nombre del producto',
      ),
      validator: (valor) {
        if (valor == null || valor.isEmpty)
          return 'Por favor ingrese el nombre del producto';
        else if (valor.contains(RegExp(r'[0-9]'))) {
          return 'Solo letras';
        } else
          return null;
      },
      onSaved: (val) {
        nom = val.toString();
      },
    );
  }

  Widget _descripcion() {
    return TextFormField(
      controller: descrip,
      decoration: InputDecoration(
        filled: true,
        hintStyle: TextStyle(color: Colors.white),
        fillColor: Colors.green[200],
        prefixIcon: Icon(Icons.content_paste),
        border: OutlineInputBorder(),
        hintText: 'Ingrese la descripcion del producto',
      ),
      validator: (valor) {
        if (valor == null || valor.isEmpty)
          return 'Por favor ingrese la descripcion del producto';
        else
          return null;
      },
      onSaved: (val) {
        des = val.toString();
      },
    );
  }

  Widget _stock() {
    return TextFormField(
      keyboardType: TextInputType.number,
      maxLength: 2,
      textAlign: TextAlign.center,
      controller: stock,
      decoration: InputDecoration(
        filled: true,
        hintStyle: TextStyle(color: Colors.white),
        fillColor: Colors.green[200],
        prefixIcon: Icon(Icons.local_grocery_store_outlined),
        border: OutlineInputBorder(),
        hintText: 'Ingrese stock del producto',
      ),
      validator: (valor) {
        if (valor == null || valor.isEmpty)
          return 'Por favor ingrese el stock del producto';
        else if (valor.contains(RegExp(r'[a-z]')) ||
            valor.contains(RegExp(r'[A-Z]'))) {
          return 'Solo numeros';
        } else
          return null;
      },
      onSaved: (val) {
        sto = val.toString();
      },
    );
  }

  Widget _precio() {
    return TextFormField(
      keyboardType: TextInputType.number,
      maxLength: 5,
      textAlign: TextAlign.center,
      controller: preci,
      decoration: InputDecoration(
        filled: true,
        hintStyle: TextStyle(color: Colors.white),
        fillColor: Colors.green[200],
        prefixIcon: Icon(Icons.monetization_on),
        border: OutlineInputBorder(),
        hintText: 'Ingrese precio del producto',
      ),
      validator: (valor) {
        if (valor == null || valor.isEmpty)
          return 'Por favor ingrese el precio del producto';
        else if (valor.contains(RegExp(r'[a-z]')) ||
            valor.contains(RegExp(r'[A-Z]'))) {
          return 'Solo numeros';
        } else
          return null;
      },
      onSaved: (val) {
        pre = val.toString();
      },
    );
  }

  Widget _btnAgregar() {
    return RaisedButton.icon(
      color: Colors.green,
      shape: StadiumBorder(),
      textColor: Colors.white,
      icon: Icon(Icons.assignment),
      onPressed: () {
        _validar();
      },
      label: Text('Agregar'),
    );
  }

  Widget _btnEditar() {
    return RaisedButton.icon(
      color: Colors.green,
      shape: StadiumBorder(),
      textColor: Colors.white,
      icon: Icon(Icons.check),
      onPressed: () {
        _validar();
      },
      label: Text('Editar'),
    );
  }

  void _validar() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (widget.idpro == '') {
        _agregar();

        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Producto registrado"),
                  content: Text(
                      "Dirigirse a mis productos para visualizar sus productos agregados"),
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
      } else {
        _editar();
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Producto modificado"),
                  content: Text("Los datos del producto han sido modificados"),
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
