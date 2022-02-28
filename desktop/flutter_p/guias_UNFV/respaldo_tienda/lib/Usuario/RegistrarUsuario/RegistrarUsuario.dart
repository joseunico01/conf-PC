import 'dart:convert';
import 'package:http/http.dart' as http;

class UsuarioNew {
  final String _url =
      "http://localhost/proyecto_flutter_prueba/CONTROLADOR/UsuarioControlador.php";
  Future<bool> agregarUsuario(
      String usuario,
      String contra,
      String nombre,
      String apellido,
      String correo,
      String edad,
      String estatura,
      String peso) async {
    try {
      final url = Uri.parse(
          '$_url/?op=1&Usuario=$usuario&Contraseña=$contra&Nombre=$nombre&Apellido=$apellido&Correo=$correo&Edad=$edad&Estatura=$estatura&Peso=$peso');
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
}

