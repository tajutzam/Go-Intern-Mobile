import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/model/user_response.dart';
import 'package:go_intern/APP/services/user_service.dart';

class PersonalController extends GetxController {
  final namalengkapC = TextEditingController();
  final emaillengkapC = TextEditingController();
  final tanggalLahirC = TextEditingController();
  final agamaC = TextEditingController();
  final jenisKelaminC = TextEditingController();
  final UserService userService = UserService();
  var jenisKelamin = "".obs;

  fetchdataUser() async {
    Datauser? userData = await userService.showDataUser();
    if (userData != null) {
      if (userData.body[0].jenisKelamin == "L") {
        jenisKelaminC.text = "Laki-Laki";
      } else if (userData.body[0].jenisKelamin == "P") {
        jenisKelaminC.text = "Perempuan";
      }
      jenisKelamin.value = userData.body[0].jenisKelamin;
      namalengkapC.text = userData.body[0].nama;
      emaillengkapC.text = userData.body[0].email;
      tanggalLahirC.text = userData.body[0].tanggalLahir;
      if (userData.body[0].agama == "not set") {
      } else {
        agamaC.text = userData.body[0].agama;
      }
    } else {
    }
  }

  updateDataPersonal() async {
    var response = await userService.updateDataPersonal(
        name: namalengkapC.text,
        agama: agamaC.text,
        email: emaillengkapC.text,
        jenisKelamin: jenisKelamin.value,
        tanggalLahir: tanggalLahirC.text);
    return response;
  }
}
