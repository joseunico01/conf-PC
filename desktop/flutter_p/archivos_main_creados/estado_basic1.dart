/*
Crearemos un aplicacion con un un boton q al hacerle clic cambie de estado
y asi pueda mostrarme otro mensaje por cada click q se realice
*/

import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: MyButton(),
  ));
}

class MyButton extends StatefulWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  String flutterText = '';
  int index = 0;
  List<String> collections = ['flutter', 'es', 'genial'];

  void onPresessButton() {
    setState(() {
      //indicaremos q este texto se actualiza
      flutterText = collections[index];
      index = index < 2 ? index + 1 : 0;
/*
   //forma completa del if, arriba la forma simple
      if (index < 2) {
        index = index + 1;
      } else {
        index = 0;
      }
*/
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Mi primera aplicacion'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: new Container(
          child: new Center(
        //centra para siempre
        child: new Column(
          mainAxisAlignment:
              MainAxisAlignment.center, //para centrar el contenido en le body
          children: <Widget>[
            new Text(flutterText, style: new TextStyle(fontSize: 40.0)),
            new Padding(padding: new EdgeInsets.all(10.0)),
            new RaisedButton(
              child: new Text('Actualizar',
                  style: new TextStyle(color: Colors.white)),
              color: Colors.blueAccent,
              onPressed: onPresessButton,
            )
          ],
        ),
      )),
    );
  }
}
