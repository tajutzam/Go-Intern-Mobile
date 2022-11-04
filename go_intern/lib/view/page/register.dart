import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/controllers/register_controller.dart';
import 'package:go_intern/helpers/color.dart';

class RegisterScrenn extends StatelessWidget {
  final registerC = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              textInputAction: TextInputAction.next,
              autocorrect: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                fillColor: ColorHelpers.fieldColor,
                labelText: "Masukan Username",
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
            child: TextField(
              textInputAction: TextInputAction.next,
              autocorrect: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                fillColor: ColorHelpers.fieldColor,
                labelText: "Masukan Nama Lengkap",
                labelStyle:
                    TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Obx(
              () => TextFormField(
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
                  labelStyle:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
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
                  labelStyle:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                dropdownDecoration:
                    BoxDecoration(color: ColorHelpers.fieldColor),
                isExpanded: true,
                hint: Text(
                  'Pilih Role',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: _addDividersAfterItems(items),
                customItemsHeights: _getCustomItemsHeights(),
                value: selectedValue,
                onChanged: (value) {
                  selectedValue = value as String;
                },
                buttonHeight: 40,
                dropdownMaxHeight: 200,
                buttonWidth: 140,
                itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorHelpers.backgroundBlueNew),
                onPressed: () {
                  // todolist register service
                  Get.offNamed("/login");
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
