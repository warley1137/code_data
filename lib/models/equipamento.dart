class Equipamento {
  int? id;
  String? codigo; // Agora aceita nulo
  String? modelo; // Agora aceita nulo
  String? descricao; // Agora aceita nulo
  String? marca; // Agora aceita nulo
  String? serialNumber; // Agora aceita nulo
  String? partNumber; // Agora aceita nulo
  bool condicao;
  int? estoqueId; // Agora aceita nulo
  int? documentoId; // Agora aceita nulo

  Equipamento({
    this.id,
    this.codigo,
    this.modelo,
    this.descricao,
    this.marca,
    this.serialNumber,
    this.partNumber,
    required this.condicao,
    this.estoqueId,
    this.documentoId,
  });

  factory Equipamento.fromJson(Map<String, dynamic> json) {
    return Equipamento(
      id: json['Id'],
      codigo: json['Codigo'],
      modelo: json['Modelo'],
      descricao: json['Descricao'],
      marca: json['Marca'],
      serialNumber: json['SerialNumber'],
      partNumber: json['PartNumber'],
      condicao: json['Condicao'] == 1,
      estoqueId: json['EstoqueId'],
      documentoId: json['DocumentoId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'codigo': codigo,
      'modelo': modelo,
      'descricao': descricao,
      'marca': marca,
      'serialNumber': serialNumber,
      'partNumber': partNumber,
      'condicao': condicao ? 1 : 0,
      'estoqueId': estoqueId,
      'documentoId': documentoId,
    };
  }
}
