import 'dart:convert';
import 'dart:io';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:go_intern/helpers/url.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<http.Response> updateTentangSaya(String tentangSaya, int id) async {
    Map<String, dynamic> data = {"tentang-saya": tentangSaya, "id": id};
    var response = await http.post(
        body: jsonEncode(data),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Access-Control-Allow-Methods": "POST"
        },
        Uri.parse("${UrlHelper.baseUrl}/update/tentang-saya"));
    print(response.body);
    return response;
  }

  uploadImage(filename, path, username) async {
    var url = "${UrlHelper.baseUrl}/pencarimagang/upload/image";
    final request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields['username'] = username;
    final file = http.MultipartFile.fromBytes(
        'avatar', File(filename).readAsBytesSync(),
        filename: filename.split("/").last);
    request.files.add(file);
    var res = await request.send().then(
      (value) {
        if (value.statusCode == 200) {
          Get.snackbar('success', 'Succes menambahkan foto',
              backgroundColor: Colors.green[100],
              colorText: ColorHelpers.colorBlackText);
        } else if (value.statusCode == 404) {
          Get.snackbar('failed', 'Gagal Menambahkan foto , foto sudah tersedia',
              backgroundColor: Colors.red[200],
              colorText: ColorHelpers.colorBlackText);
        } else {
          Get.snackbar('failed', 'Gagal Menambahkan foto , terjadi kesalahan',
              backgroundColor: Colors.red[200],
              colorText: ColorHelpers.colorBlackText);
        }
      },
    );
    return res;
  }

  Future<http.Response> getDataUser(username) async {
    var url = "${UrlHelper.baseUrl}/findby/username";
    Map<String, dynamic> data = {"username": username};
    var response = await http.post(Uri.parse(url), body: jsonEncode(data));
    print(response.body);
    return response;
  }
}
