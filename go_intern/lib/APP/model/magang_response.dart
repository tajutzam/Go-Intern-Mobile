// To parse this JSON data, do
//
//     final costumer = costumerFromJson(jsonString);

import 'dart:convert';

MagangMain costumerFromJson(String str) => MagangMain.fromJson(json.decode(str));

String costumerToJson(MagangMain data) => json.encode(data.toJson());

class MagangMain {
    MagangMain({
       required this.status,
       required this.message,
       required this.body,
    });

    String status;
    String message;
    List<Body> body;

    factory MagangMain.fromJson(Map<String, dynamic> json) => MagangMain(
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
      required  this.posisiMagang,
      required  this.foto,
      required  this.idPenyedia,
      required  this.salary,
      required  this.alamatPerusahaan,
      required  this.namaPerusahaan,
      required  this.email,
      required  this.lamaMagang,
      required  this.idMagang,
      required  this.jumlahMaksimal,
      required  this.deskripsi,
      required  this.kategori,
      required  this.createAt,
      required  this.syarat,
    });

    String posisiMagang;
    String foto;
    int idPenyedia;
    int salary;
    String alamatPerusahaan;
    String namaPerusahaan;
    String email;
    int lamaMagang;
    int idMagang;
    int jumlahMaksimal;
    String deskripsi;
    int kategori;
    DateTime createAt;
    List<List<Syarat>> syarat;

    factory Body.fromJson(Map<String, dynamic> json) => Body(
        posisiMagang: json["posisi_magang"],
        foto: json["foto"],
        idPenyedia: json["id_penyedia"],
        salary: json["salary"],
        alamatPerusahaan: json['alamat_perusahaan'] , 
        namaPerusahaan: json["nama_perusahaan"],
        email: json["email"],
        lamaMagang: json["lama_magang"],
        idMagang: json["id_magang"],
        jumlahMaksimal: json["jumlah_maksimal"],
        deskripsi: json["deskripsi"],
        kategori: json["kategori"],
        createAt: DateTime.parse(json["create_at"]),
        syarat: List<List<Syarat>>.from(json["syarat"].map((x) => List<Syarat>.from(x.map((x) => Syarat.fromJson(x))))),
    );

    Map<String, dynamic> toJson() => {
        "posisi_magang": posisiMagang,
        "foto": foto,
        "id_penyedia": idPenyedia,
        "salary": salary,
        "alamat_perusahaan": alamatPerusahaan , 
        "nama_perusahaan": namaPerusahaan,
        "email": email,
        "lama_magang": lamaMagang,
        "id_magang": idMagang,
        "jumlah_maksimal": jumlahMaksimal,
        "deskripsi": deskripsi,
        "kategori": kategori,
        "create_at": createAt.toIso8601String(),
        "syarat": List<dynamic>.from(syarat.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
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