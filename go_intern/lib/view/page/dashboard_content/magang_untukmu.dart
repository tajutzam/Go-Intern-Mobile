import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/controllers/MagangController.dart';
import 'package:go_intern/APP/model/magang_response.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_intern/helpers/url.dart';
import 'package:go_intern/view/page/detail_magang.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:path_provider/path_provider.dart' as p;

// ignore: must_be_immutable
class MagangUntukmu extends StatelessWidget {
  var magangController = Get.put(MagangController());

  @override
  Widget build(BuildContext context) {
    return magangController.isNull
        ? Center(child: Text('Data Magang Tidak Tersedia'))
        : magangController.magangMain != null
            ? Obx(
                () {
                  return LazyLoadScrollView(
                    scrollOffset: magangController.refreshAuto.value,
                    onEndOfPage: () => magangController.getData(),
                    isLoading: magangController.lastPage,
                    child: ListView.separated(
                      shrinkWrap: true,
                      controller: magangController.scrollController,
                      separatorBuilder: (context, index) => Divider(
                        color: ColorHelpers.backgroundOfIntroduction,
                      ),
                      itemCount: magangController.magangMain!.body.length,
                      itemBuilder: (context, index) {
                        final DateFormat formater = DateFormat.yMMMEd();
                        var formated = formater.format(
                            magangController.magangMain!.body[index].createAt);
                        if (index >= magangController.magangMain!.body.length) {
                          if (!magangController.isDataLoading.value) {
                            magangController.getData();
                          }
                          return Center(
                            child: SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ListTile(
                                    title: Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        magangController.magangMain!.body[index]
                                            .posisiMagang,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: ColorHelpers.colorBlackText,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    leading: CachedNetworkImage(
                                      imageUrl:
                                          "${UrlHelper.baseUrlImagePenyedia}${magangController.magangMain!.body[index].foto}",
                                      progressIndicatorBuilder: (context, url,
                                              downloadProgress) =>
                                          CircularProgressIndicator(
                                              value: downloadProgress.progress),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          magangController.magangMain!
                                              .body[index].namaPerusahaan,
                                          style: TextStyle(
                                              fontSize: 15,
                                              color:
                                                  ColorHelpers.colorBlackText),
                                        ),
                                        Text(
                                            "Rp. ${magangController.magangMain!.body[index].salary}")
                                      ],
                                    ),
                                    trailing: Text(
                                      "${formated}",
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 170),
                                    child: SizedBox(
                                      height: 30,
                                      width: 140,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: ColorHelpers
                                                  .backgroundBlueNew),
                                          onPressed: () async {
                                            Get.to(() => DetailMagang(
                                                  magangMain: magangController
                                                      .magangMain,
                                                  index: index,
                                                ));
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
                    ),
                  );
                },
              )
            : Text("Data tidak ada");
  }
}
