import 'package:flutter/material.dart';
import 'package:go_intern/helpers/color.dart';

class RecentApplyPage extends StatelessWidget {
  const RecentApplyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorHelpers.backgroundBlueNew,
        title: Text("Recent Apply"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text("Recent"),
      ),
    );
  }
}
