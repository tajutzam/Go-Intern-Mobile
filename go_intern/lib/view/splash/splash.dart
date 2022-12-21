import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_intern/helpers/color.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  // var splashC = Get.put(SplashCon                          troller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            color: ColorHelpers.colorNavbarProfile,
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [ColorHelpers.backgroundBlueNew, Colors.white])),
        child: Center(
          child: Image.asset(
            "assets/images/logo-splash.png",
            height: 307,
          ),
        ),
      ),
    );
  }
}

// class SplashController extends GetxController {
//   @override
//   void onInit() async {
//     super.onInit();
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     var islogin = sharedPreferences.getBool('login');
//     if (islogin != null && islogin) {
//       Get.toNamed("/home");
//     }
//   }
// }
