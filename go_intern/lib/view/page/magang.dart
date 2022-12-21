import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/controllers/MagangController.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:go_intern/view/page/dashboard_content/magang_terbaru.dart';
import 'package:go_intern/view/page/dashboard_content/magang_untukmu.dart';

// ignore: must_be_immutable
class Magang extends StatelessWidget {
  var c = Get.put(ControllerTabbar());
  var magangC = Get.put(MagangController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Column(
          children:  [
            SizedBox(
              height: 50,
              child: TextField(
                controller: magangC.keywordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: ColorHelpers.fieldColor,
                  labelText: "Cari Kriteria Magang . .",
                  labelStyle: TextStyle(
                      fontFamily: "Times", fontWeight: FontWeight.w600),
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ],
        ),
        // bottom: TabBar(
        //   labelColor: Colors.black,
        //   indicatorColor: ColorHelpers.backgroundBlueNew,
        //   indicator: UnderlineTabIndicator(
        //       borderSide:
        //           BorderSide(color: ColorHelpers.backgroundBlueNew, width: 3)),
        //   controller: c.tabController,
        //   tabs: const [
        //     Tab(
        //       child: Text("Magang Untukmu",
        //           style: TextStyle(fontSize: 15, fontFamily: "Times")),
        //     ),
        //     Tab(
        //       child: Text("Magang Terbaru",
        //           style: TextStyle(fontSize: 15, fontFamily: "Times")),
        //     )
        //   ],
        // ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "DATA MAGANG YANG TERSEDIA",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'poppins',
                  color: ColorHelpers.colorBlackText),
            ),
          ),
          Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: ColorHelpers.colorBlackText,
              indent: 2,
            ),
          ),
          Expanded(child: MagangUntukmu()),
        ],
      ),
    );
  }
}

class ControllerTabbar extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  final List<Tab> myTabs = <Tab>[
    Tab(
      child: Text(
        "Magang Untukmu",
        style: TextStyle(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400),
      ),
    ),
    Tab(
      child: Text(
        "Magang Terbaru",
        style: TextStyle(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400),
      ),
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
