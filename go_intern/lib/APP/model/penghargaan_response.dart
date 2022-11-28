// To parse this JSON data, do
//
//     final Penghargaan = costumerFromJson(jsonString);

import 'dart:convert';

PenghargaanResponse penghargaanFromJson(String str) => PenghargaanResponse.fromJson(json.decode(str));

String penghargaanToJson(PenghargaanResponse data) => json.encode(data.toJson());

class PenghargaanResponse {
    PenghargaanResponse({
       required this.body,
       required this.status,
       required this.message,
    });

    List<Body> body;
    String status;
    String message;

    factory PenghargaanResponse.fromJson(Map<String, dynamic> json) => PenghargaanResponse(
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
       required this.id,
       required this.judul,
       required this.file,
    });

    int id;
    String judul;
    String file;

    factory Body.fromJson(Map<String, dynamic> json) => Body(
        id: json["id"],
        judul: json["judul"],
        file: json["file"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "judul": judul,
        "file": file,
    };
}
