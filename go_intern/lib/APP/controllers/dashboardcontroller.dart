import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/controllers/UserController.dart';
import 'package:go_intern/APP/model/findById_response.dart';
import 'package:go_intern/APP/model/findby_response.dart';
import 'package:go_intern/APP/model/login_response.dart';
import 'package:go_intern/APP/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardController extends GetxController {
  var controller = TextEditingController();
  var foto = "woman.png".obs;
  var username = "".obs;

  var interactChange = 0.obs;
  var dataSekolahIfexist = {}.obs;
  UserService userService = UserService();
  UserResponse? userResponse;
  var useC = Get.put(UserController());
  getDataUser(ys, filename, path) async {
    print('get data user');
    await useC.uploadImage(filename, path);
    var userResponse = await userService.getDataUser(ys);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var boolres = await sharedPreferences.remove('foto');
    print(boolres);
    sharedPreferences.setString('foto', userResponse.body[0].foto);
    print(sharedPreferences.getString('foto'));
    interactChange.value++;
  }

  @override
  void onInit() async {
    print('run on init , dash');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print(sharedPreferences.getInt('id'));
    if (sharedPreferences.getString('foto') != 'null') {
      print('masuk ke if pertama');
      print("ini adalah foto di shared ${sharedPreferences.getString('foto')}");
      if (sharedPreferences.getString('foto') != null) {
        foto.value = sharedPreferences.getString('foto')!;
      }
    } else {
      print(sharedPreferences.getString('jenis_kelamin'));
      if (sharedPreferences.getString('jenis_kelamin') == 'P') {
        foto.value = "woman.png";
      } else if (sharedPreferences.getString('jenis_kelamin') == 'L') {
        foto.value = "man.png";
      }
    }
    super.onInit();
  }

  checkFoto() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print("${sharedPreferences.getString('foto')} / foto");
    if (sharedPreferences.getString('foto') == 'null') {
      print('mull if');
      if (sharedPreferences.getString('jenis_kelamin') != null) {
        print('mi;asds');
        if (sharedPreferences.getString('jenis_kelamin') == 'P') {
          foto.value = "woman.png";
        } else if (sharedPreferences.getString('jenis_kelamin') == 'L') {
          foto.value = "man.png";
        }
      } else {
        print('jenis kelamin null');
      }
    } else {
      foto.value = sharedPreferences.getString('foto')!;
    }
  }

  @override
  void onReady() async {
    print('on reader');
    super.onReady();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print("${sharedPreferences.getString('foto')} / foto");
    if (sharedPreferences.getString('foto') != 'null') {
      print('mull if');
      var fototemp;
      if (sharedPreferences.getString('foto') != null) {
        fototemp = sharedPreferences.getString('foto');
      }
      foto.value = fototemp ?? "";
    } else if (sharedPreferences.getString('jenis_kelamin') != null) {
      print('mi;asds');
      if (sharedPreferences.getString('jenis_kelamin') == 'P') {
        foto.value = "woman.png";
      } else if (sharedPreferences.getString('jenis_kelamin') == 'L') {
        foto.value = "man.png";
      }
    } else {
      print('jenis kelamin null');
    }
    ever(
      interactChange,
      (callback) async {
        print('change');
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        var id = sharedPreferences.getInt('id');
        print(id);
        UserFindByIdResponse user = await userService.findById(id);
        print(user.body[0].foto);
        sharedPreferences.setString('foto', user.body[0].foto);
        foto.value = sharedPreferences.getString('foto')!;
      },
    );
  }
}
