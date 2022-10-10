import 'package:flutter/material.dart';
import 'package:go_intern/helpers/color.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelpers.colorSplash,
      body: Center(
        child: Image.asset(
          "assets/images/logo-splash.png",
          height: 307,
        ),
      ),
    );
  }
}
