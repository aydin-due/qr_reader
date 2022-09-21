import 'dart:convert';

class ScanModel {
  ScanModel({
    required this.id,
    required this.tipo,
    required this.value,
  }) {
    if (tipo.contains('http')) {
      tipo = 'http';
    } else {
      tipo = 'geo';
    }
  }

  int id;
  String tipo;
  String value;

  factory ScanModel.fromJson(String str) => ScanModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ScanModel.fromMap(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        value: json["value"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "tipo": tipo,
        "value": value,
      };
}
