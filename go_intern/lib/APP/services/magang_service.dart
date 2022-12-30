import 'dart:convert';

import 'package:go_intern/APP/model/magang_limit_response.dart';
import 'package:go_intern/APP/model/magang_response.dart';
import 'package:go_intern/APP/model/magangbykategori_response.dart';
import 'package:go_intern/APP/repositories/magang_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MagangService {
  MagangRepository repository = MagangRepository();

  Future<MagangKategori?> showMagangByKategori({required kategori}) async {
    var response = await repository.showByKategori(kategori: kategori);
    if (response.statusCode == 200) {
      return MagangKategori.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  Future<MagangLimit1?> showMagangLimit() async {
    var response = await repository.showDataMagangLimit1();
    if (response.statusCode == 200) {
      return MagangLimit1.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  Future<bool> batalkanLamaran({required idMagang}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getInt('id');
    var response =
        await repository.batalkanLamaran(idMagang: idMagang, idPencari: id);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<MagangMain?> getDataMagang() async {
    var response = await repository.getDataMagang();
    if (response.statusCode == 200) {
      return MagangMain.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  Future<MagangMain?> findMagangByKeyword({required keyword}) async {
    var response = await repository.findMagangByKeyword(keyword: keyword);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return MagangMain.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }
}
