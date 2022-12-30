// To parse this JSON data, do
//
//     final costumer = costumerFromJson(jsonString);

import 'dart:convert';

LoginResponse costumerFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String costumerToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.body,
    required this.message,
  });
  List<List<DataPencariMagang>> body;
  String message;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        body: List<List<DataPencariMagang>>.from(json["body"].map((x) =>
            List<DataPencariMagang>.from(
                x.map((x) => DataPencariMagang.fromJson(x))))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "body": List<dynamic>.from(
            body.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "message": message,
      };
}

class DataPencariMagang {
  DataPencariMagang(
      {required this.id,
      required this.username,
      required this.password,
      required this.email,
      required this.idSekolah,
      required this.noTelp,
      required this.agama,
      required this.tanggalLahir,
      required this.token,
      required this.cv,
      required this.resume,
      required this.status,
      required this.statusMagang,
      required this.role,
      required this.crateAdd,
      required this.updateAdd,
      required this.expiredToken,
      required this.tentangSaya,
      required this.nama,
      required this.foto , 
      required this.jenisKelamin , 
      required this.idPenghargaan // required this.syaratMain
      });
  int id;
  String username;
  String password;
  String email;
  int? idSekolah;
  dynamic noTelp;
  dynamic agama;
  DateTime tanggalLahir;
  String token;
  dynamic cv;
  dynamic resume;
  String status;
  String statusMagang;
  int role;
  DateTime crateAdd;
  String updateAdd;
  String expiredToken;
  String tentangSaya;
  String nama;
  String foto;
  String jenisKelamin;
  int idPenghargaan;
  factory DataPencariMagang.fromJson(Map<String, dynamic> json) =>
      DataPencariMagang(
          id: json["id"],
          username: json["username"],
          password: json["password"],
          email: json["email"],
          idSekolah: json["id_sekolah"] ?? 0,
          noTelp: json["no_telp"] ?? 'null',
          agama: json["agama"] ?? 'null',
          tanggalLahir: DateTime.parse(json["tanggal_lahir"]),
          token: json["token"],
          cv: json["cv"],
          resume: json["resume"],
          status: json["status"],
          statusMagang: json["status_magang"],
          role: json["role"],
          crateAdd: DateTime.parse(json["crate_add"]),
          updateAdd: json["update_add"],
          expiredToken: json["expired_token"] ?? "no activate",
          tentangSaya: json['tentang-saya'] ?? '',
          nama: json['nama'] ?? 'null',
          foto: json['foto'] ?? 'null' , 
          jenisKelamin: json['jenis_kelamin'] , 
          idPenghargaan: json['id_penghargaan']
          );
  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "password": password,
        "email": email,
        "id_sekolah": idSekolah,
        "no_telp": noTelp,
        "agama": agama,
        "tanggal_lahir":
            "${tanggalLahir.toString().padLeft(4, '0')}-${tanggalLahir.toString().padLeft(2, '0')}-${tanggalLahir.toString().padLeft(2, '0')}",
        "token": token,
        "cv": cv,
        "resume": resume,
        "status": status,
        "status_magang": statusMagang,
        "role": role,
        "crate_add": crateAdd,
        "update_add": updateAdd,
        "expired_token": expiredToken,
        "foto": foto ?? 'null' , 
        "jenis_kelamin" : jenisKelamin
      };
}
