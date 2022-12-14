import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:go_intern/view/page/recent_apply/magang_berjalan.dart';
import 'package:go_intern/view/page/recent_apply/magang_lampau.dart';

class recent_apply extends StatelessWidget {
  var cY = Get.put(ControllerTabbarrecent());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorHelpers.backgroundBlueNew,
        automaticallyImplyLeading: false,
        title: Text(
          "Recent Apply",
          style: TextStyle(
              fontSize: 20, fontFamily: "Times", fontWeight: FontWeight.bold),
        ),
        bottom: TabBar(
          labelColor: Colors.black,
          controller: cY.tabController,
          indicatorColor: ColorHelpers.backgroundBlueNew,
          indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: Colors.white, width: 3)),
          tabs: const [
            Tab(
              child: Text("Magang Berlangsung",
                  style: TextStyle(
                      fontSize: 15, fontFamily: "Times", color: Colors.white)),
            ),
            Tab(
              child: Text("Magang Terdahulu",
                  style: TextStyle(
                      fontSize: 15, fontFamily: "Times", color: Colors.white)),
            )
          ],
        ),
      ),
      body: TabBarView(
          controller: cY.tabController,
          children: [MagangBerlangsung(), MagangLampau()]),
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
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600),
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

class ControllerTabbarrecent extends GetxController
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
