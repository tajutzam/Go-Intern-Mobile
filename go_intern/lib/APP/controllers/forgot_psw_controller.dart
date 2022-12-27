import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/services/user_service.dart';

class ForgotPasswordController extends GetxController {
  final TextEditingController usernameC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();
  final TextEditingController konfirmasiPasswordC = TextEditingController();
  final TextEditingController otpC = TextEditingController();
  final TextEditingController usernameCP = TextEditingController();

  UserService userService = UserService();

  sendOtp(username) async {
    var response = await userService.sendOtp(username: username);
    return response;
  }

  Future<bool> updatePassword(username, password) async {
    var res =
        await userService.resetPassword(username: username, password: password);
    return res;
  }

  verivikasi(username, otp) async {
    var response = userService.verivikasi(username: username, otp: otp);
    return response;
  }
}
