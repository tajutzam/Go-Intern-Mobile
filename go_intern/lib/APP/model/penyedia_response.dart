import 'dart:convert';

Penyedia welcomeFromJson(String str) => Penyedia.fromJson(json.decode(str));

String welcomeToJson(Penyedia data) => json.encode(data.toJson());

class Penyedia {
  Penyedia({
    required this.body,
    required this.status,
    required this.message,
  });
  List<BodyPenyedia> body;
  String status;
  String message;

  factory Penyedia.fromJson(Map<String, dynamic> json) => Penyedia(
        body: List<BodyPenyedia>.from(
            json["body"].map((x) => BodyPenyedia.fromJson(x))),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "body": List<dynamic>.from(body.map((x) => x.toJson())),
        "status": status,
        "message": message,
      };
}

class BodyPenyedia {
  BodyPenyedia({
    required this.id,
    required this.namaPerusahaan,
    required this.foto,
    required this.alamatPerusahaan,
    required this.email,
    required this.noTelp,
    required this.jumlah,
    required this.jumlahMagang
  });

  int id;
  String namaPerusahaan;
  String foto;
  String alamatPerusahaan;
  String email;
  String noTelp;
  int jumlah;
  int jumlahMagang;
  factory BodyPenyedia.fromJson(Map<String, dynamic> json) => BodyPenyedia(
        id: json["id"],
        namaPerusahaan: json["nama_perusahaan"],
        foto: json["foto"] ?? "defaultpp.png",
        alamatPerusahaan: json["alamat_perusahaan"],
        email: json["email"],
        noTelp: json["no_telp"],
        jumlah: json["jumlah"],
        jumlahMagang: json['jumlah_magang']
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_perusahaan": namaPerusahaan,
        "foto": foto,
        "alamat_perusahaan": alamatPerusahaan,
        "email": email,
        "no_telp": noTelp,
        "jumlah": jumlah,
      };
}
