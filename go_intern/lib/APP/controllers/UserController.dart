import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/model/findby_response.dart';
import 'package:go_intern/APP/model/jurusan_response.dart';
import 'package:go_intern/APP/model/login_response.dart';
import 'package:go_intern/APP/model/sekolah_response.dart';
import 'package:go_intern/APP/repositories/user_repository.dart';
import 'package:go_intern/APP/services/jurusan_service.dart';
import 'package:go_intern/APP/services/sekolah_service.dart';
import 'package:go_intern/APP/services/skill_service.dart';
import 'package:go_intern/APP/services/user_service.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late UserRepository userRepository;

  SekolahService sekolahService = SekolahService();
  JurusanService jurusanService = JurusanService();
  TextEditingController controller = TextEditingController();
  TextEditingController sekolahC = TextEditingController();
  late final AnimationController animationController;
  UserService userService = UserService();
  String nama = "";
  var jenjang = "".obs;
  int id = 0;
  UserResponse? dataUser;
  List<String> dataSekolah = [];
  List<String> datajurusan = [];
  TextEditingController judulPenghargaan = TextEditingController();
  var pathPenghargaan = "".obs;

  var interactUser = false.obs;
  var jurusanTemp = "".obs;
  final ttgSayaC = TextEditingController();
  var sekolahTemp = "".obs;
  List data = [
    "",
    "",
    "",
    "",
  ];

  setValueTentangSaya() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var tentangSaya = sharedPreferences.getString('tentang-saya');
    if (tentangSaya != null || tentangSaya != 'null' || tentangSaya != '') {
      ttgSayaC.text = tentangSaya!;
    }
  }

  Future<bool> updateTentangSaya() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    id = sharedPreferences.getInt('id')!;
    userRepository = UserRepository();
    var response = await userRepository.updateTentangSaya(ttgSayaC.text, id);
    if (response.statusCode == 200) {
      sharedPreferences.setString('tentang-saya', ttgSayaC.text);
      return true;
    } else {
      return false;
    }
  }

  getDataLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  }

  setDataSekolah() async {
    Sekolah response = await sekolahService.getAllData();
    for (var i = 0; i < response.data.length; i++) {
      // if (regexSmk.hasMatch(response.dataSekolah[i].sekolah)) {
      //   print('ada smk');
      // }
      print('add');
      dataSekolah.add(response.data[i].namaSekolah);
    }
  }

  setDataJurusan() async {
    Jurusan jurusan = await jurusanService.showAllJurusan();
    for (var i = 0; i < jurusan.body.length; i++) {
      datajurusan.add(jurusan.body[i].jurusan);
    }
  }

  cariDataSekolah(key) async {
    var result = await sekolahService.getDataCari(key);
    return result;
  }

  uploadImage(filename, path) async {
    var res = await userService.uploadImage(filename, path);
  }

  getDataUser(username) async {
    dataUser = await userService.getDataUser(username);
  }

  addSekolahIfNotExist(sekolah) async {
    var response = await sekolahService.addSekolah(sekolah);
    print('oke');
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      Get.snackbar('Succes', responseData['message']);
      dataSekolah.add(sekolah);
    }
  }

  addSekolahToJurusan(sekolah, jurusan) async {
    // search data sekolah by nama
    // searcyhb data jurusan by nama
    print(sekolah);
    var responseSekolah = await sekolahService.cariSekolah(sekolah);
    var responseJurusan = await jurusanService.findByJurusan(jurusan);
    var decodedjurusan = jsonDecode(responseJurusan.body);
    var decodedSekolah = jsonDecode(responseSekolah.body);
    var response = await sekolahService.addJurusanToSekolah(
        decodedSekolah['body'][0]['id'], decodedjurusan['body'][0]['id']);
    print(response.body);
  }

  addDataSekolah(sekolah, jurusan, id) async {
    var responseSekolah = await sekolahService.cariSekolah(sekolah);
    var responseJurusan = await jurusanService.findByJurusan(jurusan);
    var decodedjurusan = jsonDecode(responseJurusan.body);
    var decodedSekolah = jsonDecode(responseSekolah.body);
    var response = await userService.addDataSekolah(
        decodedSekolah['body'][0]['id'], decodedjurusan['body'][0]['id'], id);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  addPennghargaan(filename, judul) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var username = sharedPreferences.getString('username');
    return await userService.updatePenghargaan(filename, judul, username);
  }



  @override
  void onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    getDataLogin();
    setDataSekolah();
    setDataJurusan();
    print('on init run');
    animationController = AnimationController(vsync: this);
    animationController.fling();
    // sekolahService.getDataCari('SMKN 1 Tegalsari');
    if (sharedPreferences.getString('tentang-saya') == null) {
      print('kosong');
    } else {
      data[0] = sharedPreferences.getString('tentang-saya');
    }
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    judulPenghargaan.text = "";
  }
}
