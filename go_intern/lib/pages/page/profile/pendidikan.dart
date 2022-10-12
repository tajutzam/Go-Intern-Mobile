import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:intl/intl.dart';

class Pendidikan extends StatefulWidget {
  const Pendidikan({super.key});

  @override
  State<Pendidikan> createState() => _PendidikanState();
}

class _PendidikanState extends State<Pendidikan> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    controller.text = "";
  }

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
          "Pendidikan Saya",
          style: TextStyle(
              color: ColorHelpers.colorBlackText,
              fontFamily: "",
              fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pendidikan Terakhir",
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
                        popupProps: PopupProps.menu(
                          showSelectedItems: true,
                        ),
                        items: [
                          "SMK",
                          "SMA",
                          "SMP",
                          'DIPLOMA III',
                          'DIPLOMA IV',
                          'SARJANA'
                        ],
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(),
                        ),
                        onChanged: print,
                        // selectedItem: "Brazil",
                      ),
                    ),
                    Text(
                      "Nama Institusi / Sekolah / Kuliah",
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
                        popupProps: PopupProps.menu(
                          showSelectedItems: true,
                        ),
                        items: [
                          "SMK",
                          "SMA",
                          "SMP",
                          'DIPLOMA III',
                          'DIPLOMA IV',
                          'SARJANA'
                        ],
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(),
                        ),
                        onChanged: print,
                        // selectedItem: "Brazil",
                      ),
                    ),
                    Text(
                      "Bidang Studi",
                      style: TextStyle(
                        color: ColorHelpers.colorBlackText,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          fillColor: ColorHelpers.fieldColor),
                    ),
                    Text(
                      "Tanggal Lulus",
                      style: TextStyle(
                        color: ColorHelpers.colorBlackText,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        prefixIcon: Icon(Icons.calendar_month_sharp),
                        filled: true,
                        fillColor: ColorHelpers.fieldColor,
                      ),
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            initialDate: DateTime.now(),
                            context: context,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101));
                        if (pickedDate != null) {
                          String formatDate =
                              DateFormat("yyyy-MMMM-dd").format(pickedDate);
                          setState(() {
                            controller.text = formatDate;
                          });
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Deskripsi",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
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
                      primary: ColorHelpers.backgroundBlueNew),
                  onPressed: () {},
                  child: Text(
                    "Simpan",
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
    );
  }
}
