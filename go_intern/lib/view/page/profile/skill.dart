import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/controllers/SkillController.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class Skill extends StatelessWidget {
  Skill({super.key});

  var skilC = Get.put(SkillController());
  final _form = GlobalKey<FormState>();

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
          "Skill Saya",
          style: TextStyle(
              color: ColorHelpers.colorBlackText,
              fontFamily: "",
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            Form(
              key: _form,
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Skill , tidak boleh kosong";
                  } else {
                    for (int i = 0; i < skilC.dataSkil.length; i++) {
                      if (value == skilC.dataSkil[i]) {
                        return "Skill sudah ada pada list";
                      } else {}
                    }
                  }
                },
                controller: skilC.textC,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: ColorHelpers.fieldColor,
                    filled: true,
                    hintText: 'Masukan Skill disini'),
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorHelpers.colorNavbarProfile),
                    onPressed: () {
                      if (_form.currentState!.validate()) {
                        Map<String, dynamic> temp = {
                          'id': Random.secure(),
                          'skill': skilC.textC.text
                        };
                        skilC.addToList(temp);
                      }
                    },
                    child: Text('add to list')),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorHelpers.backgroundBlueNew),
                    onPressed: () async {
                      SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();
                      int? id = sharedPreferences.getInt('id');
                      if (skilC.dataSkil.isEmpty) {
                        Get.snackbar(
                            'failed', 'Tambahkan skill terlebih dahulu');
                      } else {
                        bool isTrue =
                            await skilC.saveSkill(skilC.dataSkil, id!);
                        if (isTrue) {
                          Get.snackbar('Succes', 'Berhasil  menambahkan skill');
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).pop();
                        } else {
                          Get.snackbar('failed', 'Gagal menambahkan skill');
                        }
                      }
                    },
                    child: Text('Save')),
              ],
            ),
            Obx(
              () => Expanded(
                child: ListView.builder(
                  itemCount: skilC.dataSkil.length,
                  itemBuilder: (context, index) {
                    if (index % 2 != 0) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: ColorHelpers.colorNavbarProfile),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  skilC.dataSkil[index]['skill'],
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    var id = skilC.dataSkil[index]['id'];
                                    Get.snackbar('Konfirmasi ',
                                        'Kamu yakin ingin menghapus skill ? ',
                                        duration: Duration(seconds: 1),
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor:
                                            ColorHelpers.yelloColor,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        snackStyle: SnackStyle.FLOATING,
                                        mainButton: TextButton(
                                            onPressed: () async {
                                              bool result =
                                                  await skilC.deleteSkill(id);
                                              if (result) {
                                                Get.snackbar('Success',
                                                    'Berhasil Menghapus Skill');
                                                // ignore: use_build_context_synchronously
                                                Navigator.of(context).pop();
                                              } else {
                                                Get.snackbar('failed',
                                                    'Gagal Menghapus Skill');
                                              }
                                            },
                                            child: Text('Delete sekarang')));
                                  },
                                  icon: Icon(Icons.highlight_remove),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: ColorHelpers.colorSplash,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  skilC.dataSkil[index]['skill'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    var id = skilC.dataSkil[index]['id'];
                                    Get.snackbar('Konfirmasi ',
                                        'Kamu yakin ingin menghapus skill ? ',
                                        duration: Duration(seconds: 1),
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor:
                                            ColorHelpers.yelloColor,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        snackStyle: SnackStyle.FLOATING,
                                        mainButton: TextButton(
                                            onPressed: () async {
                                              bool result =
                                                  await skilC.deleteSkill(id);
                                              if (result) {
                                                Get.snackbar('Success',
                                                    'Berhasil Menghapus Skill');
                                                // ignore: use_build_context_synchronously
                                                Navigator.of(context).pop();
                                              } else {
                                                Get.snackbar('failed',
                                                    'Gagal Menghapus Skill');
                                              }
                                            },
                                            child: Text('Delete sekarang')));
                                  },
                                  icon: Icon(Icons.highlight_remove),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
