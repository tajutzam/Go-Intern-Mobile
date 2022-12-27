import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/controllers/forgot_psw_controller.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:go_intern/view/page/forget_password/LP_otp.dart';

// ignore: must_be_immutable
class LupaPassword extends StatelessWidget {
  LupaPassword({super.key});
  final _form = GlobalKey<FormState>();
  var forgotC = Get.put(ForgotPasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.asset(
            "assets/images/forgot-password-icon.png",
            height: 250,
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Lupa Password",
              style: TextStyle(fontSize: 30, fontFamily: "Times"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Text(
              '''Jangan kawatir , kamu cukup memasukan username kamu dan kami akan mengirimkan otp di email kamu ''',
              style: TextStyle(fontFamily: "ubuntu", fontSize: 17),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: _form,
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "username tidak boleh kosong";
                  }
                },
                controller: forgotC.usernameC,
                autocorrect: true,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorHelpers.fieldColor,
                    labelText: "Username",
                    hintText: "Masukan Username",
                    labelStyle: TextStyle(fontSize: 20),
                    border: OutlineInputBorder()),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorHelpers.backgroundBlueNew),
                onPressed: () async {
                  // todolist Cek Email valid or no
                  EasyLoading.show(status: "Tunggu sebentar . . .");
                  var res = await forgotC.sendOtp(forgotC.usernameC.text);
                  if (res) {
                    EasyLoading.dismiss();
                    Get.snackbar('success', "Berhasil mengirim OTP",
                        backgroundColor: ColorHelpers.colorSnackbar,
                        colorText: Colors.white);
                    Get.off(LpOtp.new, arguments: forgotC.usernameC.text);
                  } else {
                    EasyLoading.dismiss();
                    Get.snackbar('Failed', "gagal mengirim OTP",
                        backgroundColor: ColorHelpers.colorSnackbarfailed,
                        colorText: Colors.white);
                  }
                  //  Get.to(LpOtp.new, arguments: forgotC.usernameC.text);
                },
                child: Text(
                  "Kirim",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
