import 'package:flutter/material.dart';
import 'product_screen.dart';
import 'client_products_screen.dart';
import 'borrowed_products_screen.dart';
import 'profile_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gerenciador de Estoque')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Produtos'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => ProductScreen(),
              ));
            },
          ),
          ListTile(
            title: Text('Produtos por Cliente'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => ClientProductsScreen(),
              ));
            },
          ),
          ListTile(
            title: Text('Produtos Emprestados'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => BorrowedProductsScreen(),
              ));
            },
          ),
          ListTile(
            title: Text('Perfil'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => ProfileScreen(),
              ));
            },
          ),
        ],
      ),
    );
  }
}
