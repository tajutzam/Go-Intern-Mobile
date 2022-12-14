import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/model/magang_penyedia.dart';
import 'package:go_intern/APP/model/magang_response.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:go_intern/helpers/url.dart';
import 'package:go_intern/view/page/lamar.dart';

// ignore: must_be_immutable
class DetailMagangPopular extends StatelessWidget {
  DetailMagangPopular({required this.magangMain, required this.index});

  MagangPenyedia? magangMain;
  int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEF0FF),
      appBar: AppBar(
        backgroundColor: ColorHelpers.backgroundBlueNew,
        title: Text("Detail Magang"),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        child: ListView(
          children: [
            Container(
              // height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 0.5,
                      offset: Offset(5, 5),
                      color: Colors.grey.withOpacity(0.5),
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: UrlHelper.baseUrlImagePenyedia +
                                magangMain!.body[index].foto,
                            imageBuilder: (context, imageProvider) => Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                magangMain!.body[index].posisiMagang,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: ColorHelpers.colorBlackText),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                magangMain!.body[index].namaPerusahaan,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: ColorHelpers.colorBlackText),
                              ),
                              Text(
                                softWrap: false,
                                magangMain!.body[index].alamat,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: ColorHelpers.colorBlackText),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, top: 10),
                      child: SizedBox(
                        width: double.infinity,
                        height: 10,
                        child: Divider(
                          height: 10,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Deskripsi Pekerjaan",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: ColorHelpers.colorBlackText),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            magangMain!.body[index].deskripsi,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: ColorHelpers.colorBlackText),
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, top: 10),
                      child: SizedBox(
                        width: double.infinity,
                        height: 10,
                        child: Divider(
                          height: 10,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      "Kami Mencari Kandidat terbaik untuk mengisi posisi yang dibutuhkan oleh tim dengan Syarat Sebagai berikut",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: magangMain!.body[index].syarat[0].length,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: Row(
                            children: [
                              Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorHelpers.colorBlackText),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                  magangMain!.body[index].syarat[0][i].syarat,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: Text(
                              "Alamat",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            )),
                        Expanded(
                          child: Text(
                            magangMain!.body[index].alamat,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            width: 100,
                            child: Text(
                              "Gaji",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            )),
                        Expanded(
                          child: Text(
                            "Rp . ${magangMain!.body[index].salary} per bulan",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: Text(
                              "Lowongan Tersedia",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            )),
                        Expanded(
                          child: Text(
                            magangMain!.body[index].lowonganTersedia.toString(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorHelpers.backgroundBlueNew),
                onPressed: () {
                  Get.to(() => LamarMagangScrenn(
                        posisi: magangMain!.body[index].posisiMagang,
                        namaPerusahan: magangMain!.body[index].namaPerusahaan,
                        idMagang: magangMain!.body[index].idMagang,
                        penyedia: magangMain!.body[index].idPenyedia,
                      ));
                },
                child: Text('Lanjut'))
          ],
        ),
      ),
    );
  }
}
