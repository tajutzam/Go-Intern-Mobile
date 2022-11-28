import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/controllers/UserController.dart';
import 'package:go_intern/APP/controllers/logincontroller.dart';
import 'package:go_intern/helpers/color.dart';

class TentangSaya extends StatelessWidget {
  TentangSaya({super.key});
  final tentC = Get.put(UserController());
  var formC = GlobalKey<FormState>();
  final logC = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    var temp = tentC.ttgSayaC.text;
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
      body: ListView(
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
                Form(
                  key: formC,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Tentang saya tidak boleh kosong";
                      } else if (value.length < 10) {
                        return "Tentang saya tidak boleh kurang dari 10 huruf";
                      } else if (value == temp) {
                        return "tidak ada perubahan data";
                      } else {}
                    },
                    controller: tentC.ttgSayaC,
                    minLines: 6,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        hintText: "Masukan tentang saya maksimal 222 huruf",
                        fillColor: ColorHelpers.fieldColor,
                        filled: true,
                        border: InputBorder.none),
                  ),
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
                onPressed: () async {
                  // todo add tentang saya
                  if (formC.currentState!.validate()) {
                    print('update');
                    bool isSucces = await tentC.updateTentangSaya();
                    if (isSucces) {
                      Get.snackbar(
                          'Succes', 'Berhasil Memperbarui Tentang saya',
                          backgroundColor: ColorHelpers.colorNavbarProfile);
                      logC.interactTentangSaya.value++;
                      Future.delayed(
                        Duration(seconds: 2),
                        () {
                          Navigator.of(context).pop();
                        },
                      );
                    } else {
                      Get.snackbar('Failed', 'Gagal  Memperbarui Tentang saya',
                          backgroundColor: ColorHelpers.colorNavbarProfile);
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                    primary: ColorHelpers.backgroundBlueNew),
                child: Text(
                  "Simpan",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Times"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
