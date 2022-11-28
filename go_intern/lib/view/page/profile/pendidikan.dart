import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/controllers/UserController.dart';
import 'package:go_intern/APP/controllers/logincontroller.dart';
import 'package:go_intern/APP/model/sekolah_response.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:go_intern/helpers/url.dart';
import 'package:intl/intl.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class Pendidikan extends StatelessWidget {
  Pendidikan({super.key});

  var userC = Get.put(UserController());
  var losC = Get.put(LoginController());
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorHelpers.colorNavbarProfile,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: Get.back,
          icon: Icon(
            Icons.arrow_back,
          ),
          color: Colors.black,
        ),
        title: Text(
          "Pendidikan Saya",
          style: TextStyle(
              color: ColorHelpers.colorBlackText,
              fontFamily: "",
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Obx(
        () => ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Form(
                    key: _form,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nama Sekolah",
                          style: TextStyle(
                            color: ColorHelpers.colorBlackText,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: ColorHelpers.fieldColor,
                          ),
                          child: DropdownSearch<String>(
                            selectedItem: losC.dataSekolahUser.isEmpty
                                ? ""
                                : losC.dataSekolahUser['body'][0]
                                    ['nama_sekolah'],
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "harap pilih data sekolah terlebih dahulu";
                              } else {
                                return null;
                              }
                            },
                            popupProps: PopupProps.menu(
                              isFilterOnline: true,
                              showSelectedItems: true,
                              showSearchBox: true,
                              emptyBuilder: (context, searchEntry) {
                                return Center(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            ColorHelpers.colorNavbarProfile),
                                    onPressed: () {
                                      Get.bottomSheet(
                                        BottomSheet(
                                          animationController:
                                              userC.animationController,
                                          onClosing: () {},
                                          builder: (context) => Container(
                                            height: 400,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(8),
                                                    topRight:
                                                        Radius.circular(8))),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ListView(
                                                shrinkWrap: true,
                                                children: [
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Nama Sekolah',
                                                        style: TextStyle(
                                                          color: ColorHelpers
                                                              .colorBlackText,
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            userC.sekolahC,
                                                        decoration: InputDecoration(
                                                            border:
                                                                OutlineInputBorder(),
                                                            hintText:
                                                                'Nama Sekolah'),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Jurusan',
                                                        style: TextStyle(
                                                          color: ColorHelpers
                                                              .colorBlackText,
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      DropdownSearch<String>(
                                                        dropdownDecoratorProps:
                                                            DropDownDecoratorProps(
                                                                dropdownSearchDecoration:
                                                                    InputDecoration(
                                                                        border:
                                                                            OutlineInputBorder(),
                                                                        labelText:
                                                                            'Cari data jurusan')),
                                                        popupProps:
                                                            PopupProps.menu(
                                                                showSelectedItems:
                                                                    true,
                                                                showSearchBox:
                                                                    true),
                                                        items:
                                                            userC.datajurusan,
                                                        onChanged: (value) {
                                                          userC.jurusanTemp
                                                              .value = value!;
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextField(
                                                    minLines: 6,
                                                    maxLines: null,
                                                    keyboardType:
                                                        TextInputType.multiline,
                                                    decoration: InputDecoration(
                                                        labelText: 'Deskripsi',
                                                        hintText:
                                                            'Deskripsi singkat saat kamu sekolah',
                                                        // fillColor:
                                                        //     ColorHelpers.fieldColor,
                                                        // filled: true,
                                                        border:
                                                            OutlineInputBorder()),
                                                  ),
                                                  ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  ColorHelpers
                                                                      .backgroundBlueNew),
                                                      onPressed: () {
                                                        userC
                                                            .addSekolahIfNotExist(
                                                                userC.sekolahC
                                                                    .text);
                                                        userC
                                                            .addSekolahToJurusan(
                                                                userC.sekolahC
                                                                    .text,
                                                                userC
                                                                    .jurusanTemp
                                                                    .value);
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                          'Simpan Data Sekolah'))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text(
                                        'Sekolah tidak ada,tambahkan sekarang'),
                                  ),
                                );
                              },
                            ),
                            items: userC.dataSekolah,
                            onSaved: (newValue) {
                              userC.sekolahTemp.value = newValue!;
                            },
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(),
                            ),
                            onChanged: (value) {
                              userC.sekolahTemp.value = value!;
                            },
                            // selectedItem: "Brazil",
                          ),
                        ),
                        Text(
                          "Jurusan",
                          style: TextStyle(
                            color: ColorHelpers.colorBlackText,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: ColorHelpers.fieldColor,
                          ),
                          child: DropdownSearch<String>(
                            selectedItem: losC.dataSekolahUser.isEmpty
                                ? ""
                                : losC.dataSekolahUser['body'][0]['jurusan'],
                            popupProps: PopupProps.menu(
                              isFilterOnline: true,
                              showSelectedItems: false,
                              showSearchBox: true,
                            ),
                            items: userC.datajurusan,
                            onSaved: (newValue) {
                              userC.jurusanTemp.value = newValue!;
                            },
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(),
                            ),
                            onChanged: (value) {
                              userC.jurusanTemp.value = value!;
                            },
                            // selectedItem: "Brazil",
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Deskripsi Selama Sekolah",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
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
                ),
              ],
            ),
            SizedBox(
              height: 85,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorHelpers.backgroundBlueNew),
                    onPressed: () async {
                      userC.addSekolahToJurusan(
                          userC.sekolahTemp.value, userC.jurusanTemp.value);
                      SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();
                      var id = sharedPreferences.getInt('id');
                      var responseBool = await userC.addDataSekolah(
                          userC.sekolahTemp.value, userC.jurusanTemp.value, id);
                      //interact ever callback
                      losC.interactPendidikan.value++;
                      print(losC.interactPendidikan);
                      print(responseBool);
                      if (responseBool) {
                        Get.snackbar(
                            'success', 'berhasil menambahkan data sekolah');
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      losC.dataSekolahUser.isEmpty ? "Simpan" : "Update",
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: "Times",
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Ticker createTicker(TickerCallback onTick) {
    // TODO: implement createTicker
    throw UnimplementedError();
  }
}
