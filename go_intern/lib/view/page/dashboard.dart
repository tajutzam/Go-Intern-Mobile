import 'package:flutter/material.dart';

import 'package:go_intern/helpers/color.dart';

class DashboardScrenn extends StatelessWidget {
  const DashboardScrenn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelpers.backgroundOfIntroduction,
      
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: Container(

            height: 200,
            decoration: BoxDecoration(
              color: ColorHelpers.colorNavbarProfile,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
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
                      "Hai , Ucup sarucup ayo temukan tempat magang terbaik mu",
                      style: TextStyle(
                          color: ColorHelpers.colorBlackText,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
            // child: Expanded(
            //   child: ListTile(),
            // ),
            ),
      ),
      body: ListView(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Divider(
            color: ColorHelpers.backgroundOfIntroduction,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, bottom: 10),
            child: Text(
              "Popular Companies",
              style: TextStyle(
                  color: ColorHelpers.colorBlackText,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: SizedBox(
              height: 150,
              child: ListView.separated(
                  padding: EdgeInsets.only(bottom: 10),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return index % 2 == 0
                        ? Container(
                            width: 230,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 0.5,
                                    offset: Offset(6, 6),
                                    color: Color(0xff1E1E1E).withOpacity(.2),
                                    spreadRadius: -4),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, left: 10),
                                  child: Text(
                                    "Politeknik Negeri Jember",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: ListTile(
                                      leading: Image.network(
                                          "https://picsum.photos/id/${237 + index}/300/300")),
                                ),
                               Container(
                                  margin: const EdgeInsets.only(left: 120),
                                  child: SizedBox(
                                    height: 30,
                                    width: 100,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                ColorHelpers.backgroundBlueNew),
                                        onPressed: () {},
                                        child: Text("Detail" , style: TextStyle(
                                          fontSize: 15
                                        ),)),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            width: 230,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: ColorHelpers.yelloColor,
                              boxShadow: [
                                   BoxShadow(
                                    blurRadius: 0.5,
                                    offset: Offset(6, 6),
                                    color: Color(0xff1E1E1E).withOpacity(.2),
                                    spreadRadius: -4),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, left: 10),
                                  child: Text(
                                    "Politeknik Negeri Jember",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: ListTile(
                                      leading: Image.network(
                                          "https://picsum.photos/id/${237 + index}/300/300")),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 120),
                                  child: SizedBox(
                                    height: 30,
                                    width: 100,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                ColorHelpers.backgroundBlueNew),
                                        onPressed: () {},
                                        child: Text("Detail" , style: TextStyle(
                                          fontSize: 15
                                        ),)),
                                  ),
                                ),
                              ],
                            ),
                          );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        width: 30,
                      ),
                  itemCount: 100),
            ),
          ),
          Divider(
            color: ColorHelpers.backgroundOfIntroduction,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              "Popular Categories",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Container(
              height: 150,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: ColorHelpers.backgroundColorValidasi),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 10.0,
                                offset: Offset(5, 10),
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          child: Center(
                            child: SizedBox(
                              height: 70,
                              width: 70,
                              child: Image(
                                image: AssetImage("assets/images/komputer.png"),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Komputer",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        width: 20,
                      ),
                  itemCount: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "10 List Magang Terbaru",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: ColorHelpers.colorBlackText),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) => SizedBox(
                height: 40,
              ),
              itemCount: 10, // ambil api
              itemBuilder: (context, index) {
                return Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                         BoxShadow(
                                    blurRadius: 0.5,
                                    offset: Offset(7, 7),
                                    color: Color(0xff1E1E1E).withOpacity(.2),
                                    spreadRadius: -4),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Software Engginer",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: ColorHelpers.colorBlackText,
                              fontFamily: 'ubuntu'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "Teknik Informatika",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: ColorHelpers.colorBlackText),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "Rp.500.000",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                            ),
                            FlutterLogo(
                              size: 40,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const  [
                                Icon(Icons.location_on),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Indonesia,jember",
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 100,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          ColorHelpers.backgroundBlueNew),
                                  onPressed: () {},
                                  child: Text(
                                    "detail ",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
