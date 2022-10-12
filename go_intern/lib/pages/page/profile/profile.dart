import 'package:flutter/material.dart';
import 'package:go_intern/helpers/color.dart';

class ProfilePage extends StatelessWidget {
  List data = ["Tentang Saya", "Pendidikan", "Skill", "Penghargaan"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorHelpers.backgroundOfIntroduction,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(200),
            child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: ColorHelpers.backgroundBlueNew,
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
                                image:
                                    NetworkImage("https://picsum.photos/200"),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20, top: 15),
                          child: Icon(
                            Icons.settings,
                            color: Colors.white,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 20),
                      child: Text(
                        "Ucup Sarucup",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
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
                            "Indonesia , Kalimantan barat",
                            style: TextStyle(
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
                )),
        body: ListView.separated(
          itemCount: 4,
          separatorBuilder: (context, index) => Divider(height: 4),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
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
                              Navigator.pushNamed(context, "/tentang-saya");
                            } else if (index == 1) {
                              Navigator.pushNamed(context, "/pendidikan");
                            } else if (index == 2) {
                              Navigator.pushNamed(context, "/skill");
                            } else if (index == 3) {
                              Navigator.pushNamed(context, "/penghargaan");
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
                          )),
                    )
                  ],
                )),
              ),
            );
          },
        ));
  }
}
