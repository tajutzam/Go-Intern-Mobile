import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_intern/helpers/color.dart';

class LoginPage extends GetWidget<ValidasiController> {
  var controller = Get.put(ValidasiController());
  @override
  Widget build(BuildContext context) {
    var isHidden = true;
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              autocorrect: true,
              decoration: InputDecoration(
                  label: Text("Masukan Username"),
                  filled: true,
                  fillColor: ColorHelpers.fieldColor,
                  border: OutlineInputBorder()),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Obx(
              () => TextField(
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
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off)),
                    label: Text("Masukan Password"),
                    filled: true,
                    fillColor: ColorHelpers.fieldColor,
                    border: OutlineInputBorder()),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Lupa Password ?",
              textAlign: TextAlign.end,
              style: TextStyle(color: Color(0xFF004AAD), fontFamily: "Times"),
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
                  onPressed: () {},
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
              child: RichText(
                  text: TextSpan(children: [
                const TextSpan(
                  text: "Baru Di Go Intern?",
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: "Click Me",
                  style: TextStyle(color: ColorHelpers.backgroundBlueNew),
                )
              ])),
            ),
          )
        ],
      ),
    );
  }
}

class ValidasiController extends GetxController {
  var isObsecure = true.obs;
}
