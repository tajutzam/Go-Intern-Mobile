// ignore_for_file: unrelated_type_equality_checks

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/controllers/UserController.dart';
import 'package:go_intern/APP/controllers/dashboardcontroller.dart';
import 'package:go_intern/APP/controllers/location_controller.dart';
import 'package:go_intern/APP/controllers/logincontroller.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:go_intern/helpers/url.dart';
import 'package:go_intern/view/page/homepage.dart';
import 'package:go_intern/view/page/profile/cvView.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  List data = ["Tentang Saya", "Pendidikan", "Skill", "Penghargaan"];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var usC = Get.find<UserController>();
  var logC = Get.find<LoginController>();
  var dashC = Get.put(DashboardController());
  var botC = Get.find<ControllerBottom>();
  var locationC = Get.find<LocationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorHelpers.backgroundOfIntroduction,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: ColorHelpers.backgroundBlueNew,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 15),
                      child: Stack(
                        children: [
                          Obx(
                            () => CachedNetworkImage(
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              fit: BoxFit.cover,
                              imageUrl: UrlHelper.baseUrlImagePencariMagang +
                                  dashC.foto.value,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(70),
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                              onTap: () async {
                                SharedPreferences sharedPreferences =
                                    await SharedPreferences.getInstance();
                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles(
                                        type: FileType.custom,
                                        allowedExtensions: [
                                          'jpg',
                                          'png',
                                          'jpeg',
                                          ''
                                        ],
                                        allowMultiple: false,
                                        dialogTitle: 'Select image',
                                        allowCompression: true);
                                if (result != null) {
                                  print('not null ${result.files.single.path}');
                                  var username =
                                      sharedPreferences.getString('username');
                                  await dashC.getDataUser(
                                      username, result.files.single.path, '');
                                  dashC.interactChange++;
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 3,
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        50,
                                      ),
                                    ),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(2, 4),
                                        color: Colors.black.withOpacity(
                                          0.3,
                                        ),
                                        blurRadius: 3,
                                      ),
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Icon(
                                    Icons.edit,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          _scaffoldKey.currentState?.openEndDrawer();
                          print('open drawer');
                        },
                        icon: Icon(
                          Icons.settings,
                          color: Colors.white,
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: Text(
                    logC.nama.value,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_sharp,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Obx(
                        () => Text(
                          locationC.address.value.toString(),
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: "Times",
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
            // child: Expanded(
            //   child: ListTile(),
            // ),
            ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 0.5,
                      offset: Offset(7, 10),
                      color: Color(0xff1E1E1E).withOpacity(.2),
                      spreadRadius: -4),
                ],
              ),
              child: Column(
                // cek data lengkap tidak
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ignore: unrelated_type_equality_checks
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Text(
                        usC.pathCv == ""
                            ? "Aku Bantu lengkapi CV kamu yaa :)"
                            : "Cv sudah ada nih",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 7,
                  ),

                  Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Obx(
                        () => usC.pathCv == ""
                            ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        ColorHelpers.backgroundBlueNew),
                                onPressed: () async {
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles(
                                          type: FileType.any,
                                          allowMultiple: false,
                                          dialogTitle: 'Select File Pendukung',
                                          allowCompression: true);
                                  if (result != null) {
                                    if (result.files.single.extension != 'pdf' &&
                                        result.files.single.extension !=
                                            'docx' &&
                                        result.files.single.extension !=
                                            'doc' &&
                                        result.files.single.extension !=
                                            'txt') {
                                      Get.snackbar('Failed',
                                          'Extensions salah , harap pilih pdf atau sejenisnya',
                                          backgroundColor:
                                              ColorHelpers.colorSnackbar,
                                          colorText: Colors.white);
                                    } else {
                                      // todo input file penghargaan
                                      usC.pathCv.value =
                                          result.files.single.path!;
                                      usC.addCv();
                                      // userC.addPennghargaan(result.files.single.path);
                                    }
                                  } else {
                                    print('canceled by user');
                                  }
                                },
                                child: Text(
                                  'Uppload Cv',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'poppins',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              )
                            : Row(
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            ColorHelpers.backgroundBlueNew),
                                    onPressed: () async {
                                      Get.to(() =>
                                          CvView(judul: usC.pathCv.value));
                                    },
                                    child: Text(
                                      'Lihat CV',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'poppins',
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            ColorHelpers.backgroundBlueNew),
                                    onPressed: () async {
                                      FilePickerResult? result =
                                          await FilePicker.platform.pickFiles(
                                              type: FileType.any,
                                              allowMultiple: false,
                                              dialogTitle:
                                                  'Select File Pendukung',
                                              allowCompression: true);
                                      if (result != null) {
                                        if (result.files.single.extension != 'pdf' &&
                                            result.files.single.extension !=
                                                'docx' &&
                                            result.files.single.extension !=
                                                'doc' &&
                                            result.files.single.extension !=
                                                'txt') {
                                          Get.snackbar('Failed',
                                              'Extensions salah , harap pilih pdf atau sejenisnya',
                                              backgroundColor:
                                                  ColorHelpers.colorSnackbar,
                                              colorText: Colors.white);
                                        } else {
                                          // todo input file penghargaan
                                          usC.pathCv.value =
                                              result.files.single.path!;
                                          usC.addCv();
                                        }
                                      } else {
                                        print('canceled by user');
                                      }
                                    },
                                    child: Text(
                                      'Edit CV',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'poppins',
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                      ))
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 4,
              separatorBuilder: (context, index) => Divider(
                height: 4,
                color: ColorHelpers.backgroundOfIntroduction,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          blurRadius: 0.5,
                          offset: Offset(7, 10),
                          color: Color(0xff1E1E1E).withOpacity(.2),
                          spreadRadius: -4),
                    ]),
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data[index],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 220,
                            height: 35,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      ColorHelpers.backgroundBlueNew),
                              onPressed: () {
                                if (index == 0) {
                                  usC.setValueTentangSaya();
                                  Get.toNamed("/tentang-saya");
                                } else if (index == 1) {
                                  Get.toNamed("/pendidikan");
                                } else if (index == 2) {
                                  Get.toNamed("/skill");
                                } else if (index == 3) {
                                  Get.toNamed("/penghargaan");
                                }
                              },
                              child: Obx(
                                () => Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    logC.dataList.value[index] == ""
                                        ? Text(
                                            "Tambahkan ${data[index]}",
                                            textAlign: TextAlign.start,
                                          )
                                        : Text("Update ${data[index]}",
                                            textAlign: TextAlign.start),
                                    Icon(logC.dataList.value[index] == ""
                                        ? Icons.add
                                        : Icons.edit)
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
          child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 120,
            color: ColorHelpers.colorV2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
              child: Text(
                'Pengaturan Data',
                style: TextStyle(
                    fontSize: 20, fontFamily: 'poppins', color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ListView(
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      onTap: () {
                        Get.toNamed("/personal");
                      },
                      leading: Icon(
                        Icons.sentiment_satisfied_alt_outlined,
                        color: ColorHelpers.colorV2,
                      ),
                      title: Text(
                        'Personal',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Get.toNamed("/keamanan");
                      },
                      leading: Icon(
                        Icons.security,
                        color: ColorHelpers.colorV2,
                      ),
                      title: Text(
                        'Keamanan',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                ListTile(
                  onTap: () {
                    Get.defaultDialog(
                      content: Text(
                        'Dengan menekan ok , kamu akan logout dari akun kamu',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500),
                      ),
                      radius: 4,
                      title: "Perhatian",
                      confirmTextColor: Colors.black,
                      confirm: InkWell(
                        onTap: () async {
                          SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();
                          var isClear = await sharedPreferences.clear();
                          // ignore: invalid_use_of_protected_member
                          if (isClear) {
                            usC.pathCv.value = "";
                            usC.pathPenghargaan.value = "";
                            logC.interactPenghargaan.value = 0;
                            sharedPreferences.remove('penghargaan');
                            logC.logout();
                            logC.dispose();
                            usC.dispose();
                            botC.tabIndex.value = 0;
                            Get.snackbar('Sucess', 'Berhasil logout',
                                backgroundColor: ColorHelpers.colorSnackbar,
                                colorText: Colors.white);
                            Get.offNamed("/login");
                          }
                        },
                        child: Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                              color: ColorHelpers.backgroundBlueNew,
                              borderRadius: BorderRadius.circular(4)),
                          child: Center(
                            child: Text(
                              'OK',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      cancel: InkWell(
                        onTap: () {
                          print('cancel');
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                              color: ColorHelpers.backgroundBlueNew,
                              borderRadius: BorderRadius.circular(4)),
                          child: Center(
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  leading: Icon(Icons.logout),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
