import 'package:flutter/material.dart';
import '../providers/product_provider.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final produtos = Provider.of<ProductProvider>(context).produtos;

    return Scaffold(
      appBar: AppBar(title: Text('Todos os Produtos')),
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
