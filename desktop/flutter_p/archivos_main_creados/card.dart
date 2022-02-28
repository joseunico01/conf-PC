/*
Aca tenemos un ejercicio con 3 iconos,ocupando todo de manera ancha
Un encabezado: 
-Stateless Widget

En el body hay 3 iconos: 
-I love flutter --icono:corazon
-I like this video--icono: like
-Next video --icono:video

*/
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double iconSize = 40.0;
    final TextStyle textStyle =
        new TextStyle(color: Colors.grey, fontSize: 30.0);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Stateless Widget'),
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment
                .stretch, //Se usa para tomar todo el ancho del body
            children: <Widget>[
              new MyCard(
                  title: new Text(
                    'I love flutter',
                    style: textStyle,
                  ),
                  icon: new Icon(
                    Icons.favorite,
                    size: iconSize,
                    color: Colors.blue,
                  )),
              new MyCard(
                  title: new Text(
                    'I like this video',
                    style: textStyle,
                  ),
                  icon: new Icon(
                    Icons.thumb_up,
                    size: iconSize,
                    color: Colors.brown,
                  )),
              new MyCard(
                  title: new Text(
                    'Next video',
                    style: textStyle,
                  ),
                  icon: new Icon(
                    Icons.queue_play_next,
                    size: iconSize,
                    color: Colors.red,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  final Widget title;
  final Widget icon;

  MyCard({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return new Container(
        //padding: const EdgeInsets.all(bottom: 3.0), //Aca le decimos padding a todos
        padding: const EdgeInsets.only(
            bottom: 3.0), //Padding solo a la parte de abajo
        child: new Card(
            child: new Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[this.title, this.icon],
          ),
        )));
  }
}
