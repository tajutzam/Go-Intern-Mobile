// To parse this JSON data, do
//
//     final MagangPenyedia = welcomeFromJson(jsonString);

import 'dart:convert';

MagangPenyedia welcomeFromJson(String str) =>
    MagangPenyedia.fromJson(json.decode(str));

String welcomeToJson(MagangPenyedia data) => json.encode(data.toJson());

class MagangPenyedia {
  MagangPenyedia({
    required this.status,
    required this.message,
    required this.body,
  });

  String status;
  String message;
  List<Body> body;

  factory MagangPenyedia.fromJson(Map<String, dynamic> json) => MagangPenyedia(
        status: json["status"],
        message: json["message"],
        body: List<Body>.from(json["body"].map((x) => Body.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "body": List<dynamic>.from(body.map((x) => x.toJson())),
      };
}

class Body {
  Body({
    required this.posisiMagang,
    required this.createAt,
    required this.foto,
    required this.idPenyedia,
    required this.salary,
    required this.alamat,
    required this.namaPerusahaan,
    required this.email,
    required this.lamaMagang,
    required this.idMagang,
    required this.jumlahMaksimal,
    required this.deskripsi,
    required this.kategori,
    required this.jumlahSaatini,
    required this.syarat,
    required this.lowonganTersedia
  });

  String posisiMagang;
  DateTime createAt;
  String foto;
  int idPenyedia;
  int salary;
  String alamat;
  String namaPerusahaan;
  String email;
  int lamaMagang;
  int idMagang;
  int jumlahMaksimal;
  String deskripsi;
  int kategori;
  int jumlahSaatini;
  int lowonganTersedia;
  List<List<Syarat>> syarat;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        posisiMagang: json["posisi_magang"],
        createAt: DateTime.parse(json["create_at"]),
        foto: json["foto"],
        idPenyedia: json["id_penyedia"],
        salary: json["salary"],
        alamat: json["alamat"],
        namaPerusahaan: json["nama_perusahaan"],
        email: json["email"],
        lamaMagang: json["lama_magang"],
        idMagang: json["id_magang"],
        jumlahMaksimal: json["jumlah_maksimal"],
        deskripsi: json["deskripsi"],
        kategori: json["kategori"],
        jumlahSaatini: json["jumlah_saatini"],
        lowonganTersedia: json['lowongan_tersisa'],
        syarat: List<List<Syarat>>.from(json["syarat"]
            .map((x) => List<Syarat>.from(x.map((x) => Syarat.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "posisi_magang": posisiMagang,
        "create_at": createAt.toIso8601String(),
        "foto": foto,
        "id_penyedia": idPenyedia,
        "salary": salary,
        "alamat": alamat,
        "nama_perusahaan": namaPerusahaan,
        "email": email,
        "lama_magang": lamaMagang,
        "id_magang": idMagang,
        "jumlah_maksimal": jumlahMaksimal,
        "deskripsi": deskripsi,
        "kategori": kategori,
        "jumlah_saatini": jumlahSaatini,
        "syarat": List<dynamic>.from(
            syarat.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
      };
}

class Syarat {
  Syarat({
    required this.id,
    required this.syarat,
  });

  int id;
  String syarat;

  factory Syarat.fromJson(Map<String, dynamic> json) => Syarat(
        id: json["id"],
        syarat: json["syarat"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "syarat": syarat,
      };
}
