import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:firebase02/components/logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditNumber extends StatefulWidget {
  const EditNumber({Key? key}) : super(key: key);

  @override
  _EditNumberState createState() => _EditNumberState();
}

class _EditNumberState extends State<EditNumber> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Edit Number'),
        previousPageTitle: 'Black',
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Logo(
                width: 80.0,
                height: 80.0,
                radius: 30.0,
              ),
              Text(
                'Verificacion...',
                style: TextStyle(
                    color: Colors.deepOrangeAccent.withOpacity(0.7),
                    fontSize: 30),
              ),
              CupertinoListTile(
                onTap: () {},
                title: Text(
                  'Portugal',
                  style: TextStyle(color: Colors.blueGrey),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
