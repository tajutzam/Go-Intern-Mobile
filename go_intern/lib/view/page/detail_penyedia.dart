import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/model/magang_penyedia.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:go_intern/helpers/url.dart';
import 'package:go_intern/view/page/detail_magang.dart';
import 'package:go_intern/view/page/detail_magang_popular.dart';

class DetailPenyediaPopular extends StatelessWidget {
  DetailPenyediaPopular(
      {super.key,
      required this.namaPerusahaan,
      required this.email,
      required this.jumlahMagang,
      required this.alamat,
      required this.foto,
      required this.jumlahMagangtersedia,
      required this.dataMagang});
  String namaPerusahaan;
  String email;
  int jumlahMagangtersedia;
  String alamat;
  String foto;
  int jumlahMagang;

  MagangPenyedia? dataMagang;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelpers.colorBackground,
      appBar: AppBar(
        backgroundColor: ColorHelpers.backgroundBlueNew,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Detail Company popular',
          style: TextStyle(
              fontSize: 17, fontFamily: 'poppins', fontWeight: FontWeight.w500),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            color: ColorHelpers.backgroundBlueNew,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20 ,),
                child: Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 5),
                    child: ListView(
                      children: [
                        Center(
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: CachedNetworkImage(
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              fit: BoxFit.cover,
                              imageUrl:
                                  UrlHelper.baseUrlImagePenyedia + foto,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(70),
                                  image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nama Perusahaan',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'poppins',
                                  fontWeight: FontWeight.w500,
                                  color: ColorHelpers.colorBlackText),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.end,
                                namaPerusahaan,
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  
                                    fontSize: 17,
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.w500,
                                    color: ColorHelpers.colorBlackText),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'poppins',
                                  fontWeight: FontWeight.w500,
                                  color: ColorHelpers.colorBlackText),
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                textAlign: TextAlign.end,
                                email,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.w500,
                                    color: ColorHelpers.colorBlackText),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Jumlah Lamaran Masuk',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'poppins',
                                  fontWeight: FontWeight.w500,
                                  color: ColorHelpers.colorBlackText),
                            ),
                            Text(
                              jumlahMagang.toString(),
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'poppins',
                                  fontWeight: FontWeight.w500,
                                  color: ColorHelpers.colorBlackText),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Alamat',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'poppins',
                                  fontWeight: FontWeight.w500,
                                  color: ColorHelpers.colorBlackText),
                            ),
                            // SizedBox(
                            //   width: 10,
                            // ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                alamat,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.w500,
                                    color: ColorHelpers.colorBlackText),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Text(
                      'Magang Yang masih kosong $jumlahMagangtersedia',
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w500,
                          color: ColorHelpers.colorBlackText),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              dataMagang == null
                  ? Center(
                      child: Text('tidak ada data magang'),
                    )
                  : Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                            height: 10,
                          ),
                          shrinkWrap: true,
                          itemCount: dataMagang!.body.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      dataMagang!.body[index].posisiMagang,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontFamily: 'poppins',
                                          fontWeight: FontWeight.w500,
                                          color: ColorHelpers.colorBlackText),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Rp.${dataMagang!.body[index].salary}",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontFamily: 'poppins',
                                              fontWeight: FontWeight.w500,
                                              color: ColorHelpers
                                                  .colorBlackText),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          child: SizedBox(
                                            height: 40,
                                            width: 100,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        ColorHelpers
                                                            .backgroundBlueNew),
                                                onPressed: () {
                                                  Get.to(DetailMagangPopular(
                                                      magangMain: dataMagang,
                                                      index: index));
                                                },
                                                child: Text('Detail')),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
            ],
          ),
        ],
      ),
    );
  }
}
