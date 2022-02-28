import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key, this.width, this.radius, this.height})
      : super(key: key);
  final width;
  final height;
  final radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          shape: BoxShape.rectangle,
          color: Colors.white.withOpacity(0.8)),
      child: Image(
        image: AssetImage('images/logo_unfv.png'),
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
