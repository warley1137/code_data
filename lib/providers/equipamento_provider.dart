import 'package:flutter/material.dart';
import '../models/equipamento.dart';
import '../services/api_service.dart';

class EquipamentoProvider with ChangeNotifier {
  List<Equipamento> _equipamentos = [];
  final ApiService apiService = ApiService(); // Adiciona o serviço da API

  List<Equipamento> get equipamentos => _equipamentos;

  Future<void> carregarEquipamentos() async {
    try {
      _equipamentos = await apiService.fetchEquipamentos();
      notifyListeners(); // Notifica os listeners sobre a mudança
    } catch (error) {
      // Lidar com erros, se necessário
      print("Erro ao carregar equipamentos: $error");
    }
  }

  void adicionarEquipamento(Equipamento equipamento) {
    _equipamentos.add(equipamento);
    notifyListeners();
  }

  List<Equipamento> equipamentosPorEstoque(int estoqueId) {
    return _equipamentos.where((eqp) => eqp.estoqueId == estoqueId).toList();
  }

  Equipamento? buscarEquipamentoPorId(String id) {
    try {
      return _equipamentos.firstWhere((eqp) => eqp.id.toString() == id);
    } catch (e) {
      return null;
    }
  }
}
