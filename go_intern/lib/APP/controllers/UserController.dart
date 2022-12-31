import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/model/findby_response.dart';
import 'package:go_intern/APP/model/jurusan_response.dart';
import 'package:go_intern/APP/model/login_response.dart';
import 'package:go_intern/APP/model/penghargaan_response.dart';
import 'package:go_intern/APP/model/sekolah_response.dart';
import 'package:go_intern/APP/model/showMagang_response.dart';
import 'package:go_intern/APP/repositories/user_repository.dart';
import 'package:go_intern/APP/services/jurusan_service.dart';
import 'package:go_intern/APP/services/sekolah_service.dart';
import 'package:go_intern/APP/services/skill_service.dart';
import 'package:go_intern/APP/services/user_service.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/user_response.dart';

class UserController extends GetxController with GetTickerProviderStateMixin {
  UserRepository userRepository = UserRepository();
  SekolahService sekolahService = SekolahService();
  JurusanService jurusanService = JurusanService();
  TextEditingController controller = TextEditingController();
  TextEditingController sekolahC = TextEditingController();
  TextEditingController deskripsiC = TextEditingController();

  UserService userService = UserService();
  String nama = "";
  var jenjang = "".obs;
  int id = 0;
  UserResponse? dataUser;
  List<String> dataSekolah = [];
  List<String> datajurusan = [];
  TextEditingController judulPenghargaan = TextEditingController();
  List<BodyMagangActive> magangActive = [];
  var pathPenghargaan = "".obs;
  var pathCv = "".obs;
  var interactUser = false.obs;
  var jurusanTemp = "".obs;
  final ttgSayaC = TextEditingController();
  var sekolahTemp = "".obs;
  var penghargaan = "".obs;
  SkilService skilService = SkilService();
  var penghargaanInteract = 0.obs;
  var pendidikanInterac = 0.obs;
  var data = <String>[
    "",
    "",
    "",
    "",
  ].obs;
  var skillinteract = 0.obs;

  setValueTentangSaya() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var tentangSaya = sharedPreferences.getString('tentang-saya');
    print("tentang s");
    print(tentangSaya);
    if (tentangSaya != '') {
      data[0] = "adsa";
      ttgSayaC.text = tentangSaya!;
    }
  }

  showSkillStatus(id) async {
    var skils = await skilService.showSkill(id);
    var dataSkil = jsonDecode(skils.body);
    if (dataSkil['status'] == 'ok') {
      data[2] = "ada";
    }
  }

  logout() {
    data[0] = "";
    data[1] = "";
    data[2] = "";
    data[3] = "";
    judulPenghargaan.text = "";
    sekolahTemp.value = "";
    jurusanTemp.value = "";
  }

  Future<bool> updateTentangSaya() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    id = sharedPreferences.getInt('id')!;
    userRepository = UserRepository();
    var response = await userRepository.updateTentangSaya(ttgSayaC.text, id);
    if (response.statusCode == 200) {
      sharedPreferences.setString('tentang-saya', ttgSayaC.text);
      data[0] = "asdasd";
      return true;
    } else {
      return false;
    }
  }

  setDataSekolah() async {
    Sekolah response = await sekolahService.getAllData();
    for (var i = 0; i < response.data.length; i++) {
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
    return res;
  }
  addSekolahIfNotExist(sekolah) async {
    var response = await sekolahService.addSekolah(sekolah);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      Get.snackbar('Succes', responseData['message']);
      dataSekolah.add(sekolah);
    }
  }
  getDatPenghargaan(id) async {
    PenghargaanResponse response = await userService.showPenghargaanuser(id);
    penghargaan.value = response.body[0].file;
    judulPenghargaan.text = response.body[0].judul;
  }
  
  showDataUser() async {
    Datauser? userr = await userService.showDataUser();
    if (userr != null) {
      var idPenghargaan = userr.body[0].idPenghargaan;
      if (idPenghargaan != 0) {
        getDatPenghargaan(idPenghargaan);
        data[3] = "adas";
        penghargaanInteract++;
      }
      setPendidikanUser(userr.body[0].id);
      showJurusanUser(userr.body[0].id);
      showSkillStatus(userr.body[0].id);
    }
  }

  showJurusanUser(id) async {
    var res = await userRepository.showJurusanUser(id);
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      jurusanTemp.value = data['jurusan'];
      print(data['jurusan']);
    } else {}
  }

  setPendidikanUser(id) async {
    var response = await userService.showDataSekolah(id);
    if (response != null) {
      data[1] = "asdas";
      sekolahTemp.value = response.body[0].namaSekolah;
      jurusanTemp.value = response.body[0].jurusan;
      deskripsiC.text = response.body[0].deskripsi;
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
    data[1] = "asdasd";
  }

  showDatajurusan() async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // var id = sharedPreferences.getInt('id');
    // var response = await userService.showDataSekolah(id);
    // Map<String, dynamic> decoded = jsonDecode(response.body);
    // decoded.forEach(
    //   (key, value) {
    //     datajurusanTemp.add(value);
    //   },
    // );
    // if (response.statusCode == 200) {
    //   var dataResponse = jsonDecode(response.body);
    //   dataList[1] = dataResponse['body'][0]['jurusan'];
    //   dataSekolahUser.addAll(dataResponse);
    //   if (dataResponse['body'][0]['deskripsi'] != null) {
    //     deskripsiC.text = dataResponse['body'][0]['deskripsi'];
    //   } else {
    //     print('null');
    //   }
    // }
  }
  addDataSekolah(sekolah, jurusan, id) async {
    var responseSekolah = await sekolahService.cariSekolah(sekolah);
    var responseJurusan = await jurusanService.findByJurusan(jurusan);
    var decodedjurusan = jsonDecode(responseJurusan.body);
    var decodedSekolah = jsonDecode(responseSekolah.body);
    var response = await userService.addDataSekolah(
        decodedSekolah['body'][0]['id'], decodedjurusan['body'][0]['id'], id);
    if (response.statusCode == 200) {
      data[1] = "asds";
      return true;
    } else {
      return false;
    }
  }

  addPennghargaan(filename, judul) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var username = sharedPreferences.getString('username');
    EasyLoading.showProgress(status: "Uploading", 0.3);
    var res = await userService.updatePenghargaan(filename, judul, username);
    EasyLoading.dismiss();
    return res;
  }

  Future<bool> addCv() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getInt('id');
    EasyLoading.showProgress(status: "Uploading", 0.3);
    var isUpdate = await userService.updateCv(filename: pathCv.value);
    var responseId = await userService.findById(id);
    pathCv.value = responseId.body[0].cv;
    EasyLoading.dismiss();
    return isUpdate;
  }

  fetchDataCv() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getInt('id');
    print(id);
    var responseUser = await userService.findById(id);
    if (responseUser.body[0].cv != "") {
      pathCv.value = responseUser.body[0].cv;
    }
    print("path cv ${pathCv.value}");
  }

  @override
  void onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await showDataUser();
    await setDataSekolah();
    await setDataJurusan();
    await fetchDataCv();
    print('on init run');
    AnimationController animationController = AnimationController(vsync: this);
    animationController.fling();
    // sekolahService.getDataCari('SMKN 1 Tegalsari');
    if (sharedPreferences.getString('tentang-saya') == null) {
      print('kosong');
    } else {
      data.value[0] = sharedPreferences.getString('tentang-saya')!;
    }
    super.onInit();
    ever(
      skillinteract,
      (callback) {
        showDataUser();
      },
    );
    // ever(penghargaanInteract, (cal) => showDataUser());
  }

  @override
  void dispose() {
    super.dispose();
    judulPenghargaan.text = "";
    sekolahTemp.value = "";
    jurusanTemp.value = "";
  }
}
