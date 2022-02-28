/*
  Crearemos una alert en mi app
  Mostramos una alerta simple y el mensaje lo estamos mandando desde nuestra misma aplicacion, desde adentro

*/
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: MyDialog(),
  ));
}

class MyDialog extends StatefulWidget {
  const MyDialog({Key? key}) : super(key: key);

  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  void _showAlert(String value) {
    //Este metodo es privado y solo esat al alcance de esta clase
    AlertDialog dialog = new AlertDialog(
      content: new Text('Hola'),
    );
    showDialog(context: context, builder: (context) => dialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Demo Alert Dialog'),
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              new TextField(
                decoration: new InputDecoration(hintText: 'Ingrese el texto'),
              ),
              new RaisedButton(
                child: new Text('Ver alerta'),
                onPressed: () {
                  _showAlert('Hola');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
