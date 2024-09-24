import 'package:flutter/material.dart';
import 'screens/product_screen.dart';
import 'screens/client_products_screen.dart';
import 'screens/borrowed_products_screen.dart';
import 'screens/profile_screen.dart';
import 'providers/product_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: MaterialApp(
        title: 'Gerenciador de Estoque',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    ClientProductsScreen(), // Locadas (antigo Por Cliente)
    ProductScreen(), // Estoque (antigo Produtos)
    BorrowedProductsScreen(), // Homologação (antigo Emprestados)
    ProfileScreen(), // Perfil
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gerenciador de Estoque')),
      body: _pages[_selectedIndex], // Exibe a página selecionada
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[200], // Fundo da barra de navegação
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on), // Ícone de locação
            label: 'Locação', // Substitui 'Por Cliente' por 'Locação'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory), // Ícone de estoque
            label: 'Estoque', // Substitui 'Produtos' por 'Estoque'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_turned_in), // Ícone de homologação
            label: 'Homologação', // Substitui 'Emprestados' por 'Homologação'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), // Ícone de perfil
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(
            0xFF0E6600), // Cor verde personalizada para os itens selecionados
        unselectedItemColor: Colors.grey, // Cor para itens não selecionados
        onTap: _onItemTapped, // Altera a página ao tocar em um item
      ),
    );
  }
}
