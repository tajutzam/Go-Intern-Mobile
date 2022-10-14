import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_intern/view/page/detail_magang.dart';
import 'package:go_intern/view/page/homepage.dart';
import 'package:go_intern/view/page/introduction_screnn.dart';
import 'package:go_intern/view/page/login.dart';
import 'package:go_intern/view/page/lupapassword.dart';
import 'package:go_intern/view/page/profile/pendidikan.dart';
import 'package:go_intern/view/page/profile/penghargaan.dart';
import 'package:go_intern/view/page/profile/skill.dart';
import 'package:go_intern/view/page/profile/tentang_saya.dart';
import 'package:go_intern/view/page/register.dart';
import 'package:go_intern/view/splash/splash.dart';

void main(List<String> args) {
  runApp(const GoInternApp());
}

class GoInternApp extends StatelessWidget {
  const GoInternApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: "unchen"),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/forgot-password": (p0) => const LupaPassword(),
        "/register": (p0) => const RegisterScrenn(),
        "/splash": (p0) => const SplashScreen(),
        "/login": (p0) => LoginPage(),
        "/dashboard": (p0) => HomePageScrenn(),
        "/detailmagang": (p0) => DetailMagang(),
        "/tentang-saya": (p0) => TentangSaya(),
        "/pendidikan": (p0) => Pendidikan(),
        "/skill": (p0) => Skill(),
        "/penghargaan": (p0) => Penghargaan()
      },
      home: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 3)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
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
