import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/equipamento_provider.dart';

class LocacaoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int estoqueId = 1; // ID fixo de estoque para exemplo
    final equipamentos = Provider.of<EquipamentoProvider>(context).equipamentosPorEstoque(estoqueId);

    return Scaffold(
      appBar: AppBar(title: Text('Equipamentos Locados')),
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
