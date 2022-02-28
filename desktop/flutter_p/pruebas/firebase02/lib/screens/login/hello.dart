import 'dart:ui';

import 'package:firebase02/components/blur_image_page_scaffold.dart';
import 'package:firebase02/components/lets_start.dart';
import 'package:firebase02/components/logo.dart';
import 'package:firebase02/components/terms_and_conditions.dart';
import 'package:flutter/material.dart';

class Hello extends StatelessWidget {
  const Hello({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlueImagePageScaffold(imagePath: 'images/bg.jpg', body: [
      Logo(
        height: 150,
        radius: 50,
        width: 150,
      ),
      Text('Hello',
          style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 60)),
      Column(
        children: [
          Text('Lee atentamente las condicions',
              style: TextStyle(
                  color: Colors.white.withOpacity(0.7), fontSize: 20)),
          Text('Para el uso de la app',
              style: TextStyle(
                  color: Colors.white.withOpacity(0.7), fontSize: 20)),
          Text('sin limitaciones ',
              style: TextStyle(
                  color: Colors.white.withOpacity(0.7), fontSize: 20)),
        ],
      ),
      TermAndConditions(
        onPressed: () {},
      ),
      LetsStart(
        onPressed: () {},
      )
    ]);
  }
}
