import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

class IntroDuctionPage extends StatelessWidget {
  const IntroDuctionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      next: const Text("Next"),
      done: const Text("Done"),
      showSkipButton: true,
      skip: const Text("Skip"),
      pages: [
        PageViewModel(
          decoration: const PageDecoration(titleTextStyle: TextStyle()),
          titleWidget: const Text(
            "Hai,Selamat Datang",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            textAlign: TextAlign.start,
          ),
          bodyWidget: const Text(
            '''Go intern adalah aplikasi yang memudahkan 
dalam urusan pencarian tempat magang''',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                fontFamily: "Ubuntu-us"),
          ),
          image: Lottie.asset("assets/lotties/woman.json", height: 300),
        ),
        PageViewModel(
          decoration: const PageDecoration(
              titleTextStyle: TextStyle(), bodyAlignment: Alignment.topLeft),
          titleWidget: const Text(
            "Semangat ya. .",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            textAlign: TextAlign.start,
          ),
          bodyWidget: const Text(
            '''Satu di antara kunci penting untuk sukses adalah kepercayaan diri. Kunci penting untuk kepercayaan diri adalah persiapan."

 - Arthur Ashe''',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                fontFamily: "Ubuntu-us"),
          ),
          image: Lottie.asset("assets/lotties/book.json"),
        ),
      ],
      onDone: () {
        Navigator.pushReplacementNamed(context, "/login");
      },
    );
  }
}
