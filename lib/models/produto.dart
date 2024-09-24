class Produto {
  String id;
  String nome;
  double preco;
  int quantidade;
  String? clienteId; // ID do cliente se estiver alocado
  bool emprestado; // Indica se está emprestado

  Produto({
    required this.id,
    required this.nome,
    required this.preco,
    required this.quantidade,
    this.clienteId,
    this.emprestado = false,
  });
}
