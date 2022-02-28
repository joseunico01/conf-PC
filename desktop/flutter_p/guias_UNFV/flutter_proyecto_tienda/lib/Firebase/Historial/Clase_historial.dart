import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_proyecto_tienda/Firebase/Historial/Historial_models.dart';

class Historial {
  final String _url =
      "https://flutter-proyecto-tienda-default-rtdb.firebaseio.com/";

  Future<List<HistorialModel>> ListarHistorial() async {
    final url = '$_url/reservas.json';
    final respuesta = await http.get(Uri.parse(url));
    final Map<String, dynamic> decodeData = json.decode(respuesta.body);
    final List<HistorialModel> reservas = [];

    if (decodeData == null) return [];
    decodeData.forEach((id, cue) {
      final prodTemp = HistorialModel.fromJson(cue);
      //prodTemp.id=id;

      reservas.add(prodTemp);
    });

    return reservas;
  }

  Future<bool> AgregarHistorial(HistorialModel reserva) async {
    try {
      String url = '$_url/reservas.json';
      final respuesta =
          await http.post(Uri.parse(url), body: json.encode(reserva));
      final decodeData = json.decode(respuesta.body);
      if (respuesta.statusCode == 200) {
        print(respuesta.statusCode);
      }
    } catch (e) {}

    return true;
  }

  Future<bool> EditarHistorial(HistorialModel reserva) async {
    try {
      String url = '$_url/reservas/${reserva.id}.json';
      final respuesta =
          await http.put(Uri.parse(url), body: HistorialModelToJson(reserva));
      final decodeData = json.decode(respuesta.body);
      if (respuesta.statusCode == 200) {
        print(respuesta.statusCode);
      }
    } catch (e) {}
    return true;
  }

  Future<int> EliminarHistorial(String id) async {
    try {
      final url = "$_url/reservas/$id.json";
      final resp = await http.delete(Uri.parse(url));
      final decodeData = json.decode(resp.body);
      print(decodeData);
      print(url);

      if (resp.statusCode == 200) {
        print(resp.statusCode);
      }
    } catch (e) {
      print(e);
    }
    return 1;
  }
}
