
import 'package:flutter/material.dart';
import 'package:go_intern/helpers/color.dart';

class UpdateScrenn extends StatelessWidget {
  const UpdateScrenn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update data pribadi"),
        backgroundColor: ColorHelpers.colorNavbarProfile,
      ),
    );
  }
}