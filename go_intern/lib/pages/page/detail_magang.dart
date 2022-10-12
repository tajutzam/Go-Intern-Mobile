import 'package:flutter/material.dart';
import 'package:go_intern/helpers/color.dart';

class DetailMagang extends StatelessWidget {
  const DetailMagang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorHelpers.backgroundBlueNew,
        title: Text("Detail Magang"),
      ),
      body: Center(child: Text("Detail Magang")),
    );
  }
}
