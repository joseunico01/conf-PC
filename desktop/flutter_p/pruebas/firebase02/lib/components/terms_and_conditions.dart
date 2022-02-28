import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TermAndConditions extends StatelessWidget {
  const TermAndConditions({Key? key, this.onPressed}) : super(key: key);
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        onPressed: onPressed,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 15),
            child: Text(
              'terminos y Condiciones',
              style: TextStyle(color: Colors.white.withOpacity(0.7)),
            ),
          ),
        ));
  }
}
