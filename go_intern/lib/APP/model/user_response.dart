// To parse this JSON data, do
//
//     final Datauser = costumerFromJson(jsonString);

import 'dart:convert';

Datauser costumerFromJson(String str) => Datauser.fromJson(json.decode(str));

String costumerToJson(Datauser data) => json.encode(data.toJson());

class Datauser {
    Datauser({
      required  this.status,
      required  this.body,
      required  this.length,
    });

    String status;
    List<Body> body;
    int length;

    factory Datauser.fromJson(Map<String, dynamic> json) => Datauser(
        status: json["status"],
        body: List<Body>.from(json["body"].map((x) => Body.fromJson(x))),
        length: json["length"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "body": List<dynamic>.from(body.map((x) => x.toJson())),
        "length": length,
    };
}

class Body {
    Body({
      required  this.id,
      required  this.username,
      required  this.password,
      required  this.email,
      required  this.idSekolah,
      required  this.noTelp,
      required  this.agama,
      required  this.tanggalLahir,
      required  this.token,
      required  this.cv,
      required  this.resume,
      required  this.status,
      required  this.statusMagang,
      required  this.role,
      required  this.crateAdd,
      required  this.updateAdd,
      required  this.expiredToken,
      required  this.tentangSaya,
      required  this.nama,
      required  this.foto,
      required  this.jenisKelamin,
      required  this.idPenghargaan,
      required  this.deskripsi,
    });

    int id;
    String username;
    String password;
    String email;
    int idSekolah;
    dynamic noTelp;
    dynamic agama;
    String tanggalLahir;
    String token;
    dynamic cv;
    dynamic resume;
    String status;
    String statusMagang;
    int role;
    DateTime crateAdd;
    String updateAdd;
    DateTime expiredToken;
    dynamic tentangSaya;
    String nama;
    String foto;
    String jenisKelamin;
    int idPenghargaan;
    String deskripsi;

    factory Body.fromJson(Map<String, dynamic> json) => Body(
        id: json["id"],
        username: json["username"],
        password: json["password"],
        email: json["email"],
        idSekolah: json["id_sekolah"] ?? 0,
        noTelp: json["no_telp"],
        agama: json["agama"] ?? "not set",
        tanggalLahir: json["tanggal_lahir"],
        token: json["token"],
        cv: json["cv"],
        resume: json["resume"],
        status: json["status"],
        statusMagang: json["status_magang"],
        role: json["role"],
        crateAdd: DateTime.parse(json["crate_add"]),
        updateAdd: json["update_add"],
        expiredToken: DateTime.parse(json["expired_token"]),
        tentangSaya: json["tentang-saya"],
        nama: json["nama"],
        foto: json["foto"] ?? 'null',
        jenisKelamin: json["jenis_kelamin"],
        idPenghargaan: json["id_penghargaan"],
        deskripsi: json["deskripsi"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "password": password,
        "email": email,
        "id_sekolah": idSekolah,
        "no_telp": noTelp,
        "agama": agama,
        "tanggal_lahir": tanggalLahir,
        "token": token,
        "cv": cv,
        "resume": resume,
        "status": status,
        "status_magang": statusMagang,
        "role": role,
        "crate_add": crateAdd.toIso8601String(),
        "update_add": updateAdd,
        "expired_token": expiredToken.toIso8601String(),
        "tentang-saya": tentangSaya,
        "nama": nama,
        "foto": foto,
        "jenis_kelamin": jenisKelamin,
        "id_penghargaan": idPenghargaan,
        "deskripsi": deskripsi,
    };
}
