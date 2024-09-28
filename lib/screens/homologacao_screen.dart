import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/equipamento_provider.dart';

class HomologacaoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final equipamentos = Provider.of<EquipamentoProvider>(context)
        .equipamentos
        .where((equipamento) => !equipamento.condicao) // Filtra equipamentos para homologação
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text('Equipamentos para Homologação')),
      body: ListView.builder(
        itemCount: equipamentos.length,
        itemBuilder: (ctx, i) {
          return ListTile(
            title: Text(equipamentos[i].modelo),
            subtitle: Text('Serial: ${equipamentos[i].serialNumber}'),
          );
        },
      ),
    );
  }
}
