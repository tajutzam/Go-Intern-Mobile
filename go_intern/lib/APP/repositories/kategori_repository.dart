import 'package:go_intern/helpers/url.dart';
import 'package:http/http.dart' as http;

class KategoriRepo {
  Future<http.Response> findAll() async {
    var url = "${UrlHelper.baseUrl}/kategori/all";
    var response = await http.get(Uri.parse(url));
    return response;
  }
}
