import 'package:flutter/material.dart';
import '../models/equipamento.dart';
import '../services/api_service.dart';

class LocacaoScreen extends StatefulWidget {
  @override
  _LocacaoScreenState createState() => _LocacaoScreenState();
}

class _LocacaoScreenState extends State<LocacaoScreen> {
  List<Equipamento> equipamentos = [];

  Future<void> buscarEquipamentosLocados() async {
    try {
      // Busca todos os equipamentos da API
      List<Equipamento> lista = await ApiService().fetchEquipamentos();

      // Exibe os dados no console para verificar os estoques e outros detalhes
      lista.forEach((equipamento) {
        print('Equipamento: ${equipamento.modelo}, EstoqueId: ${equipamento.estoqueId}');
      });

      setState(() {
        // Aplica o filtro por estoqueId
        equipamentos = lista.where((equipamento) => equipamento.estoqueId == 1).toList();
      });

      if (equipamentos.isEmpty) {
        print('Nenhum equipamento encontrado para o estoqueId = 1');
      }
    } catch (error) {
      print("Erro ao buscar equipamentos: $error");
    }
  }

  @override
  void initState() {
    super.initState();
    // Busca os equipamentos ao inicializar a tela
    buscarEquipamentosLocados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Equipamentos Locados'),
        backgroundColor: Color(0xFF0E6600), // Cor verde
      ),
      body: equipamentos.isEmpty
          ? Center(
              child: Text(
                'Nenhum equipamento locado disponível.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: equipamentos.length,
              itemBuilder: (ctx, i) {
                final equipamento = equipamentos[i];

                return ListTile(
                  title: Text(
                    equipamento.modelo ?? 'Modelo não disponível',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Serial: ${equipamento.serialNumber ?? 'Serial não disponível'}'),
                      Text('Código: ${equipamento.codigo ?? 'Código não disponível'}'),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
