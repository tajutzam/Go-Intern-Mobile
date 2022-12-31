import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/controllers/UserController.dart';
import 'package:go_intern/APP/model/findby_response.dart';
import 'package:go_intern/APP/model/kategori_response.dart';
import 'package:go_intern/APP/model/magang_limit_response.dart';
import 'package:go_intern/APP/model/penyedia_response.dart';
import 'package:go_intern/APP/services/kategori_service.dart';
import 'package:go_intern/APP/services/magang_service.dart';
import 'package:go_intern/APP/services/penyedia_service.dart';
import 'package:go_intern/APP/services/user_service.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/user_response.dart';

import '../model/magang_penyedia.dart';

class DashboardController extends GetxController {
  var controller = TextEditingController();
  var foto = "woman.png".obs;
  MagangService magangService = MagangService();
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

  var nama = "".obs;

  List<MagangLimitBody> dataMagangLimit = [];

  Future<Kategori> getKategori() async {
    var response = await kategoriService.findAll();
    return response;
  }

  getDataUser(ys, filename, path) async {
    EasyLoading.showProgress(status: "Uploading", 0.3);
    var resBol = await useC.uploadImage(filename, path);
    if (resBol) {
      EasyLoading.dismiss();
      Get.snackbar('success', 'Berhasil mengganti foto profile',
          colorText: Colors.white, backgroundColor: ColorHelpers.colorSnackbar);
      checkFoto();
    } else {
      EasyLoading.dismiss();
      Get.snackbar('failed', 'Gagal mengganti foto profile',
          colorText: Colors.white,
          backgroundColor: ColorHelpers.colorSnackbarfailed);
    }
    EasyLoading.dismiss();
  }

  // getFotoUser() async {
  //   Datauser? user = await userService.showDataUser();
  //   if (user != null) {
  //     var fotoData = user.body[0].foto;
  //     // ignore: unnecessary_null_comparison
  //     if (fotoData != null) {
  //       foto.value = user.body[0].foto;
  //     } else {
  //       var jk = user.body[0].jenisKelamin;
  //       if (jk == "P") {
  //         foto.value = "woman.png";
  //       } else {
  //         foto.value = "man.png";
  //       }
  //     }
  //   }
  // }

  Future<Penyedia?> getPopularPenyedia() async {
    Penyedia? response = await penyediaService.getDataPopular();
    // for (var element in response!.body) {
    //   dataPopular.add(element);
    // }
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
    var datauser = await userService.showDataUser();
    if (datauser?.body[0].foto == "null") {
      var jk = datauser!.body[0].jenisKelamin;
      if (jk == "L") {
        foto.value = "man.png";
      } else {
        foto.value = "woman.png";
      }
    } else {
      // print('foto in if');
      // print(datauser.body[0].foto);
      foto.value = datauser!.body[0].foto;
    }
  }

  Future<MagangLimit1?> getMagangLimit() async {
    MagangLimit1? data = await magangService.showMagangLimit();
    return data;
  }

  showDataUser() async {
    Datauser? userData = await userService.showDataUser();
    if (userData != null) {
      nama.value = userData.body[0].nama;
    } else {
      print("user null");
    }
  }

  @override
  void onInit() async {
    showDataUser();
    getMagangLimit();
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
