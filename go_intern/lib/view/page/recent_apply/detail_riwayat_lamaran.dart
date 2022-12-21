import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/controllers/recent_controller.dart';
import 'package:go_intern/APP/model/riwayat_lamaran_response.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:go_intern/helpers/url.dart';

// ignore: must_be_immutable
class DetailRiwayatLamaran extends StatelessWidget {
  DetailRiwayatLamaran({super.key, required this.dataMagang});

  RiwayatLamaranBody dataMagang;
  var recentC = Get.put(RecentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelpers.fieldColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Detail Riwayat Lamaran",
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
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
                            imageUrl: UrlHelper.baseUrlImagePenyedia +
                                dataMagang.foto,
                            imageBuilder: (context, imageProvider) => Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: ColorHelpers.colorBlackText),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
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
                            dataMagang.posisi,
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Tanggal Lamar",
                            style: TextStyle(
                                color: ColorHelpers.colorBlackText,
                                fontSize: 17,
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            dataMagang.tanggalLamaran,
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                            dataMagang.status.toUpperCase(),
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
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorHelpers.colorSnackbarfailed),
                      onPressed: () async {
                        var isDelete =
                            await recentC.batalkanLamaran(dataMagang.idMagang);
                        print(dataMagang.idMagang);
                        if (isDelete) {
                          Get.snackbar(
                              'Success', "Berhasil membatalkan lamaran",
                              colorText: Colors.white,
                              backgroundColor: ColorHelpers.colorSnackbar);
                          Get.delete<RecentController>();
                          Get.put(RecentController());
                          Get.offNamed("/home");
                        } else {
                          Get.snackbar('failed', "Gagal membatalkan lamaran",
                              colorText: Colors.white,
                              backgroundColor:
                                  ColorHelpers.colorSnackbarfailed);
                        }
                      },
                      child: Text("BATALKAN LAMARAN")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
