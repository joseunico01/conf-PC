/*
  Crearemos una app con 3 Widget Tabs(3 pestañas)
  pestañas: home, video, contact:
  crearenos una carpeta /lib/pages/contact.dart  home.dart  video.dart
*/

import 'package:flutter/material.dart';
import 'package:primer_app01/pages/home.dart';
import 'package:primer_app01/pages/video.dart';
import 'package:primer_app01/pages/contact.dart';

void main() {
  runApp(new MaterialApp(
    home: MyTabs(),
  ));
}

class MyTabs extends StatefulWidget {
  const MyTabs({Key? key}) : super(key: key);

  @override
  _MyTabsState createState() => _MyTabsState();
}

class _MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {
  //SingleTickerProviderStateMixin sirve para hacer animaciones en el controller
  late TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Tenemos q impotar la clase SingleTickerProviderStateMixin
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Video Tabs'),
        backgroundColor: Colors.redAccent,
        //importante tener un controllador para indicar cuantos tabBar tendremos
        bottom: new TabBar(
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.home),
            ),
            new Tab(
              icon: new Icon(Icons.ondemand_video),
            ),
            new Tab(
              icon: new Icon(Icons.contacts),
            ),
          ],
          controller: controller,
        ),
      ),
      body: new TabBarView(
        //Es el contenedor para manegar las paginas de cada pestañas
        children: <Widget>[
          new Home(),
          new Video(),
          new Contact(),
        ],
        controller: controller,
      ),
    );
  }
}
