// ignore_for_file: implementation_imports, unnecessary_import

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/model/magang_response.dart';
import 'package:go_intern/APP/model/magangbykategori_response.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:go_intern/helpers/url.dart';
import 'package:go_intern/view/page/detail_magang.dart';
import 'package:go_intern/view/page/detail_magang_kategori.dart';

// ignore: must_be_immutable
class MagangByKategori extends StatelessWidget {
  MagangByKategori(
      {super.key,
      required this.kategori,
      required this.kategoriId,
      required this.dataMagang});

  int kategoriId;
  String kategori;
  List<MagangKategoriBody> dataMagang = [];
  List<MagangMain> convertMagang = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: ColorHelpers.colorBlackText,
              )),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'kategori : $kategori',
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'poppins',
                fontWeight: FontWeight.w500,
                color: ColorHelpers.colorBlackText),
          ),
        ),
        body: dataMagang.isNotEmpty
            ? ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => Divider(
                  color: ColorHelpers.backgroundOfIntroduction,
                ),
                itemCount: dataMagang.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 0.5,
                              offset: Offset(5, 5),
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ListView(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ListTile(
                              title: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  dataMagang[index].posisiMagang,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: ColorHelpers.colorBlackText,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              leading: CachedNetworkImage(
                                imageUrl: UrlHelper.baseUrlImagePenyedia +
                                    dataMagang[index].foto,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    dataMagang[index].namaPerusahaan.toString(),
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: ColorHelpers.colorBlackText),
                                  ),
                                  Text(
                                    dataMagang[index].salary.toString(),
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'poppins',
                                        fontWeight: FontWeight.w500,
                                        color: ColorHelpers.colorBlackText),
                                  )
                                ],
                              ),
                              trailing: Text(
                                dataMagang[index].createAt.toString(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 170),
                              child: SizedBox(
                                height: 30,
                                width: 140,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            ColorHelpers.backgroundBlueNew),
                                    onPressed: () async {
                                      Get.to(() => DetailMagangKategori(
                                          magangMain: dataMagang[index],
                                          index: index));
                                    },
                                    child: Text("Detail Magang")),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : Center(
                child:
                    Text("Tidak ada data magang dengan kategori ${kategori}"),
              ));
  }
}
