import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:get/get.dart';
import 'package:go_intern/helpers/url.dart';

// ignore: must_be_immutable
class PenghargaanView extends StatelessWidget {
  PenghargaanView({super.key});
  var judul = Get.arguments;
  @override
  Widget build(BuildContext context) {
    print(judul);
    return Scaffold(
      appBar: AppBar(
        title: Text('View Penghargaan'),
      ),
      body: PDF().cachedFromUrl(
        "${UrlHelper.assets}dokuments/penghargaan/${judul[0]['file']}",
        placeholder: (progress) {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
        errorWidget: (error) => Center(
          child: Text('terjadi kesalahan url , ${error.toString()}'),
        ),
      ),
    );
  }
}
