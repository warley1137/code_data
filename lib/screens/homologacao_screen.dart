import 'package:flutter/material.dart';
import '../models/equipamento.dart';
import '../services/api_service.dart';

class HomologacaoScreen extends StatefulWidget {
  @override
  _HomologacaoScreenState createState() => _HomologacaoScreenState();
}

class _HomologacaoScreenState extends State<HomologacaoScreen> {
  List<Equipamento> equipamentos = [];

  Future<void> buscarEquipamentosParaHomologacao() async {
    List<Equipamento> lista = await ApiService().fetchEquipamentos();
    setState(() {
      equipamentos = lista.where((equipamento) => !equipamento.condicao).toList(); // Equipamentos que não estão em bom estado
    });
  }

  @override
  void initState() {
    super.initState();
    buscarEquipamentosParaHomologacao();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Equipamentos para Homologação'),
        backgroundColor: Color(0xFF0E6600), // Cor verde
      ),
      body: equipamentos.isEmpty
          ? Center(
              child: Text(
                'Nenhum equipamento disponível para homologação.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: equipamentos.length,
              itemBuilder: (ctx, i) {
                return ListTile(
                  title: Text(equipamentos[i].modelo ?? 'Modelo não disponível'),
                  subtitle: Text('Serial: ${equipamentos[i].serialNumber ?? 'Serial não disponível'}'),
                );
              },
            ),
    );
  }
}
