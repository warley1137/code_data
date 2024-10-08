import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/equipamento.dart'; // Certifique-se de importar o modelo Equipamento

class ApiService {
  final String baseUrl = 'http://10.0.2.2:3000'; // Substitua pelo seu IP ou URL do servidor

  // Método para buscar todos os equipamentos
  Future<List<Equipamento>> fetchEquipamentos() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/equipamentos'));

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse.map((data) => Equipamento.fromJson(data)).toList();
      } else {
        throw Exception('Falha ao carregar equipamentos: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro ao conectar à API: $e');
    }
  }

  // Método para adicionar um novo equipamento
  Future<void> adicionarEquipamento(Equipamento equipamento) async {
    final response = await http.post(
      Uri.parse('$baseUrl/equipamentos'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(equipamento.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Falha ao adicionar equipamento');
    }
  }
}
