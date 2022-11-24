// To parse this JSON data, do
//
//     final Sekolah = SekolahFromJson(jsonString);

import 'dart:convert';

Sekolah SekolahFromJson(String str) => Sekolah.fromJson(json.decode(str));

String SekolahToJson(Sekolah data) => json.encode(data.toJson());

class Sekolah {
    Sekolah({
       required this.data,
       required this.status,
    });

    List<DataSekolah> data;
    String status;

    factory Sekolah.fromJson(Map<String, dynamic> json) => Sekolah(
        data: List<DataSekolah>.from(json["data"].map((x) => DataSekolah.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "status": status,
    };
}

class DataSekolah {
    DataSekolah({
       required this.id,
       required this.namaSekolah,
       required this.jurusan,
    });

    int id;
    String namaSekolah;
    int jurusan;

    factory DataSekolah.fromJson(Map<String, dynamic> json) => DataSekolah(
        id: json["id"],
        namaSekolah: json["nama_sekolah"],
        jurusan: json["jurusan"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama_sekolah": namaSekolah,
        "jurusan": jurusan,
    };
}
