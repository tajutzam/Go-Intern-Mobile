import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/controllers/dashboardcontroller.dart';
import 'package:go_intern/APP/model/login_response.dart';
import 'package:go_intern/APP/services/sekolah_service.dart';
import 'package:go_intern/APP/services/skill_service.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:go_intern/helpers/url.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final usC = TextEditingController();
  final passC = TextEditingController();
  final storage = GetStorage();
  List dataList = ["", "", "", ""];

  SekolahService sekolahService = SekolahService();
  SkilService skilService = SkilService();

  login() async {
    final String url = "${UrlHelper.baseUrl}/login";
    Map<String, String> sendData = {
      "username": usC.text,
      "password": passC.text
    };
    var respons = await http.post(Uri.parse(url),
        body: jsonEncode(sendData),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        });
    print(respons.body);
    var data = jsonDecode(respons.body);
    if (respons.statusCode == 404) {
      Get.snackbar('Gagal Login', data['body'][0],
          colorText: Colors.white,
          backgroundColor: ColorHelpers.colorNavbarProfile);
    } else if (respons.statusCode == 401) {
      Get.snackbar('Gagal login', data['body'][0]['message'],
          colorText: Colors.white,
          backgroundColor: ColorHelpers.colorNavbarProfile);
    } else if (respons.statusCode == 400) {
      Get.snackbar('Gagal login', data['message'],
          colorText: ColorHelpers.colorBlackText,
          backgroundColor: ColorHelpers.colorNavbarProfile);
    } else {
      Get.snackbar("Succes", "Berhasil Login",
          colorText: Color.fromRGBO(39, 39, 39, 1),
          backgroundColor: Colors.green[100]);
      LoginResponse dataPencariMagang = LoginResponse.fromJson(data);
      var tentangSaya = dataPencariMagang.body[0][0].tentangSaya;
      dataList[0] = tentangSaya;
      var response =
          await skilService.showSkill(dataPencariMagang.body[0][0].id);
      var skils = jsonDecode(response.body);
      print(skils);
      if (skils['status'] == 'ok') {
        dataList[2] = skils['skills'];
      }
      var dashC = Get.put(DashboardController());
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.clear();
      sharedPreferences.setString(
          'username', dataPencariMagang.body[0][0].username);
      sharedPreferences.setString('agama', dataPencariMagang.body[0][0].agama);
      sharedPreferences.setString(
          'notelp', dataPencariMagang.body[0][0].noTelp);
      sharedPreferences.setString(
          'tentang-saya', dataPencariMagang.body[0][0].tentangSaya);
      sharedPreferences.setString('nama', dataPencariMagang.body[0][0].nama);
      sharedPreferences.setInt('id', dataPencariMagang.body[0][0].id);
      sharedPreferences.setString('foto', dataPencariMagang.body[0][0].foto);
      sharedPreferences.setString(
          'jenis_kelamin', dataPencariMagang.body[0][0].jenisKelamin);
      Future.delayed(
          Duration(seconds: 2),
          () => Get.offNamed(
                "/home",
                arguments: [
                  {
                    "agama": dataPencariMagang.body[0][0].agama,
                    "username": dataPencariMagang.body[0][0].username,
                    "password": dataPencariMagang.body[0][0].password,
                    "no-telp": dataPencariMagang.body[0][0].noTelp,
                    "tanggal-lahir": dataPencariMagang.body[0][0].tanggalLahir,
                    "id-sekolah": dataPencariMagang.body[0][0].idSekolah,
                  }
                ],
              ));
    }
  }

  @override
  void onInit() {
    super.onInit();
    sekolahService.getAllData();
  }
}
