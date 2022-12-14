import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/controllers/UserController.dart';
import 'package:go_intern/APP/controllers/keamananController.dart';
import 'package:go_intern/APP/controllers/logincontroller.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:go_intern/view/page/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KemananScrenn extends StatelessWidget {
  KemananScrenn({super.key});
  final keamananC = Get.put(KeamananController());
  final _form = GlobalKey<FormState>();
  var logC = Get.find<LoginController>();
  var usC = Get.find<UserController>();
  var botC = Get.find<ControllerBottom>();
  @override
  Widget build(BuildContext context) {
    print('render');
    keamananC.fetchData();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Keamanan',
          style: TextStyle(
              fontSize: 20,
              fontFamily: 'poppins',
              fontWeight: FontWeight.w500,
              color: ColorHelpers.colorBlackText),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: ColorHelpers.colorBlackText,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Form(
                key: _form,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      controller: keamananC.usernameC,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username tidak boleh kosong";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Username',
                          hintText: 'Input Username',
                          fillColor: ColorHelpers.fieldColor,
                          filled: true,
                          border: InputBorder.none),
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    TextFormField(
                      controller: keamananC.passwordLamaC,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password tidak boleh kosong";
                        } else {
                          return null;
                        }
                      },
                      readOnly: true,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Password lama',
                          fillColor: ColorHelpers.fieldColor,
                          filled: true,
                          border: InputBorder.none),
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    Obx(
                      () => TextFormField(
                        controller: keamananC.passwordBaruC,
                        obscureText: keamananC.showPwb.value,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  print(keamananC.showPwb.value);
                                  keamananC.toogleB();
                                },
                                icon: keamananC.showPwb.value
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility)),
                            labelText:
                                'Masukan Passsword , untuk mengganti password',
                            hintText:
                                'Masukan Password baru , untuk mengganti password',
                            fillColor: ColorHelpers.fieldColor,
                            filled: true,
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    Obx(
                      () => TextFormField(
                        controller: keamananC.konfirmasiPasswordC,
                        obscureText: keamananC.showPwK.value,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  print(keamananC.showPwK.value);
                                  keamananC.toogleK();
                                },
                                icon: keamananC.showPwK.value
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility)),
                            labelText: 'konfirmasi Password',
                            hintText: 'Masukan konfirmasi Password',
                            fillColor: ColorHelpers.fieldColor,
                            filled: true,
                            border: InputBorder.none),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorHelpers.backgroundBlueNew),
                onPressed: () async {
                  if (_form.currentState!.validate()) {
                    var response = await keamananC.updateKeamanan();
                    if (response) {
                      SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();
                      var isClear = await sharedPreferences.clear();
                      sharedPreferences.remove('nama');
                      // ignore: use_build_context_synchronously
                      if (isClear) {
                        logC.logout();
                        logC.dispose();
                        usC.dispose();
                        botC.tabIndex.value = 0;
                        Get.offNamed("/login");
                      }
                    }
                  }
                },
                child: Text(
                  'Simpan',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontFamily: 'poppins'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
