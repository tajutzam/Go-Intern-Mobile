import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/controllers/dashboardcontroller.dart';
import 'package:go_intern/APP/controllers/location_controller.dart';
import 'package:go_intern/APP/controllers/logincontroller.dart';
import 'package:go_intern/APP/controllers/personalcontroller.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:go_intern/helpers/url.dart';
import 'package:go_intern/view/page/detail_penyedia.dart';
import 'package:go_intern/view/page/magang_kategori.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class DashboardScrenn extends StatelessWidget {
  var data = Get.arguments;
  var dashC = Get.put(DashboardController());
  var loginC = Get.put(LoginController());
  var locationControler = Get.put(LocationController());
  var personalC = Get.put(PersonalController());
  @override
  Widget build(BuildContext context) {
    // String username = data[0]['username'];
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
                            errorWidget: (context, url, error) =>
                                Image.asset("assets/images/woman.png"),
                            imageUrl: UrlHelper.baseUrlImagePencariMagang +
                                dashC.foto.value.toString(),
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
                        "Hai ,${loginC.nama}  ayo temukan tempat magang terbaik mu",
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
              "Perusahaan Populer",
              style: TextStyle(
                  color: ColorHelpers.colorBlackText,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: FutureBuilder(
              future: dashC.getPopularPenyedia(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                        child: Text(
                      'Tidak ada Perusahaan Populer',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'poppins',
                          color: ColorHelpers.colorBlackText),
                    )),
                  );
                } else {
                  return SizedBox(
                    height: 150,
                    child: CarouselSlider.builder(
                      itemBuilder: (context, index, int pageview) {
                        return Card(
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
                                    dashC.dataPopular[index].namaPerusahaan,
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
                                      imageUrl: UrlHelper.baseUrlImagePenyedia +
                                          dashC.dataPopular[index].foto,
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
                                            var responseMagang = await dashC
                                                .getDataMagangPenyedia(dashC
                                                    .dataPopular[index].id);
                                            Get.to(
                                              () => DetailPenyediaPopular(
                                                namaPerusahaan: dashC
                                                    .dataPopular[index]
                                                    .namaPerusahaan,
                                                email: dashC
                                                    .dataPopular[index].email,
                                                jumlahMagang: dashC
                                                    .dataPopular[index].jumlah,
                                                alamat: dashC
                                                    .dataPopular[
                                                        index] // padding: EdgeInsets.only(bottom: 10),
                                                    // scrollDirection: Axis.horizontal,
                                                    // controller: dashC.scrollController,
                                                    // reverse: true,
                                                    .alamatPerusahaan,
                                                foto: dashC
                                                    .dataPopular[index].foto,
                                                jumlahMagangtersedia: dashC
                                                    .dataPopular[index]
                                                    .jumlahMagang,
                                                dataMagang: responseMagang,
                                              ),
                                            );
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
                        );
                      },
                      itemCount: dashC.dataPopular.length,
                      options: CarouselOptions(
                        autoPlay: true,
                        viewportFraction: 0.6,
                        aspectRatio: 2.0,
                        initialPage: 0,
                        enlargeCenterPage: true,
                        reverse: false,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          Divider(
            color: ColorHelpers.backgroundOfIntroduction,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              "Cari Berdasarkan Kategori",
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
                    return InkWell(
                      onTap: () {
                        Get.to(() => MagangByKategori(
                            kategori: dashC.kategory[index].kategori,
                            kategoriId: dashC.kategory[index].id));
                      },
                      child: Column(
                        children: [
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
                            dashC.kategory[index].kategori.toString(),
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        width: 20,
                      ),
                  itemCount: dashC.kategory.length),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Daftar Magang Berbagai Perusahaan",
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
                      color: Colors.white,
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
