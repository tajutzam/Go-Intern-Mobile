import 'dart:convert';

import 'package:go_intern/helpers/url.dart';
import 'package:http/http.dart' as http;

class LowonganMagangRepository {

  Future<http.Response> addLowongan(
      {idMagang, idPencariMagang, idPenyediaMagang}) async {
    var url = "${UrlHelper.baseUrl}/lowonganmagang/addlowongan";
    var data = {
      "id_magang": idMagang,
      "id_pencariMagang": idPencariMagang,
      "id_penyediaMagang": idPenyediaMagang
    };
    var response = await http.post(Uri.parse(url), body: jsonEncode(data));
    return response;
  }
  
}
