import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/model/findby_response.dart';
import 'package:go_intern/APP/model/login_response.dart';
import 'package:go_intern/APP/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardController extends GetxController {
  var controller = TextEditingController();
  var foto = "".obs;
  var username = "".obs;
  var interactChange = 0.obs;
  UserService userService = UserService();
  UserResponse? userResponse;

  getDataUser(ys) async {
    print('get data user');
    userResponse = await userService.getDataUser(ys);
    print(userResponse!.body[0].username);
    interactChange.value++;
  }

  @override
  void onInit() async {
    super.onInit();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    username.value = sharedPreferences.getString('username')!;
    print("Foto ku " + sharedPreferences.getString('foto')!);
    if (sharedPreferences.getString('foto') != 'null') {
      foto.value = sharedPreferences.getString('foto')!;
    } else {
      if (sharedPreferences.getString('jenis_kelamin') == 'P') {
        foto.value = "woman.png";
      } else if (sharedPreferences.getString('jenis_kelamin') == 'L') {
        foto.value = "man.png";
      }
    }
    if (userResponse != null) {
      print('login response not null');
    }
    ever(
      interactChange,
      (callback) async {
        print('change');
        foto.value = userResponse!.body[0].foto;
        sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString('foto' , foto.value);
      },
    );
  }

  @override
  void onReady() async {
    super.onReady();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    username.value = sharedPreferences.getString('username')!;
    if (sharedPreferences.getString('foto') != 'null') {
      foto.value = sharedPreferences.getString('foto')!;
    } else {
      if (sharedPreferences.getString('jenis_kelamin') == 'P') {
        foto.value = "woman.png";
      } else if (sharedPreferences.getString('jenis_kelamin') == 'L') {
        foto.value = "man.png";
      }
    }
  }
}
