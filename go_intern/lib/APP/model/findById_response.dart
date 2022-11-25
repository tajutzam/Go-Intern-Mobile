// To parse this JSON data, do
//
//     final UserFindByIdResponse = costumerFromJson(jsonString);

import 'dart:convert';

UserFindByIdResponse costumerFromJson(String str) => UserFindByIdResponse.fromJson(json.decode(str));

String costumerToJson(UserFindByIdResponse data) => json.encode(data.toJson());

class UserFindByIdResponse {
    UserFindByIdResponse({
       required this.body,
       required this.status,
    });

    List<Body> body;
    String status;

    factory UserFindByIdResponse.fromJson(Map<String, dynamic> json) => UserFindByIdResponse(
        body: List<Body>.from(json["body"].map((x) => Body.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "body": List<dynamic>.from(body.map((x) => x.toJson())),
        "status": status,
    };
}

class Body {
    Body({
       required this.id,
       required this.username,
       required this.password,
       required this.email,
       required this.sekolah,
       required this.noTelp,
       required this.agama,
       required this.tangalLahir,
       required this.token,
       required this.cv,
       required this.resume,
       required this.status,
       required this.statusMagang,
       required this.role,
       required this.createAt,
       required this.updateAt,
       required this.nama,
       required this.foto,
       required this.jenisKelamin,
    });

    int id;
    String username;
    String password;
    String email;
    int sekolah;
    int noTelp;
    String agama;
    DateTime tangalLahir;
    String token;
    String cv;
    String resume;
    String status;
    String statusMagang;
    int role;
    DateTime createAt;
    String updateAt;
    String nama;
    String foto;
    String jenisKelamin;

    factory Body.fromJson(Map<String, dynamic> json) => Body(
        id: json["id"],
        username: json["username"],
        password: json["password"],
        email: json["email"],
        sekolah: json["sekolah"],
        noTelp: json["no_telp"],
        agama: json["agama"],
        tangalLahir: DateTime.parse(json["tangal_lahir"]),
        token: json["token"],
        cv: json["cv"],
        resume: json["resume"],
        status: json["status"],
        statusMagang: json["statusMagang"],
        role: json["role"],
        createAt: DateTime.parse(json["create_at"]),
        updateAt: json["update_at"],
        nama: json["nama"],
        foto: json["foto"],
        jenisKelamin: json["jenis_kelamin"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "password": password,
        "email": email,
        "sekolah": sekolah,
        "no_telp": noTelp,
        "agama": agama,
        "tangal_lahir": "${tangalLahir.year.toString().padLeft(4, '0')}-${tangalLahir.month.toString().padLeft(2, '0')}-${tangalLahir.day.toString().padLeft(2, '0')}",
        "token": token,
        "cv": cv,
        "resume": resume,
        "status": status,
        "statusMagang": statusMagang,
        "role": role,
        "create_at": createAt.toIso8601String(),
        "update_at": updateAt,
        "nama": nama,
        "foto": foto,
        "jenis_kelamin": jenisKelamin,
    };
}
