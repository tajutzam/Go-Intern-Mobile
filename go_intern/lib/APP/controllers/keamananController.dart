import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/model/findById_response.dart';
import 'package:go_intern/APP/services/user_service.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KeamananController extends GetxController {
  final usernameC = TextEditingController();
  final passwordLamaC = TextEditingController();
  final passwordBaruC = TextEditingController();
  final konfirmasiPasswordC = TextEditingController();
  final UserService userService = UserService();
  final passwordLama = "".obs;

  var showPwb = false.obs;
  var showPwK = false.obs;

  toogleB() {
    showPwb.value = !showPwb.value;
  }

  toogleK() {
    showPwK.value = !showPwK.value;
  }
  fetchData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getInt('id');
    UserFindByIdResponse userResponse = await userService.findById(id);
    usernameC.text = userResponse.body[0].username;
    var pw = sharedPreferences.getString('passwordData');
    passwordLama.value = pw!;
  }

  Future<bool> updateKeamanan() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var userNam = sharedPreferences.getString('username');
    if (usernameC.text != userNam &&
        passwordBaruC.text.isEmpty &&
        konfirmasiPasswordC.text.isEmpty) {
      EasyLoading.show(status: 'Tunggu sebentar . . .');
      EasyLoading.dismiss();
      return await userService.updateDataKeamanan(
          usernameC.text, passwordBaruC.text);
    } else if (usernameC.text == userNam &&
        passwordBaruC.text.isEmpty &&
        konfirmasiPasswordC.text.isEmpty) {
      EasyLoading.dismiss();
      Get.snackbar('failed', 'Tidak ada perubahan data',
          backgroundColor: ColorHelpers.colorSnackbarfailed,
          colorText: Colors.white);
      return false;
    } else if (usernameC.text == userNam && passwordBaruC.text.isNotEmpty) {
      if (konfirmasiPasswordC.text.isEmpty) {
        Get.snackbar('Failed', "Harap isi Konfirmasi password",
            backgroundColor: ColorHelpers.colorSnackbarfailed,
            colorText: Colors.white);
        EasyLoading.dismiss();
        return false;
      } else {
        if (passwordBaruC.text == konfirmasiPasswordC.text) {
          if (passwordBaruC.text == passwordLama.value) {
            Get.snackbar('Failed', "Tidak ada perubahan password",
                backgroundColor: ColorHelpers.colorSnackbarfailed,
                colorText: Colors.white);
            EasyLoading.dismiss();
            return false;
          } else {
            EasyLoading.show(status: "Tunggu sebentar . . .");
            EasyLoading.dismiss();
            return await userService.updatePasswordById(
                password: passwordBaruC.text);
          }
        } else {
          print("As");
          Get.snackbar('failed', 'Password harus sama',
              backgroundColor: ColorHelpers.colorSnackbarfailed,
              colorText: Colors.white);
          return false;
        }
      }
    } else {
      if (passwordBaruC.text == konfirmasiPasswordC.text) {
        await userService.updateDataKeamanan(
            usernameC.text, passwordBaruC.text);
        await userService.updatePasswordById(password: passwordBaruC.text);
        return true;
      } else {
        return false;
      }
    }
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var username = sharedPreferences.getString('username');
    usernameC.text = username!;
    passwordLamaC.text = "is obsecure";
    fetchData();
  }
}
