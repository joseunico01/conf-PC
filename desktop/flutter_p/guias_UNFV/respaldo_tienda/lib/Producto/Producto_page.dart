import 'package:flutter/material.dart';
import 'package:flutter_proyecto_tienda/Producto/Prod_agre_edit.dart';
import 'package:flutter_proyecto_tienda/Reserva/RegistrarReserva/Reserva_Page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListarProductos extends StatefulWidget {
  late String id;
  late String usua;
  late String tipo;
  ListarProductos({required this.id, required this.usua, required this.tipo});
  @override
  State<ListarProductos> createState() => _ListarProductosState();
}

class _ListarProductosState extends State<ListarProductos> {
  late List list;

  final txtbusca = TextEditingController();

  Future getProductos(busca) async {
    var url = Uri.parse(
        'http://localhost/proyecto_flutter_prueba/CONTROLADOR/ProductoControlador.php?op=2&busca=$busca');
    final response = await http.get(url, headers: {
      "Accept": "application/json",
    });
    return json.decode(response.body);
  }

  final String _url =
      "http://localhost/proyecto_flutter_prueba/CONTROLADOR/ProductoControlador.php";
  Future<bool> eliminarProducto(String id) async {
    try {
      final url = Uri.parse('$_url/?op=4&idProducto=$id');
      final resp = await http.post(url);

      final decodedData = json.decode(resp.body);
      print(decodedData);
      print(url);
      if (resp.statusCode == 200) {
        print(resp.statusCode);
      }
    } catch (e) {
      print(e);
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Lista de productos'),
        actions: widget.tipo == 'Administrador'
            ? [
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext ctx) => Producto(
                            id: widget.id,
                            usua: widget.usua,
                            tipo: widget.tipo,
                            idpro: '',
                            nompro: '',
                            despro: '',
                            stopro: '',
                            prepro: '')));
                  },
                  child: Text('Agregar'),
                  color: Colors.green[300],
                  textColor: Colors.white,
                )
              ]
            : [],
      ),
      backgroundColor: Colors.lightGreen[100],
      body: Container(
        color: Colors.lightGreen[100],
        child: SingleChildScrollView(
            child: Column(children: [
          TextFormField(
            controller: txtbusca,
            decoration: InputDecoration(
              filled: true,
              hintStyle: TextStyle(color: Colors.white),
              fillColor: Colors.green[200],
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  setState(() {
                    getProductos(txtbusca.text);
                  });
                },
              ),
              border: OutlineInputBorder(),
              hintText: 'Buscar producto',
            ),
          ),
          FutureBuilder(
            future: getProductos(txtbusca.text),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                print(snapshot.hasError);
                if (snapshot.data.length == 0) {
                  return Text('\nNo existe el producto');
                }
              }
              return snapshot.hasData
                  ? Scrollbar(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            list = snapshot.data;

                            String idpro = list[index]['ID'];
                            String nompro = list[index]['Producto'];
                            String descr = list[index]['Descripcion'];
                            String preci = list[index]['Precio'];
                            String sto = list[index]['Stock'];

                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                SizedBox(
                                  width: 250.0,
                                  child: ListTile(
                                    title: Text(list[index]['Producto'] +
                                        ' / ' +
                                        list[index]['Descripcion']),
                                    subtitle: Text('Stock: ' +
                                        list[index]['Stock'] +
                                        '\nPrecio: S/' +
                                        list[index]['Precio']),
                                  ),
                                ),
                                widget.tipo == 'Cliente'
                                    ? IconButton(
                                        icon: Icon(Icons.shopping_bag_outlined),
                                        onPressed: () {
                                          if (sto == '0') {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                      title:
                                                          Text("Stock agotado"),
                                                      content: Text(
                                                          "El stock del producto en este momento esta agotado, no se encuentra disponible y no es posible reservar este producto"),
                                                      actions: [
                                                        FlatButton(
                                                          child: Text("Ok"),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop("Ok");
                                                          },
                                                        )
                                                      ],
                                                    ));
                                          } else {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        Reserva(
                                                          id: widget.id,
                                                          usua: widget.usua,
                                                          tipo: widget.tipo,
                                                          sto: sto,
                                                          list: list,
                                                          index: index,
                                                        )));
                                          }
                                        })
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                            IconButton(
                                                icon: Icon(Icons.edit),
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  ctx) =>
                                                              Producto(
                                                                  id: widget.id,
                                                                  usua: widget
                                                                      .usua,
                                                                  tipo: widget
                                                                      .tipo,
                                                                  idpro: idpro,
                                                                  nompro:
                                                                      nompro,
                                                                  despro: descr,
                                                                  stopro: sto,
                                                                  prepro:
                                                                      preci)));
                                                }),
                                            IconButton(
                                                icon: Icon(Icons.delete),
                                                onPressed: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          AlertDialog(
                                                            title: Text(
                                                                "Eliminar producto"),
                                                            content: Text(
                                                                "Esta seguro que desea eliminar este producto"),
                                                            actions: [
                                                              FlatButton(
                                                                child:
                                                                    Text("Si"),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop(
                                                                          "Si");
                                                                  setState(() {
                                                                    eliminarProducto(
                                                                        idpro);
                                                                  });
                                                                },
                                                              ),
                                                              FlatButton(
                                                                child:
                                                                    Text("No"),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop(
                                                                          "No");
                                                                },
                                                              )
                                                            ],
                                                          ));
                                                }),
                                          ])
                              ],
                            );
                          }))
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            },
          )
        ])),
      ),
    );
  }
}

