import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/controllers/logincontroller.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:validators/validators.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.put(ValidasiControllers());
  final loginController = Get.put(LoginController());
  GlobalKey<FormState> formlogin = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelpers.backgroundColorValidasi,
      body: ListView(
        children: [
          Image.asset(
            "assets/images/login-icon.png",
            height: 300,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Login",
              style: TextStyle(fontSize: 40, fontFamily: "Times"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Form(
            key: formlogin,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: loginController.usC,
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "Username tidak boleh kosong";
                      } else if (!isUppercase(value![0])) {
                        return "Username harus di awali dengan huruf kapital";
                      }
                      return null;
                    },
                    autocorrect: true,
                    decoration: InputDecoration(
                        label: Text("Masukan Username"),
                        filled: true,
                        fillColor: ColorHelpers.fieldColor,
                        border: OutlineInputBorder()),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Obx(
                    () => TextFormField(
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "Password tidak boleh kosong";
                        }
                      },
                      controller: loginController.passC,
                      obscureText: controller.isObsecure.value,
                      autocorrect: false,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                print(controller.isObsecure.value);
                                controller.isObsecure.value =
                                    !controller.isObsecure.value;
                              },
                              icon: controller.isObsecure.value
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility)),
                          label: Text("Masukan Password"),
                          filled: true,
                          fillColor: ColorHelpers.fieldColor,
                          border: OutlineInputBorder()),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: InkWell(
              onTap: () => Get.toNamed("/forgot-password"),
              child: Text(
                "Lupa Password ?",
                textAlign: TextAlign.end,
                style: TextStyle(color: Color(0xFF004AAD), fontFamily: "Times"),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: ColorHelpers.backgroundBlueNew),
                  onPressed: () async {
                    if (formlogin.currentState!.validate()) {
                      var response = await loginController.login();
                      print(response);
                    }

                    // Get.offNamed("/home");
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: InkWell(
              onTap: () => Get.toNamed("/register"),
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Baru Di Go Intern?",
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: "Click Me",
                      style: TextStyle(color: ColorHelpers.backgroundBlueNew),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ValidasiControllers extends GetxController {
  var isObsecure = true.obs;
}
