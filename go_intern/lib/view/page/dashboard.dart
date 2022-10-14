import 'package:flutter/material.dart';
import 'package:go_intern/helpers/color.dart';

class DashboardScrenn extends StatelessWidget {
  const DashboardScrenn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelpers.backgroundOfIntroduction,
      body: ListView(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 170,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10.0,
                      offset: Offset(5, 10),
                      color: Colors.grey),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                          image: NetworkImage("https://picsum.photos/200"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Hai , Ucup Sarucup Ayo Temukan Tempat Magang mu ",
                        style: TextStyle(
                            fontSize: 20, color: ColorHelpers.colorBlackText),
                      ),
                    )
                  ],
                ),
              ),
            ),
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
            child: Container(
              height: 150,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                        width: 150,
                        height: 150,
                        decoration:
                            BoxDecoration(color: Colors.amber, boxShadow: [
                          BoxShadow(
                            blurRadius: 10.0,
                            offset: Offset(5, 10),
                            color: Colors.grey,
                          ),
                        ]));
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        width: 10,
                      ),
                  itemCount: 100),
            ),
          )
        ],
      ),
    );
  }
}
