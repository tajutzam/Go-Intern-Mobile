import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final usC = TextEditingController();
  final passC = TextEditingController();

  login() async {
    //  login api
    Get.offNamed("/home");
  }
}
