// To parse this JSON data, do
//
//     final Kategori = welcomeFromJson(jsonString);

import 'dart:convert';

Kategori welcomeFromJson(String str) => Kategori.fromJson(json.decode(str));

String welcomeToJson(Kategori data) => json.encode(data.toJson());

class Kategori {
  Kategori({
    required this.status,
    required this.body,
  });

  String status;
  List<KategoriBody> body;

  factory Kategori.fromJson(Map<String, dynamic> json) => Kategori(
        status: json["status"],
        body: List<KategoriBody>.from(
            json["body"].map((x) => KategoriBody.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "body": List<dynamic>.from(body.map((x) => x.toJson())),
      };
}

class KategoriBody {
  KategoriBody({
    required this.id,
    required this.kategori,
    required this.foto
  });

  int id;
  String kategori;
  String foto;

  factory KategoriBody.fromJson(Map<String, dynamic> json) => KategoriBody(
        id: json["id"],
        kategori: json["kategori"],
        foto: json['foto']
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kategori": kategori,
      };
}
