import 'dart:convert';

TiendaModel tiendaModelFromJson(String str) =>
    TiendaModel.fromJson(json.decode(str));

String TiendaModelToJson(TiendaModel data) => json.encode(data.toJson());

class TiendaModel {
  TiendaModel({
    required this.id,
    required this.nombre,
    required this.direccion,
    required this.distrito,
    required this.telefono,
    required this.dia,
    required this.hora,
  });

  String id;
  String nombre;
  String direccion;
  String distrito;
  String telefono;
  String dia;
  String hora;

  factory TiendaModel.fromJson(Map<String, dynamic> json) => TiendaModel(
        id: json["id"],
        nombre: json["nombre"],
        direccion: json["direccion"],
        distrito: json["distrito"],
        telefono: json["telefono"],
        dia: json["dia"],
        hora: json["hora"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "direccion": direccion,
        "distrito": distrito,
        "telefono": telefono,
        "dia": dia,
        "hora": hora,
      };
}
