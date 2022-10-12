import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:go_intern/pages/page/dashboard.dart';
import 'package:go_intern/pages/page/profile/profile.dart';
import 'package:go_intern/pages/page/recent_apply/recent_applay.dart';

class HomePageScrenn extends StatelessWidget {
  var controller = Get.put(ControllerBottom());

  List apbar = [
    PreferredSize(
        child: AppBar(
          title: Text("Baru Baru ini Apply"),
          automaticallyImplyLeading: false,
          backgroundColor: ColorHelpers.backgroundBlueNew,
        ),
        preferredSize: Size.fromHeight(100)),
    PreferredSize(
        child: AppBar(
          title: Text("Profile"),
          automaticallyImplyLeading: false,
          backgroundColor: ColorHelpers.backgroundBlueNew,
        ),
        preferredSize: Size.fromHeight(400)),
  ];

  buildBottomNavigationMenu(context, ControllerBottom landingPageControlller) {
    return Obx(() => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: BottomNavigationBar(
            // ignore: prefer_const_literals_to_create_immutables
            items: [
              const BottomNavigationBarItem(
                  icon: Icon(Icons.work), label: "Magang"),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.work_history), label: "Baru-baru Ini Apply"),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile")
            ],
            currentIndex: controller.tabIndex.value,
            onTap: controller.changeTabIndex,
            selectedItemColor: ColorHelpers.backgroundBlueNew,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   child: Obx(() => IndexedStack(
      //         index: controller.tabIndex.value,
      //         children: [apbar[0], apbar[1], apbar[2]],
      //       )),
      //   preferredSize: Size.fromHeight(60),
      // ),
      body: Center(
        child: Obx(
          () => IndexedStack(
            index: controller.tabIndex.value,
            // ignore: prefer_const_literals_to_create_immutables
            children: [DashboardScrenn(), RecentApplyPage(), ProfilePage()],
          ),
        ),
      ),
      bottomNavigationBar:
          buildBottomNavigationMenu(context, ControllerBottom()),
    );
  }
}

class ControllerBottom extends GetxController {
  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
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
