import 'dart:convert';
import 'package:http/http.dart' as http;

class UsuariosDelete {
  final String _url =
      "http://localhost/proyecto_flutter_prueba/CONTROLADOR/UsuarioControlador.php";
  Future<bool> eliminarUsuario(String id) async {
    try {
      final url = Uri.parse('$_url/?op=4&idUsuario=$id');
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

