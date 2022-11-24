import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:go_intern/helpers/url.dart';
import 'package:http/http.dart' as http;

class SkilRepository {
  // ignore: prefer_typing_uninitialized_variables
  bool isSucces = false;
  Future<bool> saveSkill(List list, int id) async {
    // ignore: prefer_typing_uninitialized_variables
    final url = "${UrlHelper.baseUrl}/skill/add";
    http.Response response;

    for (var i = 0; i < list.length; i++) {
      var dataPost = {"skill": list[i]['skill'], "pencari_magang": id};
      response = await http.post(
        Uri.parse(url),
        body: jsonEncode(dataPost),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "Access-Control-Allow-Methods": "POST"
        },
      );
      var status = jsonDecode(response.body);
      if (status['status'] == 'ok') {
        Get.snackbar('succes', status['message']);
        isSucces = true;
      } else {
        Get.snackbar('failed', status['message']);
        isSucces = false;
      }
    }
    return isSucces;
  }

  Future<http.Response> showSkils(id) async {
    var url = "${UrlHelper.baseUrl}/skill/showskillbypencari/$id";
    var response = await http.get(Uri.parse(url));
    print(response.body);
    return response;
  }

  Future<http.Response> deleteSkill(id) async {
    var url = "${UrlHelper.baseUrl}/skill/delete";
    Map<String, dynamic> data = {"id": id};
    var response =
        await http.delete(Uri.parse(url), body: jsonEncode(data), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      "Access-Control-Allow-Methods": "DELETE"
    });
    return response;
  }
}
