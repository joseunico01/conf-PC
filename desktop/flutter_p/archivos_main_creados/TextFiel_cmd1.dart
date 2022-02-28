/*

   Tema: Widget TextField
   Crearemos una aplicaion donde ingresaremos un TextField y nos mostrara todos nuestros ingresos

   Aca esta FINALIZADO
   Nos muestra un TextField q se mostrara en pantalla cada vez q dijitamos y tiene un controller para q reinice el text en el imput sin la palabra anterior

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

class _MyTextFieldState extends State<MyTextField> {
  String inputValue = '';

  final TextEditingController controller = new TextEditingController();

  void onSubmitted(String value) {
    setState(() {
      inputValue = inputValue + '\n' + value;
      controller.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Edit text Widget'),
        backgroundColor: Colors.redAccent,
      ),
      body: new Container(
        padding: const EdgeInsets.all(10.0),
        child: new Center(
            child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new TextField(
              decoration:
                  new InputDecoration(hintText: 'Ingrese el text aqui: '),
              onSubmitted: (String value) {
                onSubmitted(value);
              },
              controller: controller,
              //maxLines :2, //Permite decir cuantas lineas deseamos en nuetro input, aca tenemos 2 lineas en 1
            ),
            new Text(inputValue)
          ],
        )),
      ),
    );
  }
}
