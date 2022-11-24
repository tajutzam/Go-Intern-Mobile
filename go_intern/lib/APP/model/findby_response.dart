// To parse this JSON data, do
//
//     final costumer = costumerFromJson(jsonString);

import 'dart:convert';

UserResponse userResponseFromJson(String str) => UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
    UserResponse({
       required this.status,
       required this.body,
       required this.length,
    });

    String status;
    List<Body> body;
    int length;

    factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
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
       required this.id,
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
       required this.foto,
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
    String crateAdd;
    String updateAdd;
    String expiredToken;
    String tentangSaya;
    String nama;
    String foto;

    factory Body.fromJson(Map<String, dynamic> json) => Body(
        id: json["id"],
        username: json["username"],
        password: json["password"],
        email: json["email"],
        idSekolah: json["id_sekolah"] ?? 0,
        noTelp: json["no_telp"],
        agama: json["agama"],
        tanggalLahir: json["tanggal_lahir"],
        token: json["token"],
        cv: json["cv"],
        resume: json["resume"],
        status: json["status"],
        statusMagang: json["status_magang"],
        role: json["role"],
        crateAdd: json["crate_add"],
        updateAdd: json["update_add"],
        expiredToken: json["expired_token"],
        tentangSaya: json["tentang-saya"],
        nama: json["nama"],
        foto: json["foto"] ?? 'null',
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
        "crate_add": crateAdd,
        "update_add": updateAdd,
        "expired_token": expiredToken ?? 'null',
        "tentang-saya": tentangSaya,
        "nama": nama,
        "foto": foto ?? 'null.jpg',
    };
}
