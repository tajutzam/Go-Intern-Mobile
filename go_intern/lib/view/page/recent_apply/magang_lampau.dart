import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:go_intern/helpers/color.dart';

class MagangLampau extends StatelessWidget {
  var dataAda = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: dataAda == false
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 250,
                      height: 250,
                      child: Lottie.asset("assets/lotties/thinking.json")),
                ],
              ),
            )
          : Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 0.5,
                      offset: Offset(5, 5),
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ]),
              child: ListTile(
                contentPadding: EdgeInsets.all(10.0),
                leading: FlutterLogo(),
                title: Text("Product desaigner",
                    style: TextStyle(
                        fontFamily: 'UbuntuCondensed',
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                subtitle: Text("magang product designer",
                    style:
                        TextStyle(fontFamily: 'UbuntuCondensed', fontSize: 10)),
                trailing: SizedBox(
                  height: 30,
                  width: 140,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorHelpers.backgroundBlueNew),
                      onPressed: () {
                        Navigator.pushNamed(context, "/detailmagang");
                      },
                      child: Text("Detail Magang")),
                ),
              ),
            ),
    );
  }
}
