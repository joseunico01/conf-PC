import 'package:flutter/material.dart';
import 'package:lab4_unfv/src/models/producto_models.dart';
import 'package:lab4_unfv/src/utils/utils.dart' as utils;

class ProductoPage extends StatefulWidget {
  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formkey = GlobalKey<FormState>();
  ProductoModel producto = new ProductoModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Producto'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formkey,
            child: Column(
              children: <Widget>[
                _crearNombre(),
                _crearPrecio(),
                _crearBoton(),
                _crearDisponible(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _crearNombre() {
    return TextFormField(
        initialValue: producto.titulo,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(labelText: 'Nombre'),
        onSaved: (value) => producto.titulo = value,
        validator: (value) {
          //if (value.length < 3) { //es del lab
          /*Es mi solucion
          final myList = [0, 1, 2, 3];
          for (var number in myList) {
            if (value == number) {
              return 'ingrese el nombre del producto';
            } else {
              return null;
            }
          }*/
          if (value.toString().length < 3) {
            return 'Ingrese el nombre del producto';
          } else {
            return null;
          }
        });
  }

  _crearPrecio() {
    return TextFormField(
      initialValue: producto.valor.toString(),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Precio'),
      //onSaved: (value) => producto.valor = double.parse(value),
      onSaved: (value) => producto.valor = double.parse(value.toString()),
      validator: (value) {
        if (utils.isNumeric(value)) {
          return null;
        } else {
          return 'Solo numeros';
        }
      },
    );
  }

  _crearDisponible() {
    return SwitchListTile(
      //Tiene q ser un tipo bool
      value: producto.disponible == true,
      title: Text('Disponible'),
      activeColor: Colors.deepPurple,
      onChanged: (value) => setState(() {
        producto.disponible = value;
      }),
    );
  }

  _crearBoton() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Colors.deepPurple,
      textColor: Colors.white,
      label: Text('Guardar'),
      icon: Icon(Icons.save),
      onPressed: _submit,
    );
  }

  void _submit() {
    //if (!formkey.currentState.validate()) return;
    //formkey.currentState.save();
    //validator:
    (formkey) {
      if (!formkey.currentState.validate()) {
        formkey.currentState.save();
        print(producto.titulo);
        print(producto.valor);
        print(producto.disponible);
      }
    };
  }
}
