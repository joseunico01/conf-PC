import 'package:flutter/material.dart';
import 'package:flutter_proyecto_tienda/Firebase/Historial/Clase_historial.dart';
import 'package:flutter_proyecto_tienda/Firebase/Historial/Historial_models.dart';
import 'package:flutter_proyecto_tienda/Reserva/EditarReserva/Reserva_editar.dart';
import 'package:flutter_proyecto_tienda/Reserva/EliminarReserva/Reserva_Eliminar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListarReservas extends StatefulWidget {
  late String id;
  late String usua;
  late String tipo;
  ListarReservas({required this.id, required this.usua, required this.tipo});
  @override
  State<ListarReservas> createState() => _ListarReservasState();
}

class _ListarReservasState extends State<ListarReservas> {
  late List list;

  final reservasDelete = new ReservasDelete();

  final txtbusca = TextEditingController();

  Future getReservas(String idUsua, busca) async {
    var url = Uri.parse(
        'http://localhost/proyecto_flutter_prueba/CONTROLADOR/ReservaControlador.php?op=2&idUsuario=$idUsua&busca=$busca');
    final response = await http.get(url, headers: {
      "Accept": "application/json",
    });
    return json.decode(response.body);
  }

  Future getReservasUsuarios(busca) async {
    var url = Uri.parse(
        'http://localhost/proyecto_flutter_prueba/CONTROLADOR/ReservaControlador.php?op=5&busca=$busca');
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
        title: Text('Lista de reservas'),
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
                    widget.tipo == 'Cliente'
                        ? getReservas(widget.id, txtbusca.text)
                        : getReservasUsuarios(txtbusca.text);
                  });
                },
              ),
              border: OutlineInputBorder(),
              hintText: 'Buscar reserva',
            ),
          ),
          FutureBuilder(
            future: widget.tipo == 'Cliente'
                ? getReservas(widget.id, txtbusca.text)
                : getReservasUsuarios(txtbusca.text),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                print(snapshot.hasError);
                if (snapshot.data.length == 0) {
                  return Text('\nNo existe la reserva');
                }
              }
              return snapshot.hasData
                  ? Scrollbar(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            list = snapshot.data;

                            String idres = '',
                                canti = '',
                                sto = '',
                                preci = '',
                                fech = '';

                            if (widget.tipo == 'Cliente') {
                              idres = list[index]['idReserva'];
                              canti = list[index]['Cantidad'];
                              sto = list[index]['Stock'];
                              preci = list[index]['Precio'];
                              fech = list[index]['Fecha'];
                            }

                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                SizedBox(
                                    width: 300.0,
                                    child: widget.tipo == 'Cliente'
                                        ? ListTile(
                                            title: Text("Producto: " +
                                                list[index]['Producto'] +
                                                " / " +
                                                list[index]['Descripcion']),
                                            subtitle: Text("Fecha Reserva: " +
                                                list[index]['Fecha'] +
                                                " / Cantidad: " +
                                                list[index]['Cantidad'] +
                                                "\nPrecio Total: S/" +
                                                list[index]['Total']),
                                          )
                                        : ListTile(
                                            title: Text("Usuario: " +
                                                list[index]['Nombre'] +
                                                " " +
                                                list[index]['Apellido'] +
                                                "\nProducto: " +
                                                list[index]['Producto'] +
                                                " / " +
                                                list[index]['Descripcion']),
                                            subtitle: Text("Fecha Reserva: " +
                                                list[index]['Fecha'] +
                                                " / Cantidad: " +
                                                list[index]['Cantidad'] +
                                                "\nPrecio Total: S/" +
                                                list[index]['Total']),
                                          )),
                                widget.tipo == 'Cliente'
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                            IconButton(
                                                icon: Icon(Icons.edit),
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              EditarReserva(
                                                                id: idres,
                                                                idusua:
                                                                    widget.id,
                                                                usua:
                                                                    widget.usua,
                                                                tipo:
                                                                    widget.tipo,
                                                                can: canti,
                                                                fec: fech,
                                                                sto: sto,
                                                                preci: preci,
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
                                                                "Eliminar reserva"),
                                                            content: Text(
                                                                "Esta seguro que desea eliminar esta reserva"),
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
                                                                    reservasDelete
                                                                        .eliminarReserva(
                                                                            idres);
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
                                                })
                                          ])
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          IconButton(
                                              icon: Icon(Icons.history),
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        AlertDialog(
                                                          title: Text(
                                                              "Enviar reserva al historial"),
                                                          content: Text(
                                                              "Esta seguro que desea eliminar esta reserva y enviar al historial de reservas"),
                                                          actions: [
                                                            FlatButton(
                                                              child: Text("Si"),
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop("Si");
                                                                setState(() {
                                                                  HistorialModel historial = new HistorialModel(
                                                                      id: '',
                                                                      nombre:
                                                                          '',
                                                                      apellido:
                                                                          '',
                                                                      producto:
                                                                          '',
                                                                      descripcion:
                                                                          '',
                                                                      fecha: '',
                                                                      cantidad:
                                                                          '',
                                                                      total:
                                                                          '');

                                                                  final objhistorial =
                                                                      new Historial();

                                                                  historial
                                                                      .id = list[
                                                                          index]
                                                                      [
                                                                      'idUsuario'];
                                                                  historial
                                                                      .nombre = list[
                                                                          index]
                                                                      [
                                                                      'Nombre'];
                                                                  historial
                                                                      .apellido = list[
                                                                          index]
                                                                      [
                                                                      'Apellido'];
                                                                  historial
                                                                      .producto = list[
                                                                          index]
                                                                      [
                                                                      'Producto'];
                                                                  historial
                                                                      .descripcion = list[
                                                                          index]
                                                                      [
                                                                      'Descripcion'];
                                                                  historial
                                                                      .fecha = list[
                                                                          index]
                                                                      ['Fecha'];
                                                                  historial
                                                                      .cantidad = list[
                                                                          index]
                                                                      [
                                                                      'Cantidad'];
                                                                  historial
                                                                      .total = list[
                                                                          index]
                                                                      ['Total'];

                                                                  objhistorial
                                                                      .AgregarHistorial(
                                                                          historial);

                                                                  idres = list[
                                                                          index]
                                                                      [
                                                                      'idReserva'];
                                                                  reservasDelete
                                                                      .eliminarReserva(
                                                                          idres);
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
                                              })
                                        ],
                                      ),
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

