import 'package:flutter/material.dart';
import '../providers/product_provider.dart';
import 'package:provider/provider.dart';

class ClientProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Aqui você pode usar um ID de cliente fixo para teste
    final String clienteId = 'cliente_1';
    final produtos = Provider.of<ProductProvider>(context).produtosPorCliente(clienteId);

    return Scaffold(
      appBar: AppBar(title: Text('Produtos por Cliente')),
      body: ListView.builder(
        itemCount: produtos.length,
        itemBuilder: (ctx, i) {
          return ListTile(
            title: Text(produtos[i].nome),
            subtitle: Text('Quantidade: ${produtos[i].quantidade}'),
          );
        },
      ),
    );
  }
}
