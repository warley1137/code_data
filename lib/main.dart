import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
import 'providers/equipamento_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EquipamentoProvider(),
      child: MaterialApp(
        title: 'Gerenciador de Estoque',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MainScreen(),
      ),
    );
  }
}
