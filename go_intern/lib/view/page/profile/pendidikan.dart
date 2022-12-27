import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/controllers/UserController.dart';
import 'package:go_intern/APP/controllers/logincontroller.dart';
import 'package:go_intern/helpers/color.dart';

import 'package:shared_preferences/shared_preferences.dart';

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
                            selectedItem: userC.sekolahTemp.isEmpty
                                ? ""
                                : userC.sekolahTemp.value,
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
                                                        Get.snackbar('success',
                                                            'Succes memambahkan sekolah ,  silahkan pilih sekolah mu',
                                                            backgroundColor:
                                                                ColorHelpers
                                                                    .colorSnackbar,
                                                            colorText:
                                                                Colors.white);
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
                                        'Sekolah tidak tersedia,tambahkan sekarang'),
                                  ),
                                );
                              },
                            ),
                            items: userC.dataSekolah,
                            onSaved: (newValue) {
                              print(newValue);
                              userC.sekolahTemp.value = newValue!;
                            },

                            dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(),
                            ),
                            onChanged: (value) {
                              print(value);
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Harap pilih data jurusan terlebih dahulu";
                              } else {
                                return null;
                              }
                            },
                            selectedItem: userC.jurusanTemp.isEmpty
                                ? ""
                                : userC.jurusanTemp.value,
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
                          "Deskripsi Singkat Selama Sekolah",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Deskripsi sekolah tidak boleh null";
                            } else {
                              return null;
                            }
                          },
                          controller: losC.deskripsiC,
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
                      EasyLoading.show(status: "Tunggu Sebentar . . .");
                      if (_form.currentState!.validate()) {
                        userC.addSekolahToJurusan(
                            userC.sekolahTemp.value, userC.jurusanTemp.value);
                        SharedPreferences sharedPreferences =
                            await SharedPreferences.getInstance();
                        var id = sharedPreferences.getInt('id');
                        var responseBool = await userC.addDataSekolah(
                            userC.sekolahTemp.value,
                            userC.jurusanTemp.value,
                            id);
                        losC.updateDeskripsiSekolah();
                        losC.interactPendidikan.value++;

                        if (responseBool) {
                          EasyLoading.dismiss();
                          Get.snackbar(
                              'success', 'berhasil menambahkan data sekolah',
                              backgroundColor: ColorHelpers.colorSnackbar,
                              colorText: Colors.white);
                          // ignore: use_build_context_synchronously
                          Navigator.pop(context);
                        } else {
                          EasyLoading.dismiss();
                          Get.snackbar(
                              'failed', 'Gagal menambahkan data sekolah',
                              backgroundColor: ColorHelpers.colorSnackbarfailed,
                              colorText: Colors.white);
                        }
                      } else {
                        EasyLoading.dismiss();
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

  Ticker createTicker(TickerCallback onTick) {
    throw UnimplementedError();
  }
}
