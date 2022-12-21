import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/controllers/UserController.dart';
import 'package:go_intern/APP/controllers/recent_controller.dart';
import 'package:go_intern/APP/model/showMagang_response.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:go_intern/helpers/url.dart';
import 'package:go_intern/view/page/recent_apply/detail_magang_berlangsung.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class MagangBerlangsung extends StatelessWidget {
  var userC = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    var recentC = Get.put(RecentController());
    // ignore: prefer_is_empty
    return FutureBuilder <ShowMagangActiveResponse?>(
      future: recentC.showMagangActive(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) =>
                Divider(color: ColorHelpers.backgroundOfIntroduction),
            itemCount: snapshot.data!.body.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 0.5,
                        offset: Offset(5, 5),
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CachedNetworkImage(
                        imageUrl: UrlHelper.baseUrlImagePenyedia +
                            snapshot.data!.body[index].foto,
                        width: 100,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data!.body[index].posisiMagang,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'poppins',
                                    color: ColorHelpers.colorBlackText),
                              ),
                              Text(
                                snapshot.data!.body[index].namaPerusahaan,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontSize: 15,
                                    color: ColorHelpers.colorBlackText,
                                    fontWeight: FontWeight.w500),
                              ),
                              Expanded(
                                child: Text(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    "${snapshot.data!.body[index].startOn}sd${snapshot.data!.body[index].finishOn}"),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: ColorHelpers.backgroundBlueNew),
                          onPressed: () {
                            Get.to(() => DetailMagangBerlangsung(
                                dataMagang: snapshot.data!.body[index]));
                          },
                          child: Text("Detail Magang"))
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                  width: 250,
                  height: 250,
                  child: Lottie.asset("assets/lotties/thinking.json")),
              Text(
                "Tidak ada Magang yang berlansung",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'poppins',
                    color: ColorHelpers.colorBlackText,
                    fontWeight: FontWeight.w500),
              )
            ]),
          );
        }
      },
    );
  }
}
