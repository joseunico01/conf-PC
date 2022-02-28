/*
  Crearemos una alert en mi app
  Mostramos una alert con 2 opciones si-no,
  ejem: y al hacer click en el boton de si, se mostrara en el cmd q elegimos si, y asi con el boton de no

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

enum DialogAction { yes, no }

class _MyDialogState extends State<MyDialog> {
  String _inputValue = '';

  void _alertResult(DialogAction action) {
    print('Tu seleccion es $action');
  }

  void _showAlert(String value) {
    //Este metodo es privado y solo esat al alcance de esta clase
    AlertDialog dialog = new AlertDialog(
      content: new Text(value),
      //A partir de aca mostraremos los botonos de nuestro alert si-no
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            _alertResult(DialogAction.yes);
          },
          child: new Text('Si'),
        ),
        new FlatButton(
          onPressed: () {
            _alertResult(DialogAction.no);
          },
          child: new Text('No'),
        ),
      ],
    );

    showDialog(context: context, builder: (context) => dialog);
  }

  void _onChanged(String value) {
    setState(() {
      _inputValue = value;
    });
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
                onChanged: (String value) {
                  _onChanged(value);
                },
              ),
              new RaisedButton(
                child: new Text('Ver alerta'),
                onPressed: () {
                  _showAlert(_inputValue);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
//Nos quedamos en el video 44,  0min
