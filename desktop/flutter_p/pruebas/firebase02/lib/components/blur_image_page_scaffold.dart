import 'dart:ui';

import 'package:firebase02/components/lets_start.dart';
import 'package:firebase02/components/logo.dart';
import 'package:firebase02/components/terms_and_conditions.dart';
import 'package:flutter/material.dart';

class BlueImagePageScaffold extends StatelessWidget {
  const BlueImagePageScaffold({Key? key, this.body, this.imagePath})
      : super(key: key);
  final body;
  final imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.fill),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          color: Colors.black.withOpacity(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: body,
          ),
        ),
      ),
    );
  }
}
