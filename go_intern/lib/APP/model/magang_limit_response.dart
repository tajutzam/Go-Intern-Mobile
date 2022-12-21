// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

MagangLimit1 welcomeFromJson(String str) =>
    MagangLimit1.fromJson(json.decode(str));

String welcomeToJson(MagangLimit1 data) => json.encode(data.toJson());

class MagangLimit1 {
  MagangLimit1({
    required this.status,
    required this.body,
  });

  String status;
  List<MagangLimitBody> body;

  factory MagangLimit1.fromJson(Map<String, dynamic> json) => MagangLimit1(
        status: json["status"],
        body: List<MagangLimitBody>.from(
            json["body"].map((x) => MagangLimitBody.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "body": List<dynamic>.from(body.map((x) => x.toJson())),
      };
}

class MagangLimitBody {
  MagangLimitBody({
    required this.posisi,
    required this.createAt,
    required this.foto,
    required this.penyediaId,
    required this.salary,
    required this.alamat,
    required this.namaPerusahaan,
    required this.email,
    required this.lamaMagang,
    required this.magangId,
    required this.jumlahMaksimal,
    required this.deskripsi,
    required this.kategori,
    required this.jumlahSaatini,
    required this.syarat,
    required this.lowonganTersedia
  });

  String posisi;
  DateTime createAt;
  String foto;
  int penyediaId;
  int salary;
  String alamat;
  String namaPerusahaan;
  String email;
  String lamaMagang;
  int magangId;
  int jumlahMaksimal;
  String deskripsi;
  int kategori;
  int jumlahSaatini;
  List<List<Syarat>> syarat;
  int lowonganTersedia;
  factory MagangLimitBody.fromJson(Map<String, dynamic> json) =>
      MagangLimitBody(
        posisi: json["posisi"],
        createAt: DateTime.parse(json["create_at"]),
        foto: json["foto"],
        penyediaId: json["penyedia_id"],
        salary: json["salary"],
        alamat: json["alamat"],
        namaPerusahaan: json["nama_perusahaan"],
        email: json["email"],
        lamaMagang: json["lama_magang"],
        magangId: json["magang_id"],
        jumlahMaksimal: json["jumlah_maksimal"],
        deskripsi: json["deskripsi"],
        kategori: json["kategori"],
        jumlahSaatini: json["jumlah_saatini"],
        syarat: List<List<Syarat>>.from(json["syarat"]
            .map((x) => List<Syarat>.from(x.map((x) => Syarat.fromJson(x))))),
            lowonganTersedia: json['lowonganTersedia']
      );

  Map<String, dynamic> toJson() => {
        "posisi": posisi,
        "create_at": createAt.toIso8601String(),
        "foto": foto,
        "penyedia_id": penyediaId,
        "salary": salary,
        "alamat": alamat,
        "nama_perusahaan": namaPerusahaan,
        "email": email,
        "lama_magang": lamaMagang,
        "magang_id": magangId,
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
