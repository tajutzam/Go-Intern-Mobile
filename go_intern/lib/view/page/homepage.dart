import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/controllers/UserController.dart';
import 'package:go_intern/APP/controllers/dashboardcontroller.dart';
import 'package:go_intern/APP/controllers/personalcontroller.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:go_intern/view/page/dashboard.dart';
import 'package:go_intern/view/page/magang.dart';
import 'package:go_intern/view/page/profile/profile.dart';
import 'package:go_intern/view/page/recent_apply/recent_applay.dart';

// ignore: must_be_immutable
// ignore: must_be_immutable
class HomePageScrenn extends StatelessWidget {
  var controller = Get.put(ControllerBottom());
  var personalC = Get.put(PersonalController());
  var userC = Get.find<UserController>();
  List apbar = [
    PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          title: Text("Baru Baru ini Apply"),
          automaticallyImplyLeading: false,
          backgroundColor: ColorHelpers.backgroundBlueNew,
        )),
    PreferredSize(
        preferredSize: Size.fromHeight(400),
        child: AppBar(
          title: Text("Profile"),
          automaticallyImplyLeading: false,
          backgroundColor: ColorHelpers.backgroundBlueNew,
        )),
  ];

  buildBottomNavigationMenu(context, ControllerBottom landingPageControlller) {
    return Obx(
      () => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: BottomNavigationBar(
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Dashboard"),
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
          unselectedItemColor: ColorHelpers.colorBot,
          unselectedLabelStyle: TextStyle(color: ColorHelpers.colorBot),
          showUnselectedLabels: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    personalC.fetchdataUser();
    userC.fetchDataCv();
    return Scaffold(
      // appBar: PreferredSize(
      //   child: Obx(() => IndexedStack(
      //         index: controller.tabIndex.value,userData
      //         children: [apbar[0], apbar[1], apbar[2]],
      //       )),
      //   preferredSize: Size.fromHeight(60),
      // ),
      body: Obx(
        () => Center(
          child: IndexedStack(
            sizing: StackFit.loose,
            index: controller.tabIndex.value,
            children: <Widget>[
              DashboardScrenn(),
              Magang(),
              RecentApplyPage(),
              ProfilePage()
            ],
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
