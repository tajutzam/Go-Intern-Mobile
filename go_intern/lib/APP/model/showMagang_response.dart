// To parse this JSON data, do
//
//     final ShowMagangActiveResponse = welcomeFromJson(jsonString);

import 'dart:convert';

ShowMagangActiveResponse welcomeFromJson(String str) =>
    ShowMagangActiveResponse.fromJson(json.decode(str));

String welcomeToJson(ShowMagangActiveResponse data) =>
    json.encode(data.toJson());

class ShowMagangActiveResponse {
  ShowMagangActiveResponse({
    required this.status,
    required this.message,
    required this.body,
  });

  String status;
  String message;
  List<BodyMagangActive> body;

  factory ShowMagangActiveResponse.fromJson(Map<String, dynamic> json) =>
      ShowMagangActiveResponse(
        status: json["status"],
        message: json["message"],
        body: List<BodyMagangActive>.from(
            json["body"].map((x) => BodyMagangActive.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "body": List<dynamic>.from(body.map((x) => x.toJson())),
      };
}

class BodyMagangActive {
  BodyMagangActive({
    required this.posisiMagang,
    required this.namaPerusahaan,
    required this.startOn,
    required this.finishOn,
    required this.deskripsi,
    required this.kategori,
    required this.alamat,
    required this.email,
    required this.noTelp,
    required this.foto,
    required this.durasi,
  });

  String posisiMagang;
  String namaPerusahaan;
  String startOn;
  String finishOn;
  String deskripsi;
  String kategori;
  String alamat;
  String email;
  String noTelp;
  String foto;
  String durasi;

  factory BodyMagangActive.fromJson(Map<String, dynamic> json) =>
      BodyMagangActive(
        posisiMagang: json["posisi_magang"],
        namaPerusahaan: json["nama_perusahaan"],
        startOn: json["start_on"],
        finishOn: json["finish_on"],
        deskripsi: json["deskripsi"],
        kategori: json["kategori"],
        alamat: json["alamat"],
        email: json["email"],
        noTelp: json["no_telp"],
        foto: json["foto"],
        durasi: json["durasi"],
      );

  Map<String, dynamic> toJson() => {
        "posisi_magang": posisiMagang,
        "nama_perusahaan": namaPerusahaan,
        "start_on":
            startOn,
        "finish_on":
            finishOn,
        "deskripsi": deskripsi,
        "kategori": kategori,
        "alamat": alamat,
        "email": email,
        "no_telp": noTelp,
        "foto": foto,
        "durasi": durasi,
      };
}
