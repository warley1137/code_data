import 'package:flutter/material.dart';
import '../models/equipamento.dart';
import '../services/api_service.dart';

class EquipamentoScreen extends StatefulWidget {
  @override
  _EquipamentoScreenState createState() => _EquipamentoScreenState();
}

class _EquipamentoScreenState extends State<EquipamentoScreen> {
  String _searchQuery = "";
  List<Equipamento> equipamentos = [];
  List<Equipamento> lista = [];

  Future<List<Equipamento>> buscaEquipamentos() async {
    lista = await ApiService().fetchEquipamentos();
    if (lista.length != 0) {
      setState(() {
        equipamentos = lista;
      });
      return equipamentos;
    } else {
      return lista;
    }
  }

  @override
  /// Chama a fun o buscaProdutoras() ao iniciar a tela,
  /// para preencher a lista de produtoras com os dados da API.
    void initState() {
      super.initState();
      //Ao iniciar a tela busca o nome das produtoras
      buscaEquipamentos();
    }

  @override
  Widget build(BuildContext context) {
  //final equipamentos = Provider.of<EquipamentoProvider>(context).equipamentos;
    
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
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Container para os equipamentos
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors
                      .grey[200], // Fundo claro para destacar os equipamentos
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                      color: Color(0xFF0E6600), width: 2), // Borda verde
                ),
                padding:
                    const EdgeInsets.all(16.0), // Padding interno do container
                child: equipamentos.isEmpty
                    ? Center(
                        child: Text(
                          'Nenhum equipamento encontrado.',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 16,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: equipamentos.length,
                        itemBuilder: (ctx, i) {
                          final equipamento = equipamentos[i];

                          // Filtrando os equipamentos conforme a pesquisa
                          if (_searchQuery.isEmpty ||
                              (equipamento.modelo
                                      ?.toLowerCase()
                                      .contains(_searchQuery) ??
                                  false)) {
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
                                        color: Color(
                                            0xFFE0E0E0), // Cor de fundo cinza claro
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      padding: EdgeInsets.all(10.0),
                                      child: Icon(
                                        Icons
                                            .device_hub, // Ícone representativo
                                        size: 40,
                                        color: Color(0xFF0E6600),
                                      ),
                                    ),
                                    SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            equipamento.modelo?.isNotEmpty ==
                                                    true
                                                ? equipamento.modelo!
                                                : 'Modelo não disponível', // Garantindo que seja exibido corretamente
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Color(0xFF0E6600),
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            'Código: ${equipamento.codigo ?? 'Código não disponível'}',
                                            style: TextStyle(
                                                color: Colors.grey[700]),
                                          ),
                                          Text(
                                            'Marca: ${equipamento.marca ?? 'Marca não disponível'}',
                                            style: TextStyle(
                                                color: Colors.grey[700]),
                                          ),
                                          Text(
                                            'Serial: ${equipamento.serialNumber ?? 'Serial não disponível'}',
                                            style: TextStyle(
                                                color: Colors.grey[700]),
                                          ),
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
