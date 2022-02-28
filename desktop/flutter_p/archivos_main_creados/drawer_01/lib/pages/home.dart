import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Drawer _getDrawer(BuildContext context) {
    //titulo de nuestro drawer
    var header = new DrawerHeader(child: new Text('Ajustes'));
    //Informacion de drawer-app
    var info = new AboutListTile(
      child: new Text('Informacion App'),
      applicationVersion: 'v1.0.0',
      applicationName: "Demo drawer",
      applicationIcon: new Icon(Icons.info),
      icon: new Icon(Icons.info),
    );
    //resumimos la lista q aparecera en nuestro body de drawe
    ListTile _getItem(Icon icon, String descripcion, String route) {
      return new ListTile(
          leading: icon,
          title: new Text(descripcion),
          onTap: () {
            setState(() {
              Navigator.of(context).pushNamed(route);
            });
          });
    }

    ListView listView = new ListView(children: <Widget>[
      /*Aca va el return list de abajo*/
      header,
      _getItem(new Icon(Icons.settings), 'Descripcion', '/configuracion'),
      _getItem(new Icon(Icons.home), 'Pagina Principal', '/'),
      _getItem(new Icon(Icons.battery_charging_full), 'Bateria', '/bateria'),
      info,
    ]);
    return new Drawer(
      child: listView,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Demo Menu'),
      ),
      //Crea un menu en la parte derecha de nuestra aplicacion
      drawer: _getDrawer(context),
    );
  }
}
//Me quede en el video 51, 2min

      /*
    return new ListTile(
  ListView listView = new ListView(
      new ListTile(
        leading: new Icon(Icons.settings),
        title: new Text('Configuracion'),
      ),
      new ListTile(....),new ListTile(....),etc
      )
      */
