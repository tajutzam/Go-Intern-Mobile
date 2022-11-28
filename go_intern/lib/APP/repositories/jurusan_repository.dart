import 'dart:convert';

import 'package:go_intern/helpers/url.dart';
import 'package:http/http.dart' as http;

class JurusanRepository {
  findAllJurusan() async {
    var url = "${UrlHelper.baseUrl}/jurusan/findall";
    var response = await http.get(Uri.parse(url));
    print(response.body);
    return response;
  }

  findByJurusan(jurusan) async {
    var url = "${UrlHelper.baseUrl}/jurusan/findbyjurusan";
    var data = {"jurusan": jurusan};
    var response = await http.post(Uri.parse(url), body: jsonEncode(data));
    return response;
  }
}
