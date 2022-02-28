import 'dart:convert';
import 'package:http/http.dart' as http;

class ReservasDelete {
  final String _url =
      "http://localhost/proyecto_flutter_prueba/CONTROLADOR/ReservaControlador.php";
  Future<bool> eliminarReserva(String id) async {
    try {
      final url = Uri.parse('$_url/?op=4&idReserva=$id');
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

