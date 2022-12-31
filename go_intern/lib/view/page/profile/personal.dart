// ignore_for_file: implementation_imports, unnecessary_import, unused_import

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/controllers/UserController.dart';
import 'package:go_intern/APP/controllers/dashboardcontroller.dart';
import 'package:go_intern/APP/controllers/logincontroller.dart';
import 'package:go_intern/APP/controllers/personalcontroller.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:go_intern/helpers/url.dart';
import 'package:go_intern/view/page/homepage.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class PersonalScrenn extends StatelessWidget {
  PersonalScrenn({super.key});
  var personalC = Get.find<PersonalController>();
  final _form = GlobalKey<FormState>();
  var logC = Get.find<LoginController>();
  var usC = Get.find<UserController>();
  var botC = Get.find<ControllerBottom>();
  var dashC = Get.find<DashboardController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: ColorHelpers.colorBlackText,
            )),
        title: Text(
          'Personal data',
          style: TextStyle(
              fontSize: 20,
              fontFamily: 'poppins',
              color: ColorHelpers.colorBlackText),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Form(
                key: _form,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Center(
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
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
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
                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles(
                                        type: FileType.custom,
                                        allowedExtensions: [
                                          'jpg',
                                          'png',
                                          'jpeg'
                                        ],
                                        allowMultiple: false,
                                        dialogTitle: 'Select image',
                                        allowCompression: true);
                                if (result != null) {
                                  print('not null ${result.files.single.path}');
                                  print('not null ${result.files.single.path}');
                                  SharedPreferences sharedPreferences =
                                      await SharedPreferences.getInstance();
                                  var username =
                                      sharedPreferences.getString('username');
                                  dashC.getDataUser(
                                      username, result.files.single.path, '');
                                  print(dashC.interactChange);
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 3,
                                      color: Color(0xff66A6FC),
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        4,
                                      ),
                                    ),
                                    color: Color(0xff66A6FC),
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
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    TextFormField(
                      controller: personalC.namalengkapC,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "tidak boleh kosong";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Nama lengkap',
                          hintText: 'Masukan Nama Lengkap',
                          fillColor: ColorHelpers.fieldColor,
                          filled: true,
                          border: InputBorder.none),
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    TextFormField(
                      controller: personalC.emaillengkapC,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "tidak boleh kosong";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Masukan Email',
                        fillColor: ColorHelpers.fieldColor,
                        filled: true,
                        border: InputBorder.none,
                      ),
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "Tanggal Lahir tidak boleh kosong";
                        }
                        return null;
                      },
                      controller: personalC.tanggalLahirC,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.calendar_month_sharp),
                          filled: true,
                          fillColor: ColorHelpers.fieldColor,
                          hintText: "Masukan Tanggal Lahir mu"),
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            initialDate: DateTime.now(),
                            context: context,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101));
                        if (pickedDate != null) {
                          String formatDate =
                              DateFormat("yyyy-M-dd").format(pickedDate);
                          personalC.tanggalLahirC.text = formatDate;
                        }
                      },
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    DropdownSearch(
                      selectedItem: personalC.agamaC.text == "not set"
                          ? "Pilih agamau"
                          : personalC.agamaC.text,
                      items: const [
                        "Islam",
                        "kristen",
                        "Budha",
                        "Hindu",
                        "Konghucu"
                      ],
                      onSaved: (newValue) {
                        personalC.agamaC.text = newValue;
                      },
                      onChanged: (value) {
                        personalC.agamaC.text = value;
                      },
                      popupProps: PopupProps.menu(),
                      dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                              fillColor: ColorHelpers.fieldColor,
                              filled: true,
                              border: InputBorder.none,
                              labelText: 'Pilih Agama',
                              hintText: 'Pilih agamamu')),
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    DropdownSearch(
                      selectedItem: personalC.jenisKelaminC.text,
                      onSaved: (value) {
                        value == "Perempuan"
                            ? personalC.jenisKelamin.value = "P"
                            : personalC.jenisKelamin.value = "L";
                      },
                      onChanged: (value) {
                        value == "Perempuan"
                            ? personalC.jenisKelamin.value = "P"
                            : personalC.jenisKelamin.value = "L";
                      },
                      items: const ["Laki-Laki", "Perempuan"],
                      popupProps: PopupProps.menu(),
                      dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                              fillColor: ColorHelpers.fieldColor,
                              filled: true,
                              border: InputBorder.none,
                              labelText: 'Pilih Jenis kelamin')),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorHelpers.backgroundBlueNew),
                  onPressed: () async {
                    if (_form.currentState!.validate()) {
                      var response = await personalC.updateDataPersonal();
                      print(response);
                      if (response == true) {
                        SharedPreferences sharedPreferences =
                            await SharedPreferences.getInstance();
                        var isClear = await sharedPreferences.clear();
                        sharedPreferences.remove('nama');
                        // ignore: use_build_context_synchronously
                        if (isClear) {
                          logC.logout();
                          botC.tabIndex.value = 0;
                          Get.offNamed("/login");
                        }
                      }
                    }
                  },
                  child: Text('Simpan')),
            )
          ],
        ),
      ),
    );
  }
}
