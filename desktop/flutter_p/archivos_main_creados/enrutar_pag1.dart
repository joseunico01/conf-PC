/*
  crearemos una app donde al hacer clic en un boton nos dirija a otra pantalla,
  y al hacer clic en atras volvamos al inicio
*/
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new First(),
  ));
}

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Primera Pantalla en Screen'),
      ),
      body: new Center(
        child: new RaisedButton(
          child: new Text('Mostar Pantalla'),
          onPressed: () {
            //Nos permitira poner una route: new MaterialPageRoute(builder)...
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new Second()));
          },
        ),
      ),
    );
  }
}

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Segunda Pantalla'),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            //Para tomar el ultimo elemento del State
            Navigator.pop(context);
          },
          child: new Text('Ir atras'),
        ),
      ),
    );
  }
}
