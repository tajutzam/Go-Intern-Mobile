// To parse this JSON data, do
//
//     final SekolahUser = welcomeFromJson(jsonString);

import 'dart:convert';

SekolahUser welcomeFromJson(String str) => SekolahUser.fromJson(json.decode(str));

String welcomeToJson(SekolahUser data) => json.encode(data.toJson());

class SekolahUser {
    SekolahUser({
       required this.body,
       required this.status,
       required this.message,
    });

    List<Body> body;
    String status;
    String message;

    factory SekolahUser.fromJson(Map<String, dynamic> json) => SekolahUser(
        body: List<Body>.from(json["body"].map((x) => Body.fromJson(x))),
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "body": List<dynamic>.from(body.map((x) => x.toJson())),
        "status": status,
        "message": message,
    };
}

class Body {
    Body({
       required this.jurusan,
       required this.namaSekolah,
       required this.namaPencariMagang,
       required this.deskripsi,
    });

    String jurusan;
    String namaSekolah;
    String namaPencariMagang;
    String deskripsi;

    factory Body.fromJson(Map<String, dynamic> json) => Body(
        jurusan: json["jurusan"],
        namaSekolah: json["nama_sekolah"],
        namaPencariMagang: json["nama_pencari_magang"],
        deskripsi: json["deskripsi"],
    );

    Map<String, dynamic> toJson() => {
        "jurusan": jurusan,
        "nama_sekolah": namaSekolah,
        "nama_pencari_magang": namaPencariMagang,
        "deskripsi": deskripsi,
    };
}
