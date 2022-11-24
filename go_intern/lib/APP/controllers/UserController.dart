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
  SharedPreferences? sharedPreferences;
  SekolahService sekolahService = SekolahService();
  JurusanService jurusanService = JurusanService();
  TextEditingController controller = TextEditingController();
  late final AnimationController animationController;
  UserService userService = UserService();
  var jenjang = "".obs;
  int id = 0;
  UserResponse? dataUser;
  List<String> dataSekolah = [];
  List<String> datajurusan = [];
  var interactUser = false.obs;

  final ttgSayaC = TextEditingController();
  List data = [
    "",
    "",
    "",
    "",
  ];

  setValueTentangSaya() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var tentangSaya = sharedPreferences!.getString('tentang-saya');
    if (tentangSaya != null || tentangSaya != 'null' || tentangSaya != '') {
      ttgSayaC.text = tentangSaya!;
    }
  }

  Future<bool> updateTentangSaya() async {
    id = sharedPreferences!.getInt('id')!;
    userRepository = UserRepository();
    var response = await userRepository.updateTentangSaya(ttgSayaC.text, id);
    if (response.statusCode == 200) {
      sharedPreferences?.setString('tentang-saya', ttgSayaC.text);
      return true;
    } else {
      return false;
    }
  }

  getDataLogin() async {
    sharedPreferences = await SharedPreferences.getInstance();
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

  @override
  void onInit() {
    super.onInit();
    getDataLogin();
    setDataSekolah();
    setDataJurusan();
    print('on init run');
    animationController = AnimationController(vsync: this);
    animationController.fling();
    // sekolahService.getDataCari('SMKN 1 Tegalsari');
    if (sharedPreferences?.getString('tentang-saya') == null) {
      print('kosong');
    } else {
      data[0] = sharedPreferences?.getString('tentang-saya');
    }
  }
}
