/*
  Tema: SnackBar; son como pestañas emergentes q se muestran despues de hacer una accion
  Crearemos una App para poder mostrar un scnbar por 5 seg, y dentro del 
  snackbar mostrar un botom para mostrar de nuesvo un snackbar
*/
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: MySnackBack(),
  ));
}

class MySnackBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('SnackBar Demo'),
      ),
      body: new Center(
        child: new MyBottom(),
      ),
    );
  }
}

class MyBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      child: new Text('Despelgar Snackbar'),
      onPressed: () {
        //.showSnackBar nos mostrara algo
        Scaffold.of(context).showSnackBar(new SnackBar(
          content: new Text('Hola soy un snackbar '),
          duration: new Duration(seconds: 5),
          action: new SnackBarAction(
            label: 'click Aqui',
            onPressed: () {
              Scaffold.of(context).showSnackBar(
                  new SnackBar(content: new Text('Hola nuevamente')));
            },
          ),
        ));
      },
    );
  }
}
