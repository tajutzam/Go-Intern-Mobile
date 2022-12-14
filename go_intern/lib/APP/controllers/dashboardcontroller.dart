import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/controllers/UserController.dart';
import 'package:go_intern/APP/model/findById_response.dart';
import 'package:go_intern/APP/model/findby_response.dart';
import 'package:go_intern/APP/model/kategori_response.dart';
import 'package:go_intern/APP/model/login_response.dart';
import 'package:go_intern/APP/model/penyedia_response.dart';
import 'package:go_intern/APP/services/kategori_service.dart';
import 'package:go_intern/APP/services/penyedia_service.dart';
import 'package:go_intern/APP/services/user_service.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/magang_penyedia.dart';

class DashboardController extends GetxController {
  var controller = TextEditingController();
  var foto = "woman.png".obs;
  var username = "".obs;

  var interactChange = 0.obs;
  var dataSekolahIfexist = {}.obs;
  UserService userService = UserService();
  UserResponse? userResponse;
  var useC = Get.put(UserController());
  PenyediaService penyediaService = PenyediaService();
  List<BodyPenyedia> dataPopular = [];
  List<KategoriBody> kategory = [];
  KategoriService kategoriService = KategoriService();

  getKategori() async {
    var response = await kategoriService.findAll();
    if (response != null) {
      response.body.forEach((element) {
        kategory.add(element);
      });
    }
  }

  getDataUser(ys, filename, path) async {
    var resBol = await useC.uploadImage(filename, path);
    if (resBol) {
      Get.snackbar('success', 'Berhasil mengganti foto profile',
          colorText: Colors.white, backgroundColor: ColorHelpers.colorSnackbar);
    } else {
      Get.snackbar('failed', 'Gagal mengganti foto profile',
          colorText: Colors.white,
          backgroundColor: ColorHelpers.colorSnackbarfailed);
    }
  }

  Future getPopularPenyedia() async {
    Penyedia response = await penyediaService.getDataPopular();
    for (var element in response.body) {
      dataPopular.add(element);
    }
    return response;
  }

  Future<MagangPenyedia?> getDataMagangPenyedia(id) async {
    var response = await penyediaService.getDataMagangPenyedia(id);
    if (response != null) {
      return response;
    }
    return null;
  }

  checkFoto() async {
    print('print check foto');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getInt('id');
    var datauser = await userService.findById(id);
    if (datauser.body[0].foto == "") {
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
      print('foto in if');
      print(datauser.body[0].foto);
      foto.value = datauser.body[0].foto;
    }
  }

  @override
  void onInit() async {
    getKategori();
    getPopularPenyedia();
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
    ever(interactChange, (callback) async {
      print('callback');
      await checkFoto();
      await checkFoto();
    });
    super.onInit();
  }

  // @override
  // void onReady() async {
  //   // checkFoto();
  //   print('on reader');
  //   super.onReady();
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   print("${sharedPreferences.getString('foto')} / foto");
  //   if (sharedPreferences.getString('foto') != 'null') {
  //     var fototemp;
  //     if (sharedPreferences.getString('foto') != null) {
  //       fototemp = sharedPreferences.getString('foto');
  //     }
  //     foto.value = fototemp ?? "";
  //   } else if (sharedPreferences.getString('jenis_kelamin') != null) {
  //     print('mi;asds');
  //     if (sharedPreferences.getString('jenis_kelamin') == 'P') {
  //       foto.value = "woman.png";
  //     } else if (sharedPreferences.getString('jenis_kelamin') == 'L') {
  //       foto.value = "man.png";
  //     }
  //   } else {
  //     print('jenis kelamin null');
  //   }
  //   ever(
  //     interactChange,
  //     (callback) async {
  //       print('callback');
  //       checkFoto();
  //       // print('change');
  //       // SharedPreferences sharedPreferences =
  //       //     await SharedPreferences.getInstance();
  //       // var id = sharedPreferences.getInt('id');
  //       // print(id);
  //       // UserFindByIdResponse user = await userService.findById(id);
  //       // print(user.body[0].foto);
  //       // sharedPreferences.setString('foto', user.body[0].foto);
  //       // foto.value = sharedPreferences.getString('foto')!;
  //     },
  //   );
  // }
}
