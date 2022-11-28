import 'dart:convert';
import 'dart:io';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:go_intern/helpers/url.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
    var fileNamevalue = filename.split("/").last;
    var url = "${UrlHelper.baseUrl}/pencarimagang/upload/image";
    final request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields['username'] = username;
    final file = http.MultipartFile.fromBytes(
        'avatar', File(filename).readAsBytesSync(),
        filename: fileNamevalue);
    request.files.add(file);
    var res = await request.send().then(
      (value) {
        if (value.statusCode == 200) {
          Get.snackbar('success', 'Berhasil Mengganti Profile Picture',
              backgroundColor: Colors.green[100],
              colorText: ColorHelpers.colorBlackText);
        } else if (value.statusCode == 404) {
          Get.snackbar('failed',
              'Gagal Mengganti Profile Picture , Picture sudah tersedia',
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
    return response;
  }

  Future<http.Response> findById(id) async {
    var url = "${UrlHelper.baseUrl}/pencarimagang/findbyid";
    Map<String, dynamic> data = {"id": id};
    var response = await http.post(Uri.parse(url), body: jsonEncode(data));
    return response;
  }

  addDataSekolah(sekolah, jurusan, id) async {
    var url = "${UrlHelper.baseUrl}/pencarimagang/addsekolah";
    var data = {"sekolah": sekolah, "jurusan": jurusan, "id": id};

    var response = await http.post(Uri.parse(url), body: jsonEncode(data));
    print(response.body);
    return response;
  }

  showDatasekolah(id) async {
    var url = "${UrlHelper.baseUrl}/pencarimagang/showdatasekolah";
    var data = {"id": id};
    var response = await http.post(Uri.parse(url), body: jsonEncode(data));
    return response;
  }

  upadatePenghargaan(filename, judul, username) async {
    var url = "${UrlHelper.baseUrl}/pencarimagang/uploadpenghargaan";
    final request = http.MultipartRequest("POST", Uri.parse(url));
    request.fields['judul'] = judul;
    request.fields['username'] = username;
    var fileNamevalue = filename.split("/").last;
    final file = http.MultipartFile.fromBytes(
        'penghargaan', File(filename).readAsBytesSync(),
        filename: fileNamevalue);
    request.files.add(file);
    var boolResponse;
    var res = await request.send();
    if (res.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  showPenghargaan(int id) async {
    var url = "${UrlHelper.baseUrl}/penghargaan/findById";
    Map<String, int> data = {"id": id};
    var res = await http.post(Uri.parse(url), body: jsonEncode(data));
    print(res.body);
    return res;
  }

  showPenghargaanByPencariMagang(id) async {
    var url = "${UrlHelper.baseUrl}/penghargaan/findbypencarimagang";
    Map<String, dynamic> data = {"id": id};
    var response = await http.post(Uri.parse(url), body: jsonEncode(data));
    print(response.statusCode);
    var dataBody = jsonDecode(response.body);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(
        'penghargaan', dataBody['body'][0]['id_penghargaan']);
    var idPenghargaan = sharedPreferences.getInt('penghargaan');
    print(idPenghargaan);
    print(response.body);
    return response;
  }
}
