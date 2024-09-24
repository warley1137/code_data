import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Perfil')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome: Usuário Exemplo', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Email: usuario@exemplo.com', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Telefone: (00) 0000-0000', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
