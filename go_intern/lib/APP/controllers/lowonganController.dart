import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/services/lowongan_magang_service.dart';
import 'package:go_intern/APP/services/user_service.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LowonganController extends GetxController {
  final LowonganMagangService lowonganMagangService = LowonganMagangService();
  final TextEditingController noHpC = TextEditingController();
  final UserService userService = UserService();
  var noHp = 0.obs;
  var cv = "".obs;
  var penghargaan = 0.obs;
  var sekolah = 0.obs;
  var jurusan = 0.obs;
  var skill = "".obs;
  var tentangSaya = "".obs;

  final TextEditingController suratLamaran = TextEditingController();

  addLowongan({idMagang, idPenyediaMagang}) async {
    var response = await lowonganMagangService.addLowongan(
        idMagang: idMagang, idPenyediaMagang: idPenyediaMagang);
    updateSuratLowongan();
    fetchDataToLowongan();
    return response;
  }

  addCv() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getInt('id');
    print(cv.value);
    await userService.updateCv(filename: cv.value);
    var responseId = await userService.findById(id);
    cv.value = responseId.body[0].cv;
  }

  updateSuratLowongan() async {
    userService.updateSuratLamaran(suratLamaran: suratLamaran.text);
  }

  fetchDataToLowongan() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getInt('id');
    var response = await userService.findById(id);
    noHp.value = response.body[0].noTelp;
    cv.value = response.body[0].cv;
    sekolah.value = response.body[0].sekolah;
    jurusan.value = response.body[0].jurusan;
    suratLamaran.text = response.body[0].suratLamaran;
    penghargaan.value = response.body[0].penghargaan;
    tentangSaya.value = response.body[0].tentangSaya;
    if (noHp.value == 0) {
    } else {
      noHpC.text = noHp.value.toString();
    }
  }

  checkBeforeSend() {
    if (jurusan.value == 0) {
      Get.snackbar('failed', 'Harap lengkapi data jurusan terlebih dahulu',
          colorText: Colors.white,
          backgroundColor: ColorHelpers.colorSnackbarfailed);
      return false;
    } else if (cv.value == "") {
      Get.snackbar('failed', 'Harap lengkapi data cv terlebih dahulu',
          colorText: Colors.white,
          backgroundColor: ColorHelpers.colorSnackbarfailed);
      return false;
    } else if (sekolah.value == 0) {
      Get.snackbar('failed', 'Harap lengkapi data sekolah terlebih dahulu',
          colorText: Colors.white,
          backgroundColor: ColorHelpers.colorSnackbarfailed);
      return false;
    } else if (penghargaan.value == 0) {
      Get.snackbar(
          'failed', 'Harap lengkapi sertivikat Penghargaan terlebih dahulu',
          colorText: Colors.white,
          backgroundColor: ColorHelpers.colorSnackbarfailed);
      return false;
    } else if (tentangSaya.value == "") {
      Get.snackbar(
          'failed', 'Harap lengkapi Tentang Saya terlebih dahulu',
          colorText: Colors.white,
          backgroundColor: ColorHelpers.colorSnackbarfailed);
      return false;
    } else {
      return true;
    }
  }

  updateNoHp(noHp) async {
    await userService.updateNoHp(noHp);
  }

  @override
  void onInit() async {
    super.onInit();
    print('on');
    fetchDataToLowongan();
  }
}
