class Equipamento {
  String id;
  String codigo;
  String modelo;
  String descricao;
  String marca;
  String serialNumber;
  String partNumber;
  bool condicao;
  int estoqueId;
  int documentoId;
  DateTime dataCadastro;
  DateTime? dataAtualizado;

  Equipamento({
    required this.id,
    required this.codigo,
    required this.modelo,
    required this.descricao,
    required this.marca,
    required this.serialNumber,
    required this.partNumber,
    required this.condicao,
    required this.estoqueId,
    required this.documentoId,
    required this.dataCadastro,
    this.dataAtualizado,
  });
}
