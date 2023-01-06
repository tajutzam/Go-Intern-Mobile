import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:go_intern/helpers/url.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {
  var isHiden1 = true.obs;
  var isHiden2 = true.obs;
  var controller = TextEditingController();

  var usC = TextEditingController();
  var namaC = TextEditingController();
  var passC = TextEditingController();
  var konPasC = TextEditingController();
  var emailC = TextEditingController();
  var tglC = TextEditingController();
  var namaBC = TextEditingController();
  var jenisKelamin = "".obs;

  toogle1() {
    isHiden1.value = !isHiden1.value;
  }

  toogle2() {
    isHiden2.value = !isHiden2.value;
  }

  register() async {
    String urlRegister = "${UrlHelper.baseUrl}/mobile/register";
    var jkvalue;
    if (jenisKelamin.value == "Laki-Laki") {
      jkvalue = "L";
    // ignore: unrelated_type_equality_checks
    } else if (jenisKelamin == "Perempuan") {
      jkvalue = "P";
    }
    Map<String, dynamic> dataRegister = {
      "tanggal_lahir": controller.text.toString(),
      "username": usC.text,
      "passsword": passC.text,
      "email": emailC.text,
      "role": 3,
      "nama_depan": namaC.text,
      "nama_belakang": namaBC.text,
      "jenis_kelamin": jkvalue
    };
   
    var response = await http.post(Uri.parse(urlRegister),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(dataRegister));
    var urlSendEmail = "${UrlHelper.baseUrl}/verivication/${usC.text}";
    Map<String, dynamic> responseData = json.decode(response.body);
    EasyLoading.show(status: "loading . . . ");
    if (responseData['status'] == "oke") {
      var responseSendMail = await http.get(Uri.parse(urlSendEmail));
      Get.snackbar('Success',
          "Berhasil regristasi , harap cek email anda untuk aktifasi",
          backgroundColor: ColorHelpers.colorSnackbar, colorText: Colors.white);
      EasyLoading.dismiss();
      Get.offNamed("/login");
    } else if (responseData['status'] == 'failed') {
      Get.snackbar('Failed', "${responseData['message']}",
          backgroundColor: ColorHelpers.colorSnackbarfailed,
          colorText: Colors.white);
      EasyLoading.dismiss();
    }
  }
}
