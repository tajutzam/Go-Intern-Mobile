import 'dart:convert';

import 'package:go_intern/APP/model/kategori_response.dart';
import 'package:go_intern/helpers/url.dart';
import 'package:http/http.dart' as http;

class MagangRepository {
  Future<http.Response> showByKategori({required kategori}) async {
    var url = "${UrlHelper.baseUrl}/magang/by/kategori";
    var data = {"kategori": kategori};
    var response = await http.post(Uri.parse(url), body: jsonEncode(data));
    return response;
  }

  Future<http.Response> showDataMagangLimit1() async {
    var url = "${UrlHelper.baseUrl}/magang/limit1";
    var response = await http.get(Uri.parse(url));

    return response;
  }

  Future<http.Response> batalkanLamaran(
      {required idMagang, required idPencari}) async {
    var url = "${UrlHelper.baseUrl}/riwayatlamaran/batalkan";
    var data = {"idMagang": idMagang, "idPencari": idPencari};
    var response = await http.post(Uri.parse(url), body: jsonEncode(data));
    return response;
  }

  Future<http.Response> getDataMagang() async {
    final url = "${UrlHelper.baseUrl}/magang/showmagangall";
    var response = await http.get(Uri.parse(url));
    return response;
  }
}
