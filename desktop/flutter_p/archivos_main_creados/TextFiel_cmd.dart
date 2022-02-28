/*

   Tema: Widget TextField
   Crearemos una aplicaion donde ingresaremos un TextField y nos mostrara todos nuestros ingresos
   Hasta aca lo q escribimos lo mostraremos por pantalla

*/

import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: MyTextField(),
  ));
}

class MyTextField extends StatefulWidget {
  const MyTextField({Key? key}) : super(key: key);

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

void onChanged(String value) {
  print(value);
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Edit text Widget'),
        backgroundColor: Colors.redAccent,
      ),
      body: new Container(
        child: new Center(
            child: new Column(
          children: <Widget>[
            new TextField(
              decoration:
                  new InputDecoration(hintText: 'Ingrese el text aqui: '),
              onSubmitted: (String value) {
                onChanged(value);
              },
            )
          ],
        )),
      ),
    );
  }
}
