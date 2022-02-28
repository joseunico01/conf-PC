/*
  Esta aplicacion haremos una aplicacion con un menu correspondiente,
  Una descripcion, pagina principal, bateria,informacion App
  Esta dividida en diferentes pages
*/

import 'package:flutter/material.dart';
import 'package:drawer_01/pages/home.dart';
import 'package:drawer_01/pages/settings.dart';
import 'package:drawer_01/pages/battery.dart';

void main() {
  runApp(new MaterialApp(
    home: Home(),
    //Aca definimos las rutas generales
    routes: <String, WidgetBuilder>{
      Settings.routeName: (BuildContext context) => new Settings(),
      Battery.routeName: (BuildContext context) => new Battery(),
    },
  ));
}
//Acabamos el video nro 51, empezamos el 52 desde inicion
