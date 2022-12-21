import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_intern/APP/controllers/UserController.dart';
import 'package:go_intern/APP/controllers/location_controller.dart';
import 'package:go_intern/APP/controllers/logincontroller.dart';
import 'package:go_intern/view/page/dashboard.dart';
import 'package:go_intern/view/page/homepage.dart';
import 'package:go_intern/view/page/introduction_screnn.dart';
import 'package:go_intern/view/page/login.dart';
import 'package:go_intern/view/page/lupapassword.dart';
import 'package:go_intern/view/page/profile/keamanan.dart';
import 'package:go_intern/view/page/profile/pendidikan.dart';
import 'package:go_intern/view/page/profile/penghargaan.dart';
import 'package:go_intern/view/page/profile/personal.dart';
import 'package:go_intern/view/page/profile/profile.dart';
import 'package:go_intern/view/page/profile/skill.dart';
import 'package:go_intern/view/page/profile/tentang_saya.dart';
import 'package:go_intern/view/page/recent_apply.dart';

import 'package:go_intern/view/page/register.dart';
import 'package:go_intern/view/splash/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(List<String> args) async {
  await GetStorage.init();
  runApp(GoInternApp());
}

// ignore: must_be_immutable
class GoInternApp extends StatelessWidget {
  GoInternApp({super.key});
  var logC = Get.put(LoginController());
  var locationC = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    checkLogin() async {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var isLogin = sharedPreferences.getBool('login');
      print(isLogin);
      if (isLogin != null) {
        if (isLogin) {
          print("is login true");
          Get.off(HomePageScrenn.new);
        } else {
          print("is login false");
        }
      } else {
        print("is login null");
      }
    }

    return GetMaterialApp(
      theme: ThemeData(fontFamily: "unchen"),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: [
        GetPage(name: "/register", page: RegisterScrenn.new),
        GetPage(name: "/dashboard", page: DashboardScrenn.new),
        GetPage(
            name: "/home",
            page: HomePageScrenn.new,
            transition: Transition.fadeIn),
        GetPage(
            name: "/login",
            page: LoginPage.new,
            transition: Transition.leftToRight),
        GetPage(name: "/tentang-saya", page: TentangSaya.new),
        GetPage(name: "/skill", page: Skill.new),
        GetPage(name: "/penghargaan", page: Penghargaan.new),
        GetPage(
          name: "/forgot-password",
          page: LupaPassword.new,
        ),
        GetPage(
          name: "/pendidikan",
          page: Pendidikan.new,
        ),
        GetPage(name: "/profile", page: ProfilePage.new),
        GetPage(name: "/personal", page: PersonalScrenn.new),
        GetPage(name: "/keamanan", page: KemananScrenn.new),
        GetPage(name: "/recent", page: recent_apply.new)
      ],
      home: FutureBuilder(
        future: Future.delayed(Duration(seconds: 3)),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          } else {
            return const IntroDuctionPage();
          }
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Go Intern"),
        centerTitle: true,
      ),
    );
  }
}
