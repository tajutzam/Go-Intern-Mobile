import 'dart:convert';

import 'package:go_intern/APP/model/magang_penyedia.dart';
import 'package:go_intern/APP/model/penyedia_response.dart';
import 'package:go_intern/APP/repositories/penyedia_repository.dart';

class PenyediaService {
  PenyediaRepository penyediaRepository = PenyediaRepository();

  Future<Penyedia?>getDataPopular() async {
    var response = await penyediaRepository.getDataPopular();
    if (response.statusCode == 200) {
      return Penyedia.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  Future<MagangPenyedia?> getDataMagangPenyedia(var id) async {
    var response = await penyediaRepository.getDataMagangPenyedia(id);
    if (response.statusCode == 200) {
      print(response.body);
      return MagangPenyedia.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);
      return null;
    }
  }
}
