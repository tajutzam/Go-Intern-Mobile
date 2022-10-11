import 'package:flutter/material.dart';
import 'package:go_intern/helpers/color.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
            child: TextField(
              autocorrect: true,
              decoration: InputDecoration(
                  label: Text("Masukan Password"),
                  filled: true,
                  fillColor: ColorHelpers.fieldColor,
                  border: OutlineInputBorder()),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Lupa Password ?",
              textAlign: TextAlign.end,
              style: TextStyle(color: Color(0xFF004AAD), fontFamily: "Times"),
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
                      primary: ColorHelpers.backgroundBlueNew),
                  onPressed: () {},
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text("Baru di go Intern ? click me"),
          )
        ],
      ),
    );
  }
}
