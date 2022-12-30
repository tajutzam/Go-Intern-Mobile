import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/model/findById_response.dart';
import 'package:go_intern/APP/services/user_service.dart';
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
    if (passwordBaruC.text != konfirmasiPasswordC.text) {
      Get.snackbar('Failed', 'Konfirmasi password harus sama');
      return false;
    } else {
      if (passwordBaruC.text.isEmpty) {
        var response =
            userService.updateDataKeamanan(usernameC.text, passwordLama.value);
            print("${response}keamanan");
        return response;
      } else {
        var response =
            userService.updateDataKeamanan(usernameC.text, passwordBaruC.text);
                print("${response}keamanan");
        return response;
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
