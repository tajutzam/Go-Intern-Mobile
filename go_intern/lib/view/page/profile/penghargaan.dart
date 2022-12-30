// ignore_for_file: use_build_context_synchronously

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/controllers/UserController.dart';
import 'package:go_intern/APP/controllers/logincontroller.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:go_intern/view/page/profile/pdfView.dart';

class Penghargaan extends StatelessWidget {
  Penghargaan({super.key});
  final userC = Get.put(UserController());
  final _form = GlobalKey<FormState>();
  // final logC = Get.find<LoginController>();
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
            "Penghargaan Saya",
            style: TextStyle(
                color: ColorHelpers.colorBlackText,
                fontFamily: "",
                fontWeight: FontWeight.w600),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          child: ListView(
            children: [
              Text(
                "Judul Penghargaan",
                style: TextStyle(
                    color: ColorHelpers.colorBlackText,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'poppins'),
              ),
              SizedBox(
                height: 10,
              ),
              Form(
                key: _form,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "judul tidak boleh kosong";
                    } else {
                      return null;
                    }
                  },
                  controller: userC.judulPenghargaan,
                  autocorrect: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4)),
                    hintText: 'Masukan judul penghargaan',
                    filled: true,
                    fillColor: ColorHelpers.fieldColor,
                  ),
                ),
              ),
              Text(
                "File pendukung ",
                style: TextStyle(
                    color: ColorHelpers.colorBlackText,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'poppins'),
              ),
              SizedBox(
                height: 10,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorHelpers.colorBlackText),
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  userC.penghargaanInteract.value == 0
                      ? InkWell(
                          onTap: () async {
                            FilePickerResult? result = await FilePicker.platform
                                .pickFiles(
                                    type: FileType.any,
                                    allowMultiple: false,
                                    dialogTitle: 'Select File Pendukung',
                                    allowCompression: true);
                            if (result != null) {
                              if (result.files.single.extension != 'pdf' &&
                                  result.files.single.extension != 'docx' &&
                                  result.files.single.extension != 'doc' &&
                                  result.files.single.extension != 'txt') {
                                Get.snackbar('Failed',
                                    'Extensions salah , harap pilih pdf atau sejenisnya',
                                    backgroundColor:
                                        ColorHelpers.colorSnackbarfailed,
                                    colorText: Colors.white);
                              } else {
                                // todo input file penghargaan
                                userC.pathPenghargaan.value =
                                    result.files.single.path!;
                                // userC.addPennghargaan(result.files.single.path);
                              }
                            } else {
                              print('canceled by user');
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            height: 60,
                            width: 250,
                            decoration: BoxDecoration(
                              color: ColorHelpers.colorNavbarProfile,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: Text(
                                'Upload file pendukung',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'poppins',
                                  color: ColorHelpers.colorBlackText,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 30,
                              width: 220,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: ColorHelpers.colorBlackText,
                                  ),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Center(
                                    child: Obx(
                                  () => Text(
                                    userC.penghargaan.value,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'poppins',
                                    ),
                                  ),
                                )),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.to(PenghargaanView.new, arguments: [
                                      {"file": userC.penghargaan.value}
                                    ]);
                                    print('pdf view run');
                                  },
                                  child: Container(
                                    width: 100,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: ColorHelpers.colorNavbarProfile,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Center(
                                      child:
                                          Icon(Icons.remove_red_eye_outlined),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
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
                                        userC.pathPenghargaan.value =
                                            result.files.single.path!;
                                        // userC.addPennghargaan(result.files.single.path);
                                      }
                                    } else {
                                      print('canceled by user');
                                    }
                                  },
                                  child: Container(
                                    width: 100,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Color(0xff4356FF),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Center(
                                      child: Icon(Icons.file_upload_outlined),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
                child: userC.penghargaanInteract.value == 0
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorHelpers.backgroundBlueNew,
                        ),
                        onPressed: () async {
                          if (_form.currentState!.validate()) {
                            if (userC.pathPenghargaan.value == "") {
                              Get.snackbar('failed',
                                  'harap pilih dokumen terlebih dahulu',
                                  colorText: Colors.white,
                                  backgroundColor:
                                      ColorHelpers.colorSnackbarfailed);
                            } else {
                              var result = await userC.addPennghargaan(
                                  userC.pathPenghargaan.value,
                                  userC.judulPenghargaan.text);
                              if (result) {
                                Get.snackbar('succes',
                                    'Berhasil menambahkan penghargaan',
                                    colorText: Colors.white,
                                    backgroundColor:
                                        ColorHelpers.colorSnackbar);
                                userC.showDataUser();
                                Navigator.pop(context);
                                userC.dispose();
                              } else {
                                Get.snackbar(
                                    'failed', 'Gagal menambahkan penghargaan',
                                    colorText: Colors.white,
                                    backgroundColor:
                                        ColorHelpers.colorSnackbarfailed);
                              }
                            }
                          }
                        },
                        child: Text('Simpan'))
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorHelpers.backgroundBlueNew,
                        ),
                        onPressed: () async {
                          if (_form.currentState!.validate()) {
                            if (userC.pathPenghargaan.value == "") {
                              Get.snackbar('failed',
                                  'harap pilih dokumen terlebih dahulu',
                                  colorText: Colors.white,
                                  backgroundColor:
                                      ColorHelpers.colorSnackbarfailed);
                            } else {
                              var result = await userC.addPennghargaan(
                                  userC.pathPenghargaan.value,
                                  userC.judulPenghargaan.text);
                              if (result) {
                                Get.snackbar('succes',
                                    'Berhasil  memperbarui penghargaan',
                                    backgroundColor: ColorHelpers.colorSnackbar,
                                    colorText: Colors.white);
                                // userC.penghargaanInteract.value++;
                                userC.showDataUser();
                                Navigator.pop(context);
                                userC.dispose();
                              } else {
                                Get.snackbar(
                                    'failed', 'Gagal menambahkan penghargaan',
                                    colorText: Colors.white,
                                    backgroundColor:
                                        ColorHelpers.colorSnackbarfailed);
                              }
                            }
                          }
                        },
                        child: Text('Update')),
              )
            ],
          ),
        ));
  }
}
