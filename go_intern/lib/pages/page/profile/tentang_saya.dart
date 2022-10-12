import 'package:flutter/material.dart';
import 'package:go_intern/helpers/color.dart';

class TentangSaya extends StatelessWidget {
  const TentangSaya({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorHelpers.colorNavbarProfile,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
          ),
          color: Colors.black,
        ),
        title: Text(
          "Tentang Saya",
          style: TextStyle(
              color: ColorHelpers.colorBlackText,
              fontFamily: "",
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rincian Tentang Saya",
                  style: TextStyle(
                    color: ColorHelpers.colorBlackText,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  minLines: 6,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      fillColor: ColorHelpers.fieldColor,
                      filled: true,
                      border: InputBorder.none),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    // todo add tentang saya
                  },
                  style: ElevatedButton.styleFrom(
                      primary: ColorHelpers.backgroundBlueNew),
                  child: Text(
                    "Simpan",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Times"),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
