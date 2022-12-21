// To parse this JSON data, do
//
//     final MagangKategori = welcomeFromJson(jsonString);

import 'dart:convert';

MagangKategori welcomeFromJson(String str) => MagangKategori.fromJson(json.decode(str));

String welcomeToJson(MagangKategori data) => json.encode(data.toJson());

class MagangKategori {
    MagangKategori({
       required this.status,
       required this.message,
       required this.body,
    });

    String status;
    String message;
    List<MagangKategoriBody> body;
    factory MagangKategori.fromJson(Map<String, dynamic> json) => MagangKategori(
        status: json["status"],
        message: json["message"],
        body: List<MagangKategoriBody>.from(json["body"].map((x) => MagangKategoriBody.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "body": List<dynamic>.from(body.map((x) => x.toJson())),
    };
}

class MagangKategoriBody {
    MagangKategoriBody({
       required this.posisiMagang,
       required this.foto,
       required this.idPenyedia,
       required this.salary,
       required this.alamatPerusahaan,
       required this.namaPerusahaan,
       required this.email,
       required this.lamaMagang,
       required this.idMagang,
       required this.jumlahMaksimal,
       required this.deskripsi,
       required this.kategori,
       required this.createAt,
       required this.lowonganTersedia,
       required this.syarat,
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
    String createAt;
    int lowonganTersedia;
    List<List<Syarat>> syarat;

    factory MagangKategoriBody.fromJson(Map<String, dynamic> json) => MagangKategoriBody(
        posisiMagang: json["posisi_magang"],
        foto: json["foto"],
        idPenyedia: json["id_penyedia"],
        salary: json["salary"],
        alamatPerusahaan: json["alamat_perusahaan"],
        namaPerusahaan: json["nama_perusahaan"],
        email: json["email"],
        lamaMagang: json["lama_magang"],
        idMagang: json["id_magang"],
        jumlahMaksimal: json["jumlah_maksimal"],
        deskripsi: json["deskripsi"],
        kategori: json["kategori"],
        createAt: json["create_at"],
        lowonganTersedia: json["lowongan_tersedia"],
        syarat: List<List<Syarat>>.from(json["syarat"].map((x) => List<Syarat>.from(x.map((x) => Syarat.fromJson(x))))),
    );

    Map<String, dynamic> toJson() => {
        "posisi_magang": posisiMagang,
        "foto": foto,
        "id_penyedia": idPenyedia,
        "salary": salary,
        "alamat_perusahaan": alamatPerusahaan,
        "nama_perusahaan": namaPerusahaan,
        "email": email,
        "lama_magang": lamaMagang,
        "id_magang": idMagang,
        "jumlah_maksimal": jumlahMaksimal,
        "deskripsi": deskripsi,
        "kategori": kategori,
        "create_at": createAt,
        "lowongan_tersedia": lowonganTersedia,
        "syarat": List<dynamic>.from(syarat.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
    };
}

class Syarat {
    Syarat({
      required  this.id,
      required  this.syarat,
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
