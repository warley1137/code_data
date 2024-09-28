import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/equipamento_provider.dart';

class EquipamentoScreen extends StatefulWidget {
  @override
  _EquipamentoScreenState createState() => _EquipamentoScreenState();
}

class _EquipamentoScreenState extends State<EquipamentoScreen> {
  String _searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final equipamentos = Provider.of<EquipamentoProvider>(context).equipamentos;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0E6600), // Cor verde
        title: Text(
          'ESTOQUE DE EQUIPAMENTOS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Barra de pesquisa
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value.toLowerCase();
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Pesquisar...',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Color(0xFF0E6600)),
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Container para os equipamentos
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Fundo claro para destacar os equipamentos
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(color: Color(0xFF0E6600), width: 2), // Borda verde
                ),
                padding: const EdgeInsets.all(16.0), // Padding interno do container
                child: ListView.builder(
                  itemCount: equipamentos.length,
                  itemBuilder: (ctx, i) {
                    final equipamento = equipamentos[i];
                    // Filtrando os equipamentos conforme a pesquisa
                    if (_searchQuery.isEmpty || equipamento.modelo.toLowerCase().contains(_searchQuery)) {
                      return Card(
                        elevation: 4,
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              // Ícone representativo
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFE0E0E0), // Cor de fundo cinza claro
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                padding: EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.device_hub, // Ícone representativo
                                  size: 40,
                                  color: Color(0xFF0E6600),
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      equipamento.modelo,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Color(0xFF0E6600),
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text('Código: ${equipamento.codigo}', style: TextStyle(color: Colors.grey[700])),
                                    Text('Marca: ${equipamento.marca}', style: TextStyle(color: Colors.grey[700])),
                                    Text('Serial: ${equipamento.serialNumber}', style: TextStyle(color: Colors.grey[700])),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Container(); // Retorna um container vazio se não corresponder à pesquisa
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
