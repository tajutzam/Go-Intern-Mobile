import 'package:flutter/material.dart';
// ignore: unnecessary_import, implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:go_intern/helpers/url.dart';

class CvView extends StatelessWidget {
  const CvView({super.key , required this.judul});
  final String judul;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View CV'),
      ),
      body: PDF().cachedFromUrl(
        "${UrlHelper.assets}dokuments/cv/$judul",
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
