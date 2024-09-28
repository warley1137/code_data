import 'package:flutter/material.dart';
import '../models/equipamento.dart';

class EquipamentoProvider with ChangeNotifier {
  List<Equipamento> _equipamentos = [];

  List<Equipamento> get equipamentos => _equipamentos;

  void adicionarEquipamento(Equipamento equipamento) {
    _equipamentos.add(equipamento);
    notifyListeners();
  }

  List<Equipamento> equipamentosPorEstoque(int estoqueId) {
    return _equipamentos.where((eqp) => eqp.estoqueId == estoqueId).toList();
  }

  Equipamento? buscarEquipamentoPorId(String id) {
    try {
      return _equipamentos.firstWhere((eqp) => eqp.id == id);
    } catch (e) {
      return null; // Retorna null se não for encontrado
    }
  }

  // Outros métodos de filtragem se necessário, como para homologação, etc.
}
