// ignore_for_file: implementation_imports, unnecessary_import

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_intern/helpers/color.dart';

// ignore: must_be_immutable
class MagangByKategori extends StatelessWidget {
  MagangByKategori(
      {super.key, required this.kategori, required this.kategoriId});

  int kategoriId;
  String kategori;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back , color: ColorHelpers.colorBlackText,)),
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
      body: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => Divider(
          color: ColorHelpers.backgroundOfIntroduction,
        ),
        itemCount: 12,
        itemBuilder: (context, index) {
          // final DateFormat formater = DateFormat.yMMMEd();
          // var formated = formater.format(
          //     magangController.magangMain!.body[index].createAt);
          // if (index >= magangController.magangMain!.body.length) {
          //   if (!magangController.isDataLoading.value) {
          //     magangController.getData();
          //   }
          //   return Center(
          //     child: SizedBox(
          //       height: 24,
          //       width: 24,
          //       child: CircularProgressIndicator(),
          //     ),
          //   );
          // }
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20,
                              color: ColorHelpers.colorBlackText,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      leading: CachedNetworkImage(
                        imageUrl: "https://picsum.photos/200",
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "nama",
                            style: TextStyle(
                                fontSize: 15,
                                color: ColorHelpers.colorBlackText),
                          ),
                          Text("Rp. 1000")
                        ],
                      ),
                      trailing: Text(
                        "asd",
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
                            onPressed: () async {},
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
  }
}
