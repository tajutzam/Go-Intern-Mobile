import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/controllers/forgot_psw_controller.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:lottie/lottie.dart';

class UpdateLupaPassword extends StatelessWidget {
  UpdateLupaPassword({super.key});
  var username = Get.arguments;
  var forgotC = Get.put(ForgotPasswordController());
  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelpers.backgroundOfIntroduction,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: ListView(
          children: [
            Center(
              child: Lottie.asset("assets/lotties/password.json",
                  repeat: false, height: 350),
            ),
            SizedBox(
              height: 10,
            ),
            Form(
              key: _form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Perbarui Password Kamu",
                    style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password tidak boleh kosong";
                      }
                      return null;
                    },
                    controller: forgotC.passwordC,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Password",
                        hintText: "Masukan Password"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Konfirmasi Password tidak boleh kosong";
                      } else if (value != forgotC.passwordC.text) {
                        return "Password harus sama";
                      }
                      return null;
                    },
                    controller: forgotC.konfirmasiPasswordC,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Konfirmasi Password",
                        hintText: "Masukan Konfirmasi Password"),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorHelpers.backgroundBlueNew),
                        onPressed: () async {
                          if (_form.currentState!.validate()) {
                            var res = await forgotC.updatePassword(
                                username, forgotC.passwordC.text);
                            EasyLoading.show(status: "Tunggu sebentar . . .");
                            if (res) {
                              Get.snackbar('success',
                                  "berhasil memperbarui pasword silahkan login",
                                  backgroundColor: ColorHelpers.colorSnackbar,
                                  colorText: Colors.white);
                              Get.offNamed("/login");
                              EasyLoading.dismiss();
                            } else {
                              Get.snackbar('failed',
                                  "Gagak memperbarui pasword Terjadi kesalahan",
                                  backgroundColor:
                                      ColorHelpers.colorSnackbarfailed,
                                  colorText: Colors.white);
                              EasyLoading.dismiss();
                            }
                          }
                        },
                        child: Text("Simpan")),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
