import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_intern/pages/page/introduction_screnn.dart';
import 'package:go_intern/pages/page/login.dart';
import 'package:go_intern/pages/splash/splash.dart';

void main(List<String> args) {
  runApp(const GoInternApp());
}

class GoInternApp extends StatelessWidget {
  const GoInternApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/splash": (p0) => SplashScreen(),
        "/login": (p0) => LoginPage()
      },
      home: FutureBuilder(
        future: Future.delayed(Duration(seconds: 3)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          } else {
            return IntroDuctionPage();
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
