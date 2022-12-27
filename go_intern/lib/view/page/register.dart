import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/controllers/register_controller.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:intl/intl.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:validators/validators.dart';

class RegisterScrenn extends StatelessWidget {
  final registerC = Get.put(RegisterController());

  final _form = GlobalKey<FormState>();
  final _dropdown = GlobalKey<DropdownSearchState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Image.asset(
            "assets/images/register.png",
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Sign Up",
              style: TextStyle(fontSize: 40, fontFamily: "Times"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Form(
            key: _form,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "Username tidak boleh kosong";
                      } else if (!isUppercase(value![0])) {
                        return "Username harus diawali dengan huruf besar";
                      }
                    },
                    controller: registerC.usC,
                    textInputAction: TextInputAction.next,
                    autocorrect: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: ColorHelpers.fieldColor,
                      labelText: "Username",
                      hintText: "Masukan Username",
                      labelStyle:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Obx(
                    () => TextFormField(
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "Password tidak boleh kosong";
                        }
                      },
                      controller: registerC.passC,
                      obscureText: registerC.isHiden1.value,
                      textInputAction: TextInputAction.next,
                      autocorrect: true,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: registerC.toogle1,
                            icon: registerC.isHiden1.value
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility)),
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: ColorHelpers.fieldColor,
                        labelText: "Masukan Password",
                        labelStyle: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "Konfirmasi Password tidak boleh kosong";
                        } else if (value.toString() != registerC.passC.text) {
                          return "Password harus sama";
                        }
                      },
                      controller: registerC.konPasC,
                      obscureText: registerC.isHiden2.value,
                      textInputAction: TextInputAction.next,
                      autocorrect: true,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: registerC.toogle2,
                            icon: registerC.isHiden2.value
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility)),
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: ColorHelpers.fieldColor,
                        labelText: "Konfirmasi Password",
                        labelStyle: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "email tidak boleh kosong";
                      } else if (value.toString().isEmail == false) {
                        return "Email tidak valid";
                      }
                    },
                    controller: registerC.emailC,
                    textInputAction: TextInputAction.next,
                    autocorrect: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: ColorHelpers.fieldColor,
                      labelText: "Masukan Email",
                      labelStyle:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: TextFormField(
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return "Nama Depan tidak boleh kosong";
                            }
                          },
                          controller: registerC.namaC,
                          textInputAction: TextInputAction.next,
                          autocorrect: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: ColorHelpers.fieldColor,
                            hintText: "Masukan Nama Depan",
                            labelText: "Nama Depan",
                            labelStyle: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextFormField(
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return "Nama Belakang tidak boleh kosong";
                            }
                          },
                          controller: registerC.namaBC,
                          textInputAction: TextInputAction.next,
                          autocorrect: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: ColorHelpers.fieldColor,
                            hintText: "Masukan Nama Belakang",
                            labelText: "Nama Belakang",
                            labelStyle: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "Tanggal Lahir tidak boleh kosong";
                      }
                    },
                    controller: registerC.controller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.calendar_month_sharp),
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
                        registerC.controller.text = formatDate;
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: DropdownSearch<String>(
                    validator: (value) {
                      print(value);
                      if (value == null) {
                        return "jenis kelamin tidak boleh kosong";
                      }
                      return null;
                    },
                    dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                            filled: true, fillColor: ColorHelpers.fieldColor)),
                    dropdownButtonProps: DropdownButtonProps(),
                    popupProps: PopupProps.menu(
                      showSelectedItems: true,
                    ),
                    items: const ['Laki-Laki', 'Perempuan'],
                    selectedItem: registerC.jenisKelamin.value,
                    onChanged: (value) {
                      registerC.jenisKelamin.value = value!;
                      print(registerC.jenisKelamin.value);
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorHelpers.backgroundBlueNew),
                      onPressed: () {
                        // todolist register service
                        if (_form.currentState!.validate()) {
                    
                          registerC.register();
                        }
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final List<String> items = [
  'Penyedia',
  'Pelamar',
];

String? selectedValue;
List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
  List<DropdownMenuItem<String>> _menuItems = [];
  for (var item in items) {
    _menuItems.addAll(
      [
        DropdownMenuItem<String>(
          value: item,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ),
        //If it's last item, we will not add Divider after it.
        if (item != items.last)
          const DropdownMenuItem<String>(
            enabled: false,
            child: Divider(),
          ),
      ],
    );
  }
  return _menuItems;
}

List<double> _getCustomItemsHeights() {
  List<double> _itemsHeights = [];
  for (var i = 0; i < (items.length * 2) - 1; i++) {
    if (i.isEven) {
      _itemsHeights.add(40);
    }
    //Dividers indexes will be the odd indexes
    if (i.isOdd) {
      _itemsHeights.add(4);
    }
  }
  return _itemsHeights;
}
