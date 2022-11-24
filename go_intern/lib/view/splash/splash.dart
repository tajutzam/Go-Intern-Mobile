import 'package:flutter/material.dart';
import 'package:go_intern/helpers/color.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorHelpers.colorNavbarProfile , 
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ColorHelpers.backgroundBlueNew , 
              Colors.white
            ]
          )
        ),
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
