import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/controllers/dashboardcontroller.dart';
import 'package:go_intern/APP/controllers/logincontroller.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:go_intern/helpers/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class DashboardScrenn extends StatelessWidget {
  var data = Get.arguments;
  var dashC = Get.put(DashboardController());
  var loginC = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    // String username = data[0]['username'];
    dashC.onReady;
    return Scaffold(
      backgroundColor: ColorHelpers.backgroundOfIntroduction,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    ColorHelpers.backgroundBlueNew,
                    ColorHelpers.colorNavbarProfile1
                  ]),
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
                        child: Obx(
                          () => CachedNetworkImage(
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            fit: BoxFit.cover,
                            // ignore: unnecessary_null_comparison
                            imageUrl: UrlHelper.baseUrlImagePencariMagang +
                                dashC.foto.toString(),
                            imageBuilder: (context, imageProvider) => Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(70),
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.only(top: 10, left: 20),
                      child: Text(
                        "Hai ,${dashC.username.value}  ayo temukan tempat magang terbaik mu",
                        style: TextStyle(
                            color: ColorHelpers.colorBlackText,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )),
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
              child: CarouselSlider.builder(
                // padding: EdgeInsets.only(bottom: 10),
                // scrollDirection: Axis.horizontal,
                // controller: dashC.scrollController,
                // reverse: true,
                itemBuilder: (context, index, int pageview) {
                  return index % 2 == 0
                      ? Card(
                          elevation: 0,
                          color: Theme.of(context).colorScheme.surfaceVariant,
                          child: Container(
                            width: 230,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 0.5,
                                    offset: Offset(9, 9),
                                    color: Color(0xff1E1E1E).withOpacity(.2),
                                    spreadRadius: -4),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    "Politeknik Negeri Jember",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CachedNetworkImage(
                                      height: 70,
                                      imageUrl: "https://picsum.photos/200",
                                      progressIndicatorBuilder: (context, url,
                                              downloadProgress) =>
                                          CircularProgressIndicator(
                                              value: downloadProgress.progress),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 60),
                                      child: SizedBox(
                                        height: 30,
                                        width: 80,
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            SharedPreferences
                                                sharedPreferences =
                                                await SharedPreferences
                                                    .getInstance();
                                            print(sharedPreferences
                                                .getString('username'));
                                            print(sharedPreferences
                                                .getString('agama'));
                                            print(sharedPreferences
                                                .getString('tentang-saya'));
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: ColorHelpers
                                                  .backgroundBlueNew),
                                          child: Text("Detail"),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      : Card(
                          elevation: 0,
                          color: Theme.of(context).colorScheme.surfaceVariant,
                          child: Container(
                            width: 230,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomRight,
                                  colors: const [
                                    ColorHelpers.colorNavbarProfile,
                                    ColorHelpers.colorNavbarProfile1
                                  ]),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 0.5,
                                    offset: Offset(9, 9),
                                    color: Color(0xff1E1E1E).withOpacity(.2),
                                    spreadRadius: -4),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    "Politeknik Negeri Jember",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CachedNetworkImage(
                                      height: 70,
                                      imageUrl: "https://picsum.photos/200",
                                      progressIndicatorBuilder: (context, url,
                                              downloadProgress) =>
                                          CircularProgressIndicator(
                                              value: downloadProgress.progress),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 60),
                                      child: SizedBox(
                                        height: 30,
                                        width: 80,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: ColorHelpers
                                                  .backgroundBlueNew),
                                          child: Text("Detail"),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                },

                itemCount: 100,
                options: CarouselOptions(
                  autoPlay: true,
                  viewportFraction: 0.6,
                  aspectRatio: 2.0,
                  initialPage: 0,
                  enlargeCenterPage: true,
                ),
              ),
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
            child: SizedBox(
              height: 150,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: const [
                        SizedBox(
                          height: 70,
                          width: 70,
                          child: Image(
                            image: AssetImage("assets/images/komputer.png"),
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
              "Magang yang sesuai dengan mu",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
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
                return Card(
                  elevation: 0,
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  child: Container(
                    width: 230,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: ColorHelpers.backgroundColorValidasi,
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: const [
                            ColorHelpers.colorNavbarProfile,
                            Colors.white
                          ]),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 0.5,
                            offset: Offset(6, 6),
                            color: Color(0xff1E1E1E).withOpacity(.2),
                            spreadRadius: -4),
                      ],
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CachedNetworkImage(
                            imageUrl: "https://picsum.photos/200",
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    CircularProgressIndicator(
                                        value: downloadProgress.progress),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Frontend Engginer',
                                style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                              Expanded(
                                  child: Text(
                                'membutuhkan , intern untuk menangani pada bagian front end menggunakan react',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.w500),
                              )),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        'Politeknik Negeri Jember',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          print('clicked');
                                        },
                                        icon: Icon(
                                          Icons.arrow_forward,
                                          size: 35,
                                          color: ColorHelpers.colorBlackText,
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ),
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
