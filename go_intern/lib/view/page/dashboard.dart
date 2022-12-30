import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/controllers/MagangController.dart';
import 'package:go_intern/APP/controllers/dashboardcontroller.dart';
import 'package:go_intern/APP/controllers/location_controller.dart';
import 'package:go_intern/APP/controllers/logincontroller.dart';
import 'package:go_intern/APP/controllers/personalcontroller.dart';
import 'package:go_intern/APP/model/magang_limit_response.dart';
import 'package:go_intern/APP/model/magang_response.dart';
import 'package:go_intern/APP/model/magangbykategori_response.dart';
import 'package:go_intern/APP/model/penyedia_response.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:go_intern/helpers/url.dart';
import 'package:go_intern/view/page/detail_magang_limit.dart';
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
  var magangC = Get.put(MagangController());
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
                        "Hai ,${dashC.nama}  ayo temukan tempat magang terbaik mu",
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
            child: FutureBuilder<Penyedia?>(
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
                                    snapshot.data!.body[index].namaPerusahaan,
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
                                          snapshot.data!.body[index].foto,
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
                                                .getDataMagangPenyedia(snapshot
                                                    .data!.body[index].id);
                                            Get.to(
                                              () => DetailPenyediaPopular(
                                                namaPerusahaan: snapshot.data!
                                                    .body[index].namaPerusahaan,
                                                email: snapshot
                                                    .data!.body[index].email,
                                                jumlahMagang: snapshot
                                                    .data!.body[index].jumlah,
                                                alamat: snapshot
                                                    .data!
                                                    .body[
                                                        index] // padding: EdgeInsets.only(bottom: 10),
                                                    // scrollDirection: Axis.horizontal,
                                                    // controller: dashC.scrollController,
                                                    // reverse: true,
                                                    .alamatPerusahaan,
                                                foto: snapshot
                                                    .data!.body[index].foto,
                                                jumlahMagangtersedia: snapshot
                                                    .data!
                                                    .body[index]
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
                      itemCount: snapshot.data!.body.length,
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
                height: 100,
                child: FutureBuilder(
                  future: dashC.getKategori(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () async {
                                  List<MagangKategoriBody> dataToSend = [];
                                  var data = await magangC.showMagangKategori(
                                      snapshot.data!.body[index].id);
                                  if (data != null) {
                                    dataToSend = data;
                                  } else {}
                                  Get.to(() => MagangByKategori(
                                      dataMagang: dataToSend,
                                      kategori:
                                          snapshot.data!.body[index].kategori,
                                      kategoriId:
                                          snapshot.data!.body[index].id));
                                },
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    CachedNetworkImage(
                                      imageUrl: UrlHelper.kategoriImg +
                                          snapshot.data!.body[index].foto,
                                      height: 40,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      snapshot.data!.body[index].kategori
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(
                                  width: 20,
                                ),
                            itemCount: snapshot.data!.body.length);
                      } else {
                        return Center(
                          child: Text("Tidak ada data kategori"),
                        );
                      }
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )),
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
              child: FutureBuilder<MagangLimit1?>(
                future: dashC.getMagangLimit(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => SizedBox(
                          height: 40,
                        ),
                        itemCount: snapshot.data!.body.length, // ambil api
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 0,
                            color: Theme.of(context).colorScheme.surfaceVariant,
                            child: Container(
                              width: 230,
                              height: 150,
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
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CachedNetworkImage(
                                        width: 150,
                                        imageUrl:
                                            UrlHelper.baseUrlImagePenyedia +
                                                snapshot.data!.body[index].foto,
                                        progressIndicatorBuilder: (context, url,
                                                downloadProgress) =>
                                            CircularProgressIndicator(
                                                value:
                                                    downloadProgress.progress),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            snapshot.data!.body[index].posisi,
                                            style: TextStyle(
                                                fontFamily: 'poppins',
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Expanded(
                                              child: Text(
                                            snapshot
                                                .data!.body[index].deskripsi,
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
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    snapshot.data!.body[index]
                                                        .namaPerusahaan,
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                IconButton(
                                                    onPressed: () {
                                                      Get.to(() =>
                                                          DetailMagangLimit(
                                                              magangMain:
                                                                  snapshot.data!
                                                                          .body[
                                                                      index],
                                                              index: index));
                                                    },
                                                    icon: Icon(
                                                      Icons.arrow_forward,
                                                      size: 35,
                                                      color: ColorHelpers
                                                          .colorBlackText,
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
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Text("Ops data magang limit tidak tersedia"),
                      );
                    }
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ))
        ],
      ),
    );
  }
}

// ignore: must_be_immutable

