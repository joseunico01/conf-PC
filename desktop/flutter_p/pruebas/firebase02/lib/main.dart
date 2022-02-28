import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase02/screens/login/edit_number.dart';
import 'package:firebase02/screens/login/hello.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase02/screens/calls.dart';
import 'package:firebase02/screens/chats.dart';
import 'package:firebase02/screens/people.dart';
import 'package:firebase02/screens/settings.dart';
import 'package:firebase_core/firebase_core.dart';

const bool USE_EMULATOR = true;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //importamos firebase_core.dart
  await Firebase.initializeApp();
  if (USE_EMULATOR) {
    _connectToFirebaseEmulator();
  }
  runApp(const MyApp());
}

Future _connectToFirebaseEmulator() async {
  final fireStorePort = "8080";
  final authPort = "9099";

  //importamos dart.io
  final localHost = Platform.isAndroid ? '10.0.2.2' : 'localHost';
  FirebaseFirestore.instance.settings = Settings(
      host: "$localHost: $fireStorePort",
      sslEnabled: false,
      persistenceEnabled: false);
  await FirebaseAuth.instance.useEmulator('http://$localHost:$authPort');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      //La direccion de nuestras paginas //HomePage //Hello
      home: HomePage(),
      theme: CupertinoThemeData(
          brightness: Brightness.light, primaryColor: Color(0xFF08C187)),
      //brightness: Brightness.dark, primaryColor: Color(0xFF08C187)),
    );
  }
}

class HomePage extends StatelessWidget {
  //Importar las classes
  var screens = [Chats(), Calls(), People(), SettingsScreens()];
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoTabScaffold(
        resizeToAvoidBottomInset: true,
        tabBar: CupertinoTabBar(items: [
          BottomNavigationBarItem(
              label: 'Chats', icon: Icon(CupertinoIcons.chat_bubble_2_fill)),
          BottomNavigationBarItem(
              label: 'Grupos', icon: Icon(CupertinoIcons.grid)),
          BottomNavigationBarItem(
              label: 'Datos', icon: Icon(CupertinoIcons.person_alt_circle)),
          BottomNavigationBarItem(
              label: 'Ajustes', icon: Icon(CupertinoIcons.settings)),
        ]),
        tabBuilder: (BuildContext context, int index) {
          return screens[index];

          /*
              Container(
              child: Center(
            child: Text('$index'),
          ));
          */
        },
      ),
    );
  }
}
