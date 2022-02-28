import 'dart:convert';

HistorialModel historialModelFromJson(String str) => HistorialModel.fromJson(json.decode(str));

String HistorialModelToJson(HistorialModel data) => json.encode(data.toJson());

class HistorialModel {
    HistorialModel({
        required this.id,
        required this.nombre,
        required this.apellido,
        required this.producto,
        required this.descripcion,
        required this.fecha,
        required this.cantidad,
        required this.total,
    });

    String id;
    String nombre;
    String apellido;
    String producto;
    String descripcion;
    String fecha;
    String cantidad;
    String total;

    factory HistorialModel.fromJson(Map<String, dynamic> json) => HistorialModel(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        producto: json["producto"],
        descripcion: json["descripcion"],
        fecha: json["fecha"],
        cantidad: json["cantidad"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellido": apellido,
        "producto": producto,
        "descripcion": descripcion,
        "fecha": fecha,
        "cantidad": cantidad,
        "total": total,
    };
}