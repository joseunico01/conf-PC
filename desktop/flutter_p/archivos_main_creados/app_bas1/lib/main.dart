/*
  crearemos una app con pestañas en la parte inferior
*/

import 'package:flutter/material.dart';
import 'package:app_bas1/pages/first.dart';
import 'package:app_bas1/pages/third.dart';
import 'package:app_bas1/pages/second.dart';

void main() {
  runApp(new MaterialApp(
    home: MyNavigator(),
  ));
}

class MyNavigator extends StatefulWidget {
  const MyNavigator({Key? key}) : super(key: key);

  @override
  _MyNavigatorState createState() => _MyNavigatorState();
}

class _MyNavigatorState extends State<MyNavigator>
    with SingleTickerProviderStateMixin {
  //SingleTickerProviderStateMixin sirve para dar animacion cada vez q nosotros combiemos de pag

  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Demo Navigator Bar'),
      ),
      body: new TabBarView(
        children: <Widget>[new FirstTab(), new SecondTab(), new ThirdTab()],
        controller: controller,
      ),
      bottomNavigationBar: new Material(
        color: Colors.blueAccent,
        child: new TabBar(
          tabs: <Tab>[
            new Tab(
              icon: new Icon(Icons.alarm),
            ),
            new Tab(
              icon: new Icon(Icons.watch_later),
            ),
            new Tab(
              icon: new Icon(Icons.airplanemode_active),
            ),
          ],
          controller: controller,
        ),
      ),
    );
  }
}
//
