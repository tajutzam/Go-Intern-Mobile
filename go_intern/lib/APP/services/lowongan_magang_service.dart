import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/repositories/lowongan_magang_repository.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LowonganMagangService {
  final LowonganMagangRepository lowonganMagangRepository =
      LowonganMagangRepository();

  addLowongan({idMagang, idPenyediaMagang}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getInt('id');
    var response = await lowonganMagangRepository.addLowongan(
        idMagang: idMagang,
        idPencariMagang: id,
        idPenyediaMagang: idPenyediaMagang);
    var responseDecoded = jsonDecode(response.body);
    if (response.statusCode == 200) {
      Get.snackbar('succes', responseDecoded['message'] , colorText: Colors.white , backgroundColor: ColorHelpers.colorSnackbar);
      return true;
    } else {
        Get.snackbar('failed', responseDecoded['message'] , colorText: Colors.white , backgroundColor: ColorHelpers.colorSnackbarfailed);
      return false;
    }
  }
  
}
