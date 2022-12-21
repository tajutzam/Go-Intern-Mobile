// To parse this JSON data, do
//
//     final RiwayatLamaranResponse = welcomeFromJson(jsonString);

import 'dart:convert';

RiwayatLamaranResponse welcomeFromJson(String str) =>
    RiwayatLamaranResponse.fromJson(json.decode(str));

String welcomeToJson(RiwayatLamaranResponse data) => json.encode(data.toJson());

class RiwayatLamaranResponse {
  RiwayatLamaranResponse({
    required this.body,
    required this.status,
    required this.message,
  });

  List<RiwayatLamaranBody> body;
  String status;
  String message;

  factory RiwayatLamaranResponse.fromJson(Map<String, dynamic> json) =>
      RiwayatLamaranResponse(
        body: List<RiwayatLamaranBody>.from(
            json["body"].map((x) => RiwayatLamaranBody.fromJson(x))),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "body": List<dynamic>.from(body.map((x) => x.toJson())),
        "status": status,
        "message": message,
      };
}

class RiwayatLamaranBody {
  RiwayatLamaranBody({
    required this.posisi,
    required this.namaPerusahaan,
    required this.status,
    required this.alamat,
    required this.idLowongan,
    required this.email,
    required this.idMagang,
    required this.foto,
    required this.tanggalLamaran
  });

  String posisi;
  String namaPerusahaan;
  String status;
  String alamat;
  int idLowongan;
  String email;
  int idMagang;
  String foto;
  String tanggalLamaran;

  factory RiwayatLamaranBody.fromJson(Map<String, dynamic> json) =>
      RiwayatLamaranBody(
        posisi: json["posisi"],
        namaPerusahaan: json["nama_perusahaan"],
        status: json["status"],
        alamat: json["alamat"],
        idLowongan: json["id_lowongan"],
        email: json["email"],
        idMagang: json["id_magang"],
        foto: json["foto"],
        tanggalLamaran: json['tanggal_lamar']
      );

  Map<String, dynamic> toJson() => {
        "posisi": posisi,
        "nama_perusahaan": namaPerusahaan,
        "status": status,
        "alamat": alamat,
        "id_lowongan": idLowongan,
        "email": email,
        "id_magang": idMagang,
        "foto": foto,
      };
}
