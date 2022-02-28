/*
  Tema: ListView

*/
import 'package:flutter/material.dart';
import 'package:snackbar01/model/ContactModel.dart';
import 'package:snackbar01/contact.dart';

void main() {
  runApp(new MaterialApp(
    home: new Scaffold(
      appBar: new AppBar(
        title: new Text('Contactos'),
      ),
      body: new Contact(),
    ),
  ));
}
//En el video 54, 13min:12seg
