import 'dart:convert';

import 'package:go_intern/helpers/url.dart';
import 'package:http/http.dart' as http;

class PenyediaRepository {
  Future<http.Response> getDataPopular() async {
    var url = "${UrlHelper.baseUrl}/penyedia/popular";
    var response = await http.get(Uri.parse(url));
    return response;
  }

  Future<http.Response> getDataMagangPenyedia(idPenyedia) async {
    var url = "${UrlHelper.baseUrl}//magang/by/penyedia";
    var data = {"idPenyedia": idPenyedia};
    var response = await http.post(Uri.parse(url), body: jsonEncode(data));
    return response;
  }
}
