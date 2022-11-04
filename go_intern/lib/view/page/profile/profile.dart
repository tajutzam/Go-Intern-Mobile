import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:go_intern/view/page/profile/update_data.dart';

class ProfilePage extends StatelessWidget {
  List data = ["Tentang Saya", "Pendidikan", "Skill", "Penghargaan"];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorHelpers.backgroundOfIntroduction,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: ColorHelpers.backgroundBlueNew,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 15),
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: ColorHelpers.fieldColor,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage("https://picsum.photos/200"),
                          ),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 20, top: 15),
                    //   child: IconButton(
                    //       onPressed: () {

                    //       },
                    //       icon: Icon(
                    //         Icons.,
                    //         color: Colors.white,
                    //         size: 30,
                    //       )),
                    // )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: Text(
                    "Ucup Sarucup",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_sharp,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Indonesia,Kalimantan barat",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: "Times",
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                )
              ],
            )
            // child: Expanded(
            //   child: ListTile(),
            // ),
            ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 0.5,
                      offset: Offset(7, 10),
                      color: Color(0xff1E1E1E).withOpacity(.2),
                      spreadRadius: -4),
                ],
              ),
              child: Column(
                // cek data lengkap tidak
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Text(
                      "Ayo Lengkapi datamu",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                      child: IconButton(
                          onPressed: () {
                            Get.to(() => UpdateScrenn());
                          },
                          icon: Icon(
                            Icons.note_alt,
                            size: 40,
                            color: ColorHelpers.colorBlackText,
                          )))
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 4,
              separatorBuilder: (context, index) => Divider(
                height: 4,
                color: ColorHelpers.backgroundOfIntroduction,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          blurRadius: 0.5,
                          offset: Offset(7, 10),
                          color: Color(0xff1E1E1E).withOpacity(.2),
                          spreadRadius: -4),
                    ]),
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data[index],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 220,
                            height: 35,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: ColorHelpers.backgroundBlueNew),
                              onPressed: () {
                                if (index == 0) {
                                  Get.toNamed("/tentang-saya");
                                } else if (index == 1) {
                                  Get.toNamed("/pendidikan");
                                } else if (index == 2) {
                                  Get.toNamed("/skill");
                                } else if (index == 3) {
                                  Get.toNamed("/penghargaan");
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Tambahkan ${data[index]}",
                                    textAlign: TextAlign.start,
                                  ),
                                  Icon(Icons.add)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(),
      ),
    );
  }
}
