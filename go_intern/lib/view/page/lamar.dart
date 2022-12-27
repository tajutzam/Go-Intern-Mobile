// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/controllers/UserController.dart';
import 'package:go_intern/APP/controllers/lowonganController.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:go_intern/view/page/profile/cvView.dart';

class LamarMagangScrenn extends StatelessWidget {
  LamarMagangScrenn(
      {required this.posisi,
      super.key,
      required this.namaPerusahan,
      required this.penyedia,
      required this.idMagang});
  final String namaPerusahan;
  final String posisi;
  final int penyedia;
  final int idMagang;
  final lowonganC = Get.put(LowonganController());
  final _form = GlobalKey<FormState>();
  final UserController usC = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffEEF0FF),
        appBar: AppBar(
          backgroundColor: ColorHelpers.backgroundBlueNew,
          title: Text(
            'Lamar Magang',
            style: TextStyle(
                fontSize: 20, fontFamily: 'poppins', color: Colors.white),
          ),
        ),
        body: Form(
          key: _form,
          child: ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height - 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Kamu Akan melamar ke ${namaPerusahan} sebagai ${posisi}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'poppins',
                            color: ColorHelpers.colorBlackText,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.note_alt_rounded,
                              color: ColorHelpers.colorBlackText,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Resume',
                              style: TextStyle(
                                  color: ColorHelpers.colorBlackText,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'poppins'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Obx(
                            () => DottedBorder(
                              child: lowonganC.cv.value == ""
                                  ? Container(
                                      height: 70,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: ColorHelpers.fieldColor,
                                      ),
                                      child: Center(
                                        child: InkWell(
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
                                                  result.files.single
                                                          .extension !=
                                                      'docx' &&
                                                  result.files.single
                                                          .extension !=
                                                      'doc' &&
                                                  result.files.single
                                                          .extension !=
                                                      'txt') {
                                                Get.snackbar('Failed',
                                                    'Extensions salah , harap pilih pdf atau sejenisnya',
                                                    backgroundColor:
                                                        ColorHelpers
                                                            .colorSnackbar,
                                                    colorText: Colors.white);
                                              } else {
                                                // todo input file penghargaan
                                                lowonganC.cv.value =
                                                    result.files.single.path!;
                                                lowonganC.addCv();
                                                // userC.addPennghargaan(result.files.single.path);
                                              }
                                            } else {
                                              print('canceled by user');
                                            }
                                          },
                                          child: Text(
                                            'Upload File',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'poppins',
                                                color:
                                                    ColorHelpers.colorBlackText,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      height: 70,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: ColorHelpers.fieldColor,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Get.to(() => CvView(
                                                  judul: usC.pathCv.value));
                                            },
                                            child: Text(
                                              'Lihat File',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'poppins',
                                                  color: ColorHelpers
                                                      .colorBlackText),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              FilePickerResult? result =
                                                  await FilePicker.platform
                                                      .pickFiles(
                                                          type: FileType.any,
                                                          allowMultiple: false,
                                                          dialogTitle:
                                                              'Select File Pendukung',
                                                          allowCompression:
                                                              true);
                                              if (result != null) {
                                                if (result.files.single.extension != 'pdf' &&
                                                    result.files.single
                                                            .extension !=
                                                        'docx' &&
                                                    result.files.single
                                                            .extension !=
                                                        'doc' &&
                                                    result.files.single
                                                            .extension !=
                                                        'txt') {
                                                  Get.snackbar('Failed',
                                                      'Extensions salah , harap pilih pdf atau sejenisnya',
                                                      backgroundColor:
                                                          ColorHelpers
                                                              .colorSnackbar,
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
                                              'Update File',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'poppins',
                                                  color: ColorHelpers
                                                      .colorBlackText),
                                            ),
                                          )
                                        ],
                                      )),
                            ),
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          'Upload File dalam Format pdf , maksimal 5MB upload sekali saja , ',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'poppins',
                            color: ColorHelpers.colorBlackText,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.wifi_calling_outlined,
                              color: ColorHelpers.colorBlackText,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Kontak',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'poppins',
                                  color: ColorHelpers.colorBlackText),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "no hp tidak boleh kosoong";
                            }
                            return null;
                          },
                          controller: lowonganC.noHpC,
                          decoration: InputDecoration(
                              fillColor: ColorHelpers.fieldColor,
                              filled: true,
                              border: InputBorder.none,
                              labelText: "No Hp",
                              labelStyle: TextStyle(
                                  fontSize: 20,
                                  color: ColorHelpers.colorBlackText)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.mode_edit_rounded,
                              color: ColorHelpers.colorBlackText,
                            ),
                            Text(
                              'Surat Lamaran',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'poppins',
                                  color: ColorHelpers.colorBlackText,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          'Ceritakan mengapa magang ini cocok bagimu (Optional)',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'poppins',
                              color: ColorHelpers.colorBlackText),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: TextFormField(
                          maxLines: 4,
                          controller: lowonganC.suratLamaran,
                          decoration: InputDecoration(
                              fillColor: ColorHelpers.fieldColor,
                              filled: true,
                              border: InputBorder.none,
                              labelText: 'Isi Surat Lamaran',
                              labelStyle: TextStyle(
                                  fontSize: 20,
                                  color: ColorHelpers.colorBlackText)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () async {
                      // todo lamar
                      if (lowonganC.cv.value == "") {
                        Get.snackbar('failed',
                            'Harap lengkapi resume kamu terlebih dahulu',
                            colorText: Colors.white,
                            backgroundColor: ColorHelpers.colorSnackbarfailed);
                      } else {
                        if (_form.currentState!.validate()) {
                          EasyLoading.show(status: "Tunggu sebentar . . .");
                          if (lowonganC.checkBeforeSend()) {
                            var response = await lowonganC.addLowongan(
                                idMagang: idMagang, idPenyediaMagang: penyedia);
                            lowonganC.updateNoHp(lowonganC.noHpC.text);
                            lowonganC.noHp.value =
                                int.parse(lowonganC.noHpC.text);
                            if (response) {
                              EasyLoading.dismiss();
                              Get.offNamed('/home');
                            } else {
                              EasyLoading.dismiss();
                              print('gagal upload');
                            }
                          } else {
                            EasyLoading.dismiss();
                            print('tidak lengkap');
                          }
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorHelpers.backgroundBlueNew),
                    child: Text(
                      'Lamar Sekarang',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'poppins',
                          color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
