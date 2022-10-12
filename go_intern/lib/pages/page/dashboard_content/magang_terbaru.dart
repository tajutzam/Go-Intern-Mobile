import 'package:flutter/material.dart';
import 'package:go_intern/helpers/color.dart';

class MagangTerbaru extends StatelessWidget {
  const MagangTerbaru({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(),
      itemCount: 10,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(6))),
          child: ListTile(
            title: Text("oke"),
            leading: FlutterLogo(),
            subtitle: Text("halo"),
            trailing: SizedBox(
              height: 30,
              width: 140,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: ColorHelpers.backgroundBlueNew),
                  onPressed: () {
                    Navigator.pushNamed(context, "/detailmagang");
                  },
                  child: Text("Detail Magang")),
            ),
          ),
        ),
      ),
    );
  }
}
