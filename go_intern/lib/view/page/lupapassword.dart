import 'package:flutter/material.dart';
import 'package:go_intern/helpers/color.dart';

class LupaPassword extends StatelessWidget {
  const LupaPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.asset(
            "assets/images/forgot-password-icon.png",
            height: 250,
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Lupa Password",
              style: TextStyle(fontSize: 30, fontFamily: "Times"),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Text(
              '''Jangan khawatir , kami akan
mengirimkan kode otp ke email yang 
sudah terdaftar''',
              style: TextStyle(fontFamily: "ubuntu", fontSize: 17),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              autocorrect: true,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: ColorHelpers.fieldColor,
                  labelText: "Email",
                  labelStyle: TextStyle(fontSize: 20),
                  border: OutlineInputBorder()),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorHelpers.backgroundBlueNew),
                onPressed: () {
                  // todolist Cek Email valid or no
                  Navigator.pushReplacementNamed(context, "/login");
                },
                child: Text(
                  "Kirim",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
