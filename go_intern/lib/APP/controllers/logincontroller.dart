import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/controllers/UserController.dart';
import 'package:go_intern/APP/controllers/dashboardcontroller.dart';
import 'package:go_intern/APP/model/login_response.dart';
import 'package:go_intern/APP/services/sekolah_service.dart';
import 'package:go_intern/APP/services/skill_service.dart';
import 'package:go_intern/APP/services/user_service.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:go_intern/helpers/url.dart';
import 'package:go_intern/main.dart';
import 'package:go_intern/view/page/homepage.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final usC = TextEditingController();
  final passC = TextEditingController();
  final storage = GetStorage();
  var dataList = <String>["", "", "", ""].obs;
  UserService userService = UserService();
  var nama = "".obs;
  var interactPendidikan = 0.obs;
  var interactTentangSaya = 0.obs;
  var interactPenghargaan = 0.obs;
  var interactSkill = 0.obs;
  List datajurusanTemp = [];
  var dataSekolahUser = {}.obs;
  SekolahService sekolahService = SekolahService();
  SkilService skilService = SkilService();
  var judulPenghargaan = "".obs;
  var filenamePenghargaan = "".obs;
  TextEditingController judulC = TextEditingController();
  var idPenghargaanVal = 0.obs;
  final deskripsiC = TextEditingController();

  refreshSkill() {
    dataList[2] = "skill";
  }

  refreshTentangSaya() {
    dataList[0] = "tentang saya";
  }

  login() async {
    print('login');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String url = "${UrlHelper.baseUrl}/login";
    Map<String, String> sendData = {
      "username": usC.text,
      "password": passC.text
    };
    EasyLoading.show(status: "Tunggu sebentar");
    var respons = await http.post(Uri.parse(url),
        body: jsonEncode(sendData),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        });

    var data = jsonDecode(respons.body);
    if (respons.statusCode == 404) {
      EasyLoading.dismiss();
      Get.snackbar('Gagal Login', data['body'][0],
          colorText: Colors.white,
          backgroundColor: ColorHelpers.colorSnackbarfailed);
    } else if (respons.statusCode == 401) {
      EasyLoading.dismiss();
      Get.snackbar('Gagal login', data['body'][0]['message'],
          colorText: Colors.white,
          backgroundColor: ColorHelpers.colorSnackbarfailed);
    } else if (respons.statusCode == 400) {
      EasyLoading.dismiss();
      Get.snackbar('Gagal login', data['message'],
          colorText: ColorHelpers.colorBlackText,
          backgroundColor: ColorHelpers.colorSnackbarfailed);
    } else {
      EasyLoading.dismiss();
      var dashC = Get.put(DashboardController());
      // dashC.checkFoto();
      Get.snackbar("Succes", "Berhasil Login",
          colorText: Colors.white, backgroundColor: ColorHelpers.colorSnackbar);
      LoginResponse dataPencariMagang = LoginResponse.fromJson(data);
      var tentangSaya = dataPencariMagang.body[0][0].tentangSaya;

      dataList[0] = tentangSaya;
      var response =
          await skilService.showSkill(dataPencariMagang.body[0][0].id);
      var skils = jsonDecode(response.body);
      if (skils['status'] == 'ok') {
        dataList[2] = "ada data skill";
      }
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
      succesLogin();
      sharedPreferences.setInt(
          'penghargaan', dataPencariMagang.body[0][0].idPenghargaan);
      print(sharedPreferences.getString('jenis_kelamin'));
      sharedPreferences.setString('passwordData', passC.text);
      dashC.checkFoto();
      Get.off(HomePageScrenn.new);
    }
  }

  logout() {
    //clear data list , to remove update option
    dataList[0] = "";
    dataList[1] = "";
    dataList[2] = "";
    dataList[3] = "";
    judulC.clear();
  }

  showDatajurusan() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getInt('id');
    var response = await userService.showDataSekolah(id);
    Map<String, dynamic> decoded = jsonDecode(response.body);
    decoded.forEach(
      (key, value) {
        datajurusanTemp.add(value);
      },
    );
    if (response.statusCode == 200) {
      var dataResponse = jsonDecode(response.body);
      dataList[1] = dataResponse['body'][0]['jurusan'];
      dataSekolahUser.addAll(dataResponse);
      if (dataResponse['body'][0]['deskripsi'] != null) {
        deskripsiC.text = dataResponse['body'][0]['deskripsi'];
      } else {
        print('null');
      }
    }
  }

  updateDeskripsiSekolah() async {
    var response = await userService.updateDeskripsiSekolah(deskripsiC.text);
    print(response.body);
  }

  succesLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    showDatajurusan();
    nama.value = sharedPreferences.getString('nama')!;
    sharedPreferences.setBool('login', true);
    getDatPenghargaan();
    final userCon = Get.put(UserController());
    userCon.showSekolahUser();
  }

  showPenghargaanByPencariMagang() async {
    var response = await userService.showPenghargaan();
    if (response != null) {
      var responseData = jsonDecode(response.body);
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.remove('penghargaan');
      var id = responseData['body'][0]['id_penghargaan'];
      sharedPreferences.setInt('penghargaan', id);
    }
  }

  getDatPenghargaan() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var idPenghargaan = sharedPreferences.getInt('penghargaan');
    if (idPenghargaan != null) {
      dataList[3] = "ada datanya";
      interactPenghargaan.value = idPenghargaan;
      var dataPenghargaan =
          await userService.showPenghargaanuser(idPenghargaan);
      judulPenghargaan.value = dataPenghargaan.body[0].judul;
      filenamePenghargaan.value = dataPenghargaan.body[0].file;
      judulC.text = judulPenghargaan.value;
    }
  }

  @override
  void onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print('login');
    print(sharedPreferences.getInt('id'));

    super.onInit();
    sekolahService.getAllData();
    ever(
      interactPendidikan,
      (callback) {
        showDatajurusan();
      },
    );
    ever(
      interactSkill,
      (callback) {
        refreshSkill();
      },
    );
    ever(
      interactTentangSaya,
      (callback) => refreshTentangSaya(),
    );

    ever(
      interactPenghargaan,
      (callback) async {
        await showPenghargaanByPencariMagang();
        await getDatPenghargaan();
      },
    );
  }
  @override
  void dispose() {
    super.dispose();
    usC.clear();
    passC.clear();
    deskripsiC.clear();
  }
}
