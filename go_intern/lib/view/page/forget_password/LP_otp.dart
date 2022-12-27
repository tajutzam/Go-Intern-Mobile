import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/controllers/forgot_psw_controller.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:go_intern/view/page/forget_password/LP_update.dart';
import 'package:lottie/lottie.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class LpOtp extends StatelessWidget {
  LpOtp({super.key});
  final _form = GlobalKey<FormState>();
  final forgotC = Get.put(ForgotPasswordController());
  var username = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelpers.backgroundOfIntroduction,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: Lottie.asset(
                "assets/lotties/otp.json",
                height: 200,
              ),
            ),
            SizedBox(height: 100),
            Text(
              "Check email kamu , dan masukan otp yang sudah kamu terima lewat email ",
              style: TextStyle(
                  fontSize: 17,
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 30,
            ),
            OTPTextField(
              width: double.infinity,
              length: 4,
              fieldWidth: 45,
              otpFieldStyle: OtpFieldStyle(
                  enabledBorderColor: ColorHelpers.colorBlackText,
                  borderColor: ColorHelpers.colorBlackText),
              style: TextStyle(fontSize: 17),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.underline,
              onChanged: print,
              onCompleted: (pin) async {
                var res = await forgotC.verivikasi(username, pin);
                EasyLoading.show(status: "Tunggu sebentar . . .");
                if (res) {
                  EasyLoading.dismiss();
                  Get.off(UpdateLupaPassword.new, arguments: username);
                } else {
                  Get.snackbar("Failed", "Kode otp tidak sesuai",
                      backgroundColor: ColorHelpers.colorSnackbarfailed,
                      colorText: Colors.white);
                  EasyLoading.dismiss();
                }
              },
            ),
            // Form(
            //     key: _form,
            //     child: TextFormField(
            //       controller: forgotC.otpC,
            //       keyboardType: TextInputType.number,
            //       validator: (value) {
            //         if (value!.isEmpty) {
            //           return "OTP tidak boleh kosong";
            //         } else if (value.length != 4) {
            //           return "Panjang otp harus 4";
            //         }
            //       },
            //       decoration: InputDecoration(
            //           border: OutlineInputBorder(),
            //           labelText: "OTP",
            //           hintText: "Masukan Kode OTP"),
            //     )),
            // SizedBox(
            //   height: 30,
            // ),
            // ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //         backgroundColor: ColorHelpers.backgroundBlueNew),
            //     onPressed: () async {
            //       if (_form.currentState!.validate()) {}
            //     },
            //     child: Text("Verivikasi"))
          ],
        ),
      ),
    );
  }
}
