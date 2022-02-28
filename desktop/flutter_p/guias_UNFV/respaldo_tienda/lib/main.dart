import 'package:flutter/material.dart';
import 'package:flutter_proyecto_tienda/login.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {'login': (_) => Login()},
    );
  }
}
