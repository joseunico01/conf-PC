import 'package:flutter/material.dart';
import 'package:flutter_proyecto_tienda/Usuario/EditarUsuario/Usuario_Editar.dart';
import 'package:flutter_proyecto_tienda/Usuario/EliminarUsuario/Usuario_Eliminar.dart';
import 'package:flutter_proyecto_tienda/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListarUsuarios extends StatefulWidget {
  late String id;
  late String tipo;
  ListarUsuarios({required this.id, required this.tipo});
  @override
  State<ListarUsuarios> createState() => _ListarUsuariosState();
}

class _ListarUsuariosState extends State<ListarUsuarios> {
  late List list;

  final usuariosDelete = new UsuariosDelete();

  Future getUsuarios(String idUsua) async {
    var url = Uri.parse(
        'http://localhost/proyecto_flutter_prueba/CONTROLADOR/UsuarioControlador.php?op=5&idUsuario=$idUsua');
    final response = await http.get(url, headers: {
      "Accept": "application/json",
    });
    return json.decode(response.body);
  }

  Future getAdmin() async {
    var url = Uri.parse(
        'http://localhost/proyecto_flutter_prueba/CONTROLADOR/UsuarioControlador.php?op=8');
    final response = await http.get(url, headers: {
      "Accept": "application/json",
    });
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.tipo == 'Administrador'
            ? 'Lista de Usuarios'
            : 'Mi perfil de usuario'),
      ),
      backgroundColor: Colors.lightGreen[100],
      body: Container(
        color: Colors.lightGreen[100],
        child: FutureBuilder(
          future:
              widget.tipo == 'Cliente' ? getUsuarios(widget.id) : getAdmin(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              print(snapshot.hasError);
            }
            return snapshot.hasData
                ? Scrollbar(
                    child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          list = snapshot.data;

                          String usu = list[index]['Usuario'];
                          String con = list[index]['Contra'];
                          String nam = list[index]['Nombre'];
                          String ape = list[index]['Apellido'];
                          String cor = list[index]['Correo'];
                          String eda = list[index]['Edad'];
                          String est = list[index]['Estatura'];
                          String pes = list[index]['Peso'];

                          return widget.tipo == 'Cliente'
                              ? Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Icon(Icons.account_box, size: 200),
                                    SizedBox(
                                      width: 320.0,
                                      child: ListTile(
                                        title: Text("Usuario: " +
                                            list[index]['Usuario'] +
                                            "\n\nNombre y Apellido:\n" +
                                            list[index]['Nombre'] +
                                            " " +
                                            list[index]['Apellido'] +
                                            "\n"),
                                        subtitle: Text("Correo: " +
                                            list[index]['Correo'] +
                                            "\n\nEdad: " +
                                            list[index]['Edad'] +
                                            " Años - Estatura: " +
                                            list[index]['Estatura'] +
                                            " cm - Peso: " +
                                            list[index]['Peso'] +
                                            " kg\n"),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        IconButton(
                                            icon: Icon(Icons.edit),
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          EditarUsuario(
                                                            id: widget.id,
                                                            usu: usu,
                                                            tipo: widget.tipo,
                                                            nam: nam,
                                                            ape: ape,
                                                            cor: cor,
                                                            eda: eda,
                                                            est: est,
                                                            pes: pes,
                                                          )));
                                            }),
                                        IconButton(
                                            icon: Icon(Icons.delete),
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      AlertDialog(
                                                        title: Text(
                                                            "Eliminar usuario"),
                                                        content: Text(
                                                            "Esta seguro que desea eliminar este usuario"),
                                                        actions: [
                                                          FlatButton(
                                                            child: Text("Si"),
                                                            onPressed: () {
                                                              Navigator.of(context).pushAndRemoveUntil(
                                                                  MaterialPageRoute(builder:
                                                                      (BuildContext
                                                                          context) {
                                                                return new MyApp();
                                                              }),
                                                                  (Route route) =>
                                                                      false);
                                                              setState(() {
                                                                usuariosDelete
                                                                    .eliminarUsuario(
                                                                        widget
                                                                            .id);
                                                              });
                                                            },
                                                          ),
                                                          FlatButton(
                                                            child: Text("No"),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop("No");
                                                            },
                                                          )
                                                        ],
                                                      ));
                                            }),
                                      ],
                                    ),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    SizedBox(
                                        width: widget.id ==
                                                list[index]['idUsuario']
                                            ? 310.0
                                            : 350.0,
                                        child: ListTile(
                                          title: Text("Usuario: " +
                                              list[index]['Usuario'] +
                                              "\nNombre y Apellido: " +
                                              list[index]['Nombre'] +
                                              " " +
                                              list[index]['Apellido']),
                                          subtitle: Text("Correo: " +
                                              list[index]['Correo'] +
                                              "\nEdad: " +
                                              list[index]['Edad'] +
                                              " Años - Estatura: " +
                                              list[index]['Estatura'] +
                                              " cm - Peso: " +
                                              list[index]['Peso']),
                                        )),
                                    widget.id == list[index]['idUsuario']
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              IconButton(
                                                  icon: Icon(Icons.edit),
                                                  onPressed: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (BuildContext
                                                                    context) =>
                                                                EditarUsuario(
                                                                  id: widget.id,
                                                                  usu: usu,
                                                                  tipo: widget
                                                                      .tipo,
                                                                  nam: nam,
                                                                  ape: ape,
                                                                  cor: cor,
                                                                  eda: eda,
                                                                  est: est,
                                                                  pes: pes,
                                                                )));
                                                  }),
                                              IconButton(
                                                  icon: Icon(Icons.delete),
                                                  onPressed: () {
                                                    showDialog(
                                                        context: context,
                                                        builder:
                                                            (context) =>
                                                                AlertDialog(
                                                                  title: Text(
                                                                      "Eliminar usuario"),
                                                                  content: Text(
                                                                      "Esta seguro que desea eliminar este usuario"),
                                                                  actions: [
                                                                    FlatButton(
                                                                      child: Text(
                                                                          "Si"),
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:
                                                                            (BuildContext
                                                                                context) {
                                                                          return new MyApp();
                                                                        }), (Route route) => false);
                                                                        setState(
                                                                            () {
                                                                          usuariosDelete
                                                                              .eliminarUsuario(widget.id);
                                                                        });
                                                                      },
                                                                    ),
                                                                    FlatButton(
                                                                      child: Text(
                                                                          "No"),
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(context)
                                                                            .pop("No");
                                                                      },
                                                                    )
                                                                  ],
                                                                ));
                                                  }),
                                            ],
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                                IconButton(
                                                    icon: Icon(
                                                        Icons.account_circle),
                                                    onPressed: () {}),
                                              ]),
                                  ],
                                );
                        }))
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}

