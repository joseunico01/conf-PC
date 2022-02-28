import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
          textTheme: CupertinoTextThemeData(
              navLargeTitleTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: CupertinoColors.activeBlue))),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bookmark_solid),
              title: Text('Articles')),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.eye_solid), title: Text('Views')),
        ],
      ),
      tabBuilder: (context, i) {
        return CupertinoTabView(builder: (context) {
          return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: (1 == 0) ? Text('Articles') : Text('View'),
              ),
              child: Center(
                child: CupertinoButton(
                  child: Text('This is tab #$i',
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .navLargeTitleTextStyle),
                  onPressed: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(builder: (context) {
                        return DetailScreen(i == 0 ? 'Articles' : 'Views');
                      }),
                    );
                  },
                ),
              ));
        });
      },
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, this.topic}) : super(key: key);
  final String? topic;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Details'),
      ),
      child: Center(
        child: Text(
          'Details for $topic',
          style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
        ),
      ),
    );
  }
}



/*
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Text(
          'Hello, word!',
          style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
        ),
      ),
    );
  }
}
*/
//Paquete Cupertino de Flutter para desarrolladores de iOS: Flutter In Focus
//9:12min
