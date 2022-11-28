import 'dart:convert';

import 'package:go_intern/APP/model/sekolah_response.dart';
import 'package:go_intern/helpers/url.dart';
import 'package:http/http.dart' as http;

class SekolahRepository {
  getAlldataSekolah() async {
    var url = "${UrlHelper.baseUrl}/sekolah/findall";
    var response = await http.get(Uri.parse(url));
    return response;
  }

  getDataPerjenjang(String jenjang) async {
    var url = "${UrlHelper.baseUrlSekolah}/sekolah/$jenjang?page=1&perPage=100";
    var response = await http.get(Uri.parse(url));
    return response;
  }

  getDataCari(String key) async {
    var url = '${UrlHelper.baseUrlSekolah}/sekolah/s?sekolah=$key';
    var response = await http.get(Uri.parse(url));
    return Sekolah.fromJson(jsonDecode(response.body));
  }

  addSekolah(sekolah) async {
    var url = "${UrlHelper.baseUrl}/sekolah/save";
    var data = {
      "sekolah": sekolah,
    };
    var response = await http.post(Uri.parse(url), body: jsonEncode(data));
    print(response.body);

    return response;
  }

  addJurusanAnnSekolah(sekolah, jurusan) async {
    var url = "${UrlHelper.baseUrl}/sekolah/addjurusantosekolah";
    var data = {"sekolah": sekolah, "jurusan": jurusan};
    var response = await http.post(Uri.parse(url), body: jsonEncode(data));
    print(response.body);
    return response;
  }

  cariSekolah(sekolah) async {
    var url = "${UrlHelper.baseUrl}/sekolah/findbysekolah";
    var data = {"sekolah": sekolah};
    var response = await http.post(Uri.parse(url), body: jsonEncode(data));
    print(response.body);
    return response;
  }
}
