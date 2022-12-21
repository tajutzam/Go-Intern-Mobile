import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_intern/APP/model/showMagang_response.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:go_intern/helpers/url.dart';

class DetailMagangBerlangsung extends StatelessWidget {
  DetailMagangBerlangsung({super.key, required this.dataMagang});

  BodyMagangActive dataMagang;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelpers.fieldColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Detail Magang Berlangsung",
          style: TextStyle(
              fontSize: 17,
              fontFamily: 'poppins',
              fontWeight: FontWeight.w500,
              color: ColorHelpers.colorBlackText),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: ColorHelpers.colorBlackText,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CachedNetworkImage(
                        errorWidget: (context, url, error) => Text("error"),
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        fit: BoxFit.cover,
                        imageUrl:
                            UrlHelper.baseUrlImagePenyedia + dataMagang.foto,
                        imageBuilder: (context, imageProvider) => Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: ColorHelpers.colorBlackText),
                            borderRadius: BorderRadius.circular(70),
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        dataMagang.namaPerusahaan,
                        style: TextStyle(
                            color: ColorHelpers.colorBlackText,
                            fontSize: 17,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Colors.white,
                ),
                Divider(
                  color: Colors.white,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Posisi Magang",
                        style: TextStyle(
                            color: ColorHelpers.colorBlackText,
                            fontSize: 17,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        dataMagang.posisiMagang,
                        style: TextStyle(
                            color: ColorHelpers.colorBlackText,
                            fontSize: 17,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Email Perusahaan",
                        style: TextStyle(
                            color: ColorHelpers.colorBlackText,
                            fontSize: 17,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Expanded(
                        child: Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          dataMagang.email,
                          style: TextStyle(
                              color: ColorHelpers.colorBlackText,
                              fontSize: 17,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Mulai Magang",
                        style: TextStyle(
                            color: ColorHelpers.colorBlackText,
                            fontSize: 17,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        dataMagang.startOn,
                        style: TextStyle(
                            color: ColorHelpers.colorBlackText,
                            fontSize: 17,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Selesai Magang",
                        style: TextStyle(
                            color: ColorHelpers.colorBlackText,
                            fontSize: 17,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        dataMagang.finishOn,
                        style: TextStyle(
                            color: ColorHelpers.colorBlackText,
                            fontSize: 17,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      Text(
                        "Sisa Waktu Magang",
                        style: TextStyle(
                            color: ColorHelpers.colorBlackText,
                            fontSize: 17,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        dataMagang.durasi,
                        style: TextStyle(
                            color: ColorHelpers.colorBlackText,
                            fontSize: 17,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Status Magang",
                        style: TextStyle(
                            color: ColorHelpers.colorBlackText,
                            fontSize: 17,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        "ACC",
                        style: TextStyle(
                            color: ColorHelpers.colorBlackText,
                            fontSize: 17,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
