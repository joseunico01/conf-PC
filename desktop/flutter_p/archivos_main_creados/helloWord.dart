/*

Esta aplicacion muestra un imple encabezado con mi 'Mi Primera aplicacion'
tambien muestra un texto hello word centrado en mi app

*/
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
      title: 'Mi primera aplicacion',
      home: new Scaffold(
        //forma un esquema para poder mostrarlo en la app
        appBar: new AppBar(title: new Text('Mi Primera aplicacion')),
        body: new Container(
          child: new Center(child: new Text('Hellos Wold')),
        ),
      )));
}
