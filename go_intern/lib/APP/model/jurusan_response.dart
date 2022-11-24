// To parse this JSON data, do
//
//     final Jurusan = JurusanFromJson(jsonString);

import 'dart:convert';

Jurusan JurusanFromJson(String str) => Jurusan.fromJson(json.decode(str));

String JurusanToJson(Jurusan data) => json.encode(data.toJson());

class Jurusan {
    Jurusan({
      required  this.status,
      required  this.body,
    });

    String status;
    List<DataJurusan> body;

    factory Jurusan.fromJson(Map<String, dynamic> json) => Jurusan(
        status: json["status"],
        body: List<DataJurusan>.from(json["body"].map((x) => DataJurusan.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "body": List<dynamic>.from(body.map((x) => x.toJson())),
    };
}

class DataJurusan {
    DataJurusan({
      required  this.id,
      required  this.jurusan,
    });

    int id;
    String jurusan;

    factory DataJurusan.fromJson(Map<String, dynamic> json) => DataJurusan(
        id: json["id"],
        jurusan: json["jurusan"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "jurusan": jurusan,
    };
}
