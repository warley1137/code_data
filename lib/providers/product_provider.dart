import 'package:flutter/material.dart';
import '../models/produto.dart';

class ProductProvider with ChangeNotifier {
  List<Produto> _produtos = [];

  List<Produto> get produtos => _produtos;

  void adicionarProduto(Produto produto) {
    _produtos.add(produto);
    notifyListeners();
  }

  List<Produto> produtosPorCliente(String clienteId) {
    return _produtos.where((prod) => prod.clienteId == clienteId).toList();
  }

  List<Produto> produtosEmprestados() {
    return _produtos.where((prod) => prod.emprestado).toList();
  }

Produto? buscarProdutoPorId(String id) {
  return _produtos.firstWhere(
    (prod) => prod.id == id,
    orElse: () => Produto(id: '', nome: '', preco: 0.0, quantidade: 0), // Retorna um Produto vazio ou lance uma exceção
  );
}

}
