import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_proyecto_tienda/Firebase/Tienda/Tienda_models.dart';

class Tienda {
  final String _url =
      "https://flutter-proyecto-tienda-default-rtdb.firebaseio.com/";

  Future<List<TiendaModel>> ListarTienda() async {
    final url = '$_url/tienda.json';
    final respuesta = await http.get(Uri.parse(url));
    final Map<String, dynamic> decodeData = json.decode(respuesta.body);
    final List<TiendaModel> tienda = [];

    if (decodeData == null) return [];
    decodeData.forEach((id, cue) {
      final prodTemp = TiendaModel.fromJson(cue);
      prodTemp.id = id;

      tienda.add(prodTemp);
    });

    return tienda;
  }

  Future<bool> AgregarTienda(TiendaModel tienda) async {
    try {
      String url = '$_url/tienda.json';
      final respuesta =
          await http.post(Uri.parse(url), body: json.encode(tienda));
      final decodeData = json.decode(respuesta.body);
      if (respuesta.statusCode == 200) {
        print(respuesta.statusCode);
      }
    } catch (e) {}

    return true;
  }

  Future<bool> EditarTienda(TiendaModel tienda) async {
    try {
      String url = '$_url/tienda/${tienda.id}.json';
      final respuesta =
          await http.put(Uri.parse(url), body: TiendaModelToJson(tienda));
      final decodeData = json.decode(respuesta.body);
      if (respuesta.statusCode == 200) {
        print(respuesta.statusCode);
      }
    } catch (e) {}
    return true;
  }

  Future<int> EliminarTienda(String id) async {
    try {
      final url = "$_url/tienda/$id.json";
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
