import 'package:flutter/material.dart';
import 'package:http/http.dart'as http; 
import 'dart:convert';

import 'package:flutter_proyecto_tienda/Firebase/Historial/Clase_historial.dart';
import 'package:flutter_proyecto_tienda/Firebase/Historial/Historial_models.dart';

class ListarHistorial extends StatefulWidget{
  late String id;
  late String tipo;
  @override
  ListarHistorial({required this.id,required this.tipo});
  State<ListarHistorial> createState() => _ListarHistorialState();
}

class _ListarHistorialState extends State<ListarHistorial>{

   Historial objHistorial=new Historial();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Historial de Reservas'),
        ),
      backgroundColor: Colors.lightGreen[100],
        body:
        Container(
        color: Colors.lightGreen[100],
          child: SingleChildScrollView(
          child: Column(children: [
         FutureBuilder(
      future: objHistorial.ListarHistorial(),
      builder: (BuildContext context, AsyncSnapshot<List<HistorialModel>> snapshot){
        if(snapshot.hasData){
          final reservas=snapshot.data;
          return ListView.builder(
            shrinkWrap:true,
            itemBuilder: (context,i)=>_crearItem(context,reservas![i]),
            itemCount: reservas!.length,
            );
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }
    )]))),
    );
  }

  _crearItem(BuildContext context,HistorialModel reserva){
    return Column(
      children: <Widget>[
        SizedBox(
        width: 320.0,
        child: 
        widget.tipo=='Administrador'?
        ListTile(
        title: Text('Nombre: ${reserva.nombre} ${reserva.apellido}\nProducto: ${reserva.producto} / ${reserva.descripcion}'),
        subtitle: Text('Fecha:  ${reserva.fecha} - Cantidad: ${reserva.cantidad} - Total: ${reserva.total}'),)
        : widget.id==reserva.id?
        ListTile(
          title: Text('Nombre: ${reserva.nombre} ${reserva.apellido}\nProducto: ${reserva.producto} / ${reserva.descripcion}'),
          subtitle: Text('Fecha:  ${reserva.fecha} - Cantidad: ${reserva.cantidad} - Total: ${reserva.total}'),)
          :
          Column()
        )
      ]
    );
  }
}