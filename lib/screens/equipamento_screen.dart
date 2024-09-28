import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/equipamento_provider.dart';

class EquipamentoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final equipamentos = Provider.of<EquipamentoProvider>(context).equipamentos;

    return Scaffold(
      appBar: AppBar(title: Text('Estoque de Equipamentos')),
      body: ListView.builder(
        itemCount: equipamentos.length,
        itemBuilder: (ctx, i) {
          return ListTile(
            title: Text(equipamentos[i].modelo),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Código: ${equipamentos[i].codigo}'),
                Text('Marca: ${equipamentos[i].marca}'),
                Text('Serial: ${equipamentos[i].serialNumber}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
